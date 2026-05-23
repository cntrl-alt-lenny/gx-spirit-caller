#!/usr/bin/env python3

"""
permute_batch.py — worklist-driven batch wrapper around
`tools/permute.py`.

Brief 196. Briefs 190 (PR #637) + 193 (PR #640) together skipped
9 picks across two clusters where the failure is mwcc register-
allocation or expression-scheduling drift — `.c` source produces
semantically correct output, but mwcc 2.0/sp1p5 picks different
scratch registers or different CSE / loop unrolling than orig.
The mechanism IS the permuter use case (search the source-shape
space); `tools/permute.py` (brief 098) handles single-shot; this
wrapper drives it against a worklist + budget cap and aggregates
per-pick outcomes.

Why not extend `tools/permute.py` directly?
-------------------------------------------

`tools/permute.py` is the per-function tool — bootstraps the
vendor, normalises the dsd-dis `.s`, runs permuter, reports.
Batch concerns (worklist parsing, per-pick wall-clock allocation,
results JSON, status aggregation, stub-missing skip path) are
orthogonal to the per-function pipeline and bloat the single-
shot CLI.

The wrapper invokes `tools/permute.py <addr> --run --max-seconds
N` as a subprocess per pick. Each subprocess inherits the full
single-shot logic (auto-install, .s normalisation, log streaming,
match detection). The wrapper layer adds:

  - **Worklist parsing** (`docs/research/cluster-b-e-permuter-
    targets.json` and similar files).
  - **Stub-existence gate**: picks without `src/<module>/func_<
    addr>.c` are recorded as `stub_missing` and skipped without
    invoking permuter.
  - **Per-pick wall-clock cap** + **total batch wall-clock cap**.
    Subprocess gets `--max-seconds <per_pick_budget>`; the
    wrapper also enforces an outer `subprocess.run(timeout=…)`
    guard plus a running total against `max-total-seconds`.
  - **Result aggregation**: per-pick `{status, elapsed_seconds,
    best_score, match_path, log_path}` written to a single
    JSON output for downstream consumption (brief 198+
    decomper reads it as the input to the apply-recipe wave).

Worklist schema
---------------

```json
{
  "_schema": "permute_batch worklist (brief 196)",
  "picks": [
    {
      "id": "B-08",
      "module": "main",
      "address": "0x0205da2c",
      "size": 28,
      "name": "func_0205da2c",
      "cluster": "B",
      "hint": "free text"
    },
    ...
  ]
}
```

Only `id`, `module`, `address`, and `name` are required by the
runner; other fields are pass-through metadata that propagates
into the results JSON for documentation purposes.

Result schema
-------------

```json
{
  "_schema": "permute_batch result (brief 196)",
  "worklist": "docs/research/cluster-b-e-permuter-targets.json",
  "started_at": "2026-05-23T13:00:00Z",
  "finished_at": "2026-05-23T13:09:00Z",
  "total_elapsed_seconds": 540.0,
  "budget": {
    "per_pick_seconds": 60,
    "total_seconds": 600,
    "threads": 4
  },
  "picks": [
    {
      "id": "B-08",
      "address": "0x0205da2c",
      "status": "match" | "no_match" | "timeout" | "stub_missing"
                | "import_failed" | "budget_exhausted",
      "elapsed_seconds": 12.3,
      "best_score": 0 | null,    // 0 = byte-match
      "match_path": "perm_work/.../result.c" | null,
      "log_path": "permute_log/func_0205da2c.log" | null,
      "stdout_tail": "last few lines of subprocess stdout",
      "metadata": { ...pass-through fields from worklist... }
    },
    ...
  ],
  "summary": {
    "total_picks": 9,
    "match": 1,
    "no_match": 5,
    "timeout": 1,
    "stub_missing": 2,
    "import_failed": 0,
    "budget_exhausted": 0
  }
}
```

Usage
-----

```bash
# Dry-run: enumerate picks + stub status, no permuter invocation
python tools/permute_batch.py \\
    --worklist docs/research/cluster-b-e-permuter-targets.json \\
    --out build/eur/analysis/permute_batch_results.json \\
    --dry-run

# Real run: 60s per pick, 10min total, 4 threads
python tools/permute_batch.py \\
    --worklist docs/research/cluster-b-e-permuter-targets.json \\
    --out build/eur/analysis/permute_batch_results.json \\
    --per-pick-seconds 60 \\
    --total-seconds 600 \\
    --threads 4
```

Outcomes the wrapper records
-----------------------------

  - **match** — `tools/permute.py --run` exited 0 AND reported
    a byte-match (score 0). `match_path` points at the staged
    result.c.
  - **no_match** — permuter ran to completion (or the per-pick
    cap) without finding a score-0 permutation. `best_score`
    holds the lowest score observed in the run.
  - **timeout** — the subprocess wall-clock cap (with a 30s
    grace period over `--per-pick-seconds`) fired. The pick is
    incomplete; re-run with a larger per-pick budget if needed.
  - **stub_missing** — no `.c` exists at the expected location
    for this pick. Permuter cannot run without source; brief
    196's design surfaces this so brief 198+ knows which picks
    need stubs.
  - **import_failed** — permuter's `import.py` couldn't ingest
    the source + disasm pair. Usually a stub-vs-orig mismatch
    (e.g. wrong function signature in stub). Manual fix needed.
  - **budget_exhausted** — the cumulative wall-clock crossed
    `--total-seconds` before this pick started. Subsequent
    picks are also marked `budget_exhausted`.
"""

from __future__ import annotations

import argparse
import datetime as _dt
import json
import re
import subprocess
import sys
import time
from dataclasses import asdict, dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


# Per-pick subprocess timeout grace period — `tools/permute.py`
# itself caps at `--max-seconds`, but cold-clone + pip-install on
# the first pick can add 30s+ before permuter actually starts.
# The wrapper's outer timeout adds this grace on top to avoid
# false-timeout-killing the install path.
SUBPROCESS_TIMEOUT_GRACE_SECONDS = 30

# Status enum strings (intentionally string-valued, not Enum, so
# the result JSON round-trips cleanly without custom encoders).
STATUS_MATCH = "match"
STATUS_NO_MATCH = "no_match"
STATUS_TIMEOUT = "timeout"
STATUS_STUB_MISSING = "stub_missing"
STATUS_IMPORT_FAILED = "import_failed"
STATUS_BUDGET_EXHAUSTED = "budget_exhausted"


@dataclass
class PickResult:
    id: str
    address: str
    status: str
    elapsed_seconds: float = 0.0
    best_score: int | None = None
    match_path: str | None = None
    log_path: str | None = None
    stdout_tail: str = ""
    metadata: dict = field(default_factory=dict)


# Permuter stdout markers we scrape to detect outcome (without
# parsing the log file). These are stable in `tools/permute.py`'s
# `--run` mode output.
_MATCH_MARKER = re.compile(
    r"^MATCH FOUND.*$|^\s*Match found.*$", re.MULTILINE,
)
_BEST_SCORE_MARKER = re.compile(
    r"best score:?\s*(\d+)", re.IGNORECASE,
)
_LOG_PATH_MARKER = re.compile(
    r"Log:\s+(\S+)", re.IGNORECASE,
)
_IMPORT_FAILED_MARKER = re.compile(
    r"import\.py failed|ERROR: import\.py", re.IGNORECASE,
)


def load_worklist(path: Path) -> tuple[list[dict], dict]:
    """Read a worklist JSON. Returns (picks, top_level_metadata).

    Each pick must have at minimum `id`, `module`, `address`, and
    `name`. Additional fields propagate into the results JSON's
    per-pick `metadata` slot.

    Raises `ValueError` on schema violations (missing required
    field, unparseable address, etc.).
    """
    data = json.loads(path.read_text(encoding="utf-8"))
    picks_raw = data.get("picks", [])
    if not isinstance(picks_raw, list):
        raise ValueError(
            f"{path}: expected `picks` array at top level"
        )
    required = ("id", "module", "address", "name")
    for i, p in enumerate(picks_raw):
        missing = [r for r in required if r not in p]
        if missing:
            raise ValueError(
                f"{path} pick #{i}: missing required fields "
                f"{missing}"
            )
        # Validate address parses as hex.
        addr_s = p["address"]
        if not addr_s.lower().startswith("0x"):
            raise ValueError(
                f"{path} pick #{i}: address {addr_s!r} must be "
                f"hex with 0x prefix"
            )
        int(addr_s, 16)
    metadata = {
        k: v for k, v in data.items()
        if k not in ("picks",)
    }
    return picks_raw, metadata


def stub_path(pick: dict, *, root: Path = ROOT) -> Path:
    """Resolve the expected `.c` stub path for a pick.

    Convention mirrors `tools/permute.py`'s `tu_containing`:
    `src/<module-shortname>/func_<addr_lower_no_prefix>.c`. For
    `main` the dir is `src/main/`; for `ovNNN` it's
    `src/overlay<NNN>/`; for `itcm`/`dtcm` it's
    `src/main/itcm/` and `src/main/dtcm/` respectively (matches
    the per-module config layout).

    Note: this is the canonical NEW-stub location. Existing
    matches may live at `func_<addr>.legacy.c` or in a
    multi-function TU file — `tools/permute.py` resolves those
    via delinks.txt; the wrapper uses this convention only for
    the stub-existence gate (skip vs. run).
    """
    module = pick["module"]
    addr_hex = pick["address"][2:].lower()
    fname = f"func_{addr_hex}.c"
    if module == "main":
        return root / "src" / "main" / fname
    if module in ("itcm", "dtcm"):
        return root / "src" / "main" / module / fname
    if module.startswith("ov"):
        # ov011 → overlay011
        n = module[2:]
        return root / "src" / f"overlay{n}" / fname
    # Defensive fallback — point at src/<module>/ literally.
    return root / "src" / module / fname


def _format_dt(ts: float) -> str:
    """ISO-8601 timestamp with seconds resolution, UTC."""
    return _dt.datetime.fromtimestamp(
        ts, tz=_dt.UTC,
    ).strftime("%Y-%m-%dT%H:%M:%SZ")


def _parse_subprocess_output(text: str) -> tuple[bool, int | None, str | None]:
    """Scrape permute.py --run stdout for outcome markers.

    Returns (match_found, best_score, log_path_relative_to_root).
    `match_found` true when a `MATCH FOUND` line appears; best
    score parsed from the most recent `best score: N` line if
    present; log path from the `Log: <path>` line emitted by the
    wrapper.
    """
    match_found = bool(_MATCH_MARKER.search(text))
    best = None
    best_matches = list(_BEST_SCORE_MARKER.finditer(text))
    if best_matches:
        try:
            best = int(best_matches[-1].group(1))
        except ValueError:
            best = None
    log_path = None
    log_match = _LOG_PATH_MARKER.search(text)
    if log_match:
        log_path = log_match.group(1)
    return match_found, best, log_path


def _classify_subprocess_outcome(
    completed: subprocess.CompletedProcess | None,
    *,
    timed_out: bool,
) -> str:
    """Map subprocess outcome to a status string.

    Precedence:
      1. timed_out → STATUS_TIMEOUT.
      2. import_failed marker in output → STATUS_IMPORT_FAILED.
      3. MATCH FOUND marker → STATUS_MATCH.
      4. otherwise → STATUS_NO_MATCH (permuter ran but didn't
         find a byte-match in the budget).
    """
    if timed_out:
        return STATUS_TIMEOUT
    text = ""
    if completed is not None:
        text = (completed.stdout or "") + (completed.stderr or "")
    if _IMPORT_FAILED_MARKER.search(text):
        return STATUS_IMPORT_FAILED
    if _MATCH_MARKER.search(text):
        return STATUS_MATCH
    return STATUS_NO_MATCH


def build_permute_command(
    pick: dict,
    *,
    per_pick_seconds: int,
    threads: int | None,
    extra_args: list[str] | None = None,
) -> list[str]:
    """Construct the `python tools/permute.py …` argv for one pick."""
    cmd = [
        sys.executable,
        str(ROOT / "tools" / "permute.py"),
        pick["address"],
        "--version", pick.get("version", "eur"),
        "--run",
        "--max-seconds", str(per_pick_seconds),
    ]
    if threads is not None:
        cmd.extend(["--threads", str(threads)])
    if extra_args:
        cmd.extend(extra_args)
    return cmd


def run_one_pick(
    pick: dict,
    *,
    per_pick_seconds: int,
    threads: int | None,
    runner=subprocess.run,
    extra_args: list[str] | None = None,
) -> PickResult:
    """Drive a single pick through permuter. Pure-ish — `runner` is
    injectable so tests don't need a real subprocess.

    Stub-existence gate fires first. When the stub is missing the
    function returns immediately with STATUS_STUB_MISSING.
    """
    metadata = {
        k: v for k, v in pick.items()
        if k not in ("id", "address")
    }

    # Stub-existence gate.
    sp = stub_path(pick)
    if not sp.is_file():
        return PickResult(
            id=pick["id"],
            address=pick["address"],
            status=STATUS_STUB_MISSING,
            elapsed_seconds=0.0,
            best_score=None,
            match_path=None,
            log_path=None,
            stdout_tail=(
                f"stub not found at {sp.relative_to(ROOT)}"
                if sp.is_relative_to(ROOT) else f"stub not found at {sp}"
            ),
            metadata=metadata,
        )

    cmd = build_permute_command(
        pick,
        per_pick_seconds=per_pick_seconds,
        threads=threads,
        extra_args=extra_args,
    )

    start = time.monotonic()
    timed_out = False
    completed: subprocess.CompletedProcess | None = None
    try:
        completed = runner(
            cmd,
            capture_output=True,
            text=True,
            timeout=per_pick_seconds + SUBPROCESS_TIMEOUT_GRACE_SECONDS,
            cwd=str(ROOT),
        )
    except subprocess.TimeoutExpired as e:
        timed_out = True
        # The subprocess may have produced partial output before
        # the timeout fired; stitch what we have together.
        stdout_so_far = (e.stdout or b"").decode(
            "utf-8", errors="replace",
        ) if isinstance(e.stdout, (bytes, bytearray)) else (e.stdout or "")
        stderr_so_far = (e.stderr or b"").decode(
            "utf-8", errors="replace",
        ) if isinstance(e.stderr, (bytes, bytearray)) else (e.stderr or "")
        completed = subprocess.CompletedProcess(
            cmd, returncode=-1,
            stdout=stdout_so_far, stderr=stderr_so_far,
        )

    elapsed = time.monotonic() - start

    out_text = (completed.stdout or "") + (completed.stderr or "")
    match_found, best_score, log_path = _parse_subprocess_output(out_text)
    status = _classify_subprocess_outcome(completed, timed_out=timed_out)
    if status == STATUS_MATCH:
        best_score = 0

    # Tail-truncate stdout for the result JSON (full text already
    # in the log file; results JSON is for human triage).
    stdout_tail = "\n".join(out_text.splitlines()[-12:])

    return PickResult(
        id=pick["id"],
        address=pick["address"],
        status=status,
        elapsed_seconds=elapsed,
        best_score=best_score,
        match_path=None,  # filled by caller after match-path discovery
        log_path=log_path,
        stdout_tail=stdout_tail,
        metadata=metadata,
    )


def run_worklist(
    picks: list[dict],
    *,
    per_pick_seconds: int,
    total_seconds: int,
    threads: int | None,
    dry_run: bool = False,
    runner=subprocess.run,
    extra_args: list[str] | None = None,
) -> list[PickResult]:
    """Iterate picks, enforcing both per-pick and total wall-
    clock budgets. After total cap is exceeded, remaining picks
    are marked `budget_exhausted` and skipped (no subprocess).

    Dry-run mode runs only the stub-existence gate per pick;
    everything else is `budget_exhausted` (with a clearer
    stdout tail).
    """
    results: list[PickResult] = []
    batch_start = time.monotonic()
    for pick in picks:
        elapsed_total = time.monotonic() - batch_start
        if elapsed_total >= total_seconds:
            metadata = {
                k: v for k, v in pick.items()
                if k not in ("id", "address")
            }
            results.append(PickResult(
                id=pick["id"],
                address=pick["address"],
                status=STATUS_BUDGET_EXHAUSTED,
                elapsed_seconds=0.0,
                best_score=None,
                match_path=None,
                log_path=None,
                stdout_tail=(
                    f"total budget {total_seconds}s exhausted "
                    f"before pick {pick['id']} started "
                    f"(elapsed {elapsed_total:.1f}s)"
                ),
                metadata=metadata,
            ))
            continue
        # Dry-run path: stub-existence gate only, no permuter.
        if dry_run:
            sp = stub_path(pick)
            metadata = {
                k: v for k, v in pick.items()
                if k not in ("id", "address")
            }
            if sp.is_file():
                results.append(PickResult(
                    id=pick["id"],
                    address=pick["address"],
                    status=STATUS_NO_MATCH,  # dry-run baseline
                    elapsed_seconds=0.0,
                    stdout_tail=(
                        f"[dry-run] stub exists at "
                        f"{sp.relative_to(ROOT)}; permuter would "
                        f"be invoked here"
                    ),
                    metadata=metadata,
                ))
            else:
                results.append(PickResult(
                    id=pick["id"],
                    address=pick["address"],
                    status=STATUS_STUB_MISSING,
                    elapsed_seconds=0.0,
                    stdout_tail=(
                        f"[dry-run] stub not found at "
                        f"{sp.relative_to(ROOT) if sp.is_relative_to(ROOT) else sp}"
                    ),
                    metadata=metadata,
                ))
            continue
        # Honour the per-pick budget against the remaining total.
        remaining_total = total_seconds - elapsed_total
        effective_per_pick = min(per_pick_seconds, int(remaining_total))
        if effective_per_pick <= 0:
            # No time left to do anything meaningful.
            metadata = {
                k: v for k, v in pick.items()
                if k not in ("id", "address")
            }
            results.append(PickResult(
                id=pick["id"],
                address=pick["address"],
                status=STATUS_BUDGET_EXHAUSTED,
                metadata=metadata,
                stdout_tail=(
                    f"total budget {total_seconds}s exhausted "
                    f"before pick {pick['id']} could be allocated time"
                ),
            ))
            continue
        result = run_one_pick(
            pick,
            per_pick_seconds=effective_per_pick,
            threads=threads,
            runner=runner,
            extra_args=extra_args,
        )
        results.append(result)
    return results


def summarise(results: list[PickResult]) -> dict[str, int]:
    """Per-status counts for the results JSON summary block."""
    counts: dict[str, int] = {}
    for r in results:
        counts[r.status] = counts.get(r.status, 0) + 1
    counts["total_picks"] = len(results)
    return counts


def write_results(
    out_path: Path,
    *,
    results: list[PickResult],
    worklist_path: Path,
    worklist_metadata: dict,
    started_at: float,
    finished_at: float,
    per_pick_seconds: int,
    total_seconds: int,
    threads: int | None,
) -> None:
    """Serialise results + run metadata to JSON."""
    payload = {
        "_schema": "permute_batch result (brief 196)",
        "worklist": str(worklist_path.relative_to(ROOT))
                    if worklist_path.is_relative_to(ROOT)
                    else str(worklist_path),
        "worklist_metadata": worklist_metadata,
        "started_at": _format_dt(started_at),
        "finished_at": _format_dt(finished_at),
        "total_elapsed_seconds": round(finished_at - started_at, 3),
        "budget": {
            "per_pick_seconds": per_pick_seconds,
            "total_seconds": total_seconds,
            "threads": threads,
        },
        "picks": [asdict(r) for r in results],
        "summary": summarise(results),
    }
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(
        json.dumps(payload, indent=2, sort_keys=False) + "\n",
        encoding="utf-8",
    )


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Batch wrapper around tools/permute.py for the Cluster "
            "B + E permuter wave (brief 196)."
        ),
    )
    ap.add_argument(
        "--worklist", type=Path, required=True,
        help="Path to the picks JSON (see schema in module "
             "docstring).",
    )
    ap.add_argument(
        "--out", type=Path, required=True,
        help="Path to write the results JSON.",
    )
    ap.add_argument(
        "--per-pick-seconds", type=int, default=60,
        help="Wall-clock cap per pick (default 60). The "
             "subprocess gets this as --max-seconds; the wrapper "
             "adds a 30s grace before SIGKILL.",
    )
    ap.add_argument(
        "--total-seconds", type=int, default=600,
        help="Wall-clock cap for the entire batch (default 600 "
             "= 10 minutes). Picks not started before this cap "
             "are marked `budget_exhausted`.",
    )
    ap.add_argument(
        "--threads", type=int, default=None,
        help="Passed through to permute.py --threads. Default: "
             "permuter's own default (max(1, ncpu - 1)).",
    )
    ap.add_argument(
        "--dry-run", action="store_true",
        help="Don't invoke permuter. For each pick, run the "
             "stub-existence gate and write a `dry-run` result "
             "with `no_match` (stub present) or `stub_missing`. "
             "Useful for triaging a worklist before committing "
             "real CPU.",
    )
    args = ap.parse_args(argv)

    try:
        picks, worklist_metadata = load_worklist(args.worklist)
    except (OSError, ValueError, json.JSONDecodeError) as e:
        print(
            f"error: failed to load worklist {args.worklist}: {e}",
            file=sys.stderr,
        )
        return 1

    if not picks:
        print(
            f"warning: worklist {args.worklist} has zero picks",
            file=sys.stderr,
        )

    started_at = time.time()
    results = run_worklist(
        picks,
        per_pick_seconds=args.per_pick_seconds,
        total_seconds=args.total_seconds,
        threads=args.threads,
        dry_run=args.dry_run,
    )
    finished_at = time.time()

    write_results(
        args.out,
        results=results,
        worklist_path=args.worklist,
        worklist_metadata=worklist_metadata,
        started_at=started_at,
        finished_at=finished_at,
        per_pick_seconds=args.per_pick_seconds,
        total_seconds=args.total_seconds,
        threads=args.threads,
    )

    summary = summarise(results)
    print(f"permute_batch: wrote {args.out}", file=sys.stderr)
    print(
        f"  {summary.get('total_picks', 0)} picks: "
        f"match={summary.get(STATUS_MATCH, 0)} "
        f"no_match={summary.get(STATUS_NO_MATCH, 0)} "
        f"timeout={summary.get(STATUS_TIMEOUT, 0)} "
        f"stub_missing={summary.get(STATUS_STUB_MISSING, 0)} "
        f"import_failed={summary.get(STATUS_IMPORT_FAILED, 0)} "
        f"budget_exhausted={summary.get(STATUS_BUDGET_EXHAUSTED, 0)}",
        file=sys.stderr,
    )
    # Exit 0 even when 0 matches — the brief recognises 0/9 as a
    # valid (if disappointing) signal. Reserve non-zero exits for
    # hard errors (worklist load, output write).
    return 0


if __name__ == "__main__":
    sys.exit(main())
