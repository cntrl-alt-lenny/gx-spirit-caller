#!/usr/bin/env python3

"""
permute.py — bootstrap (and optionally auto-run) decomp-permuter for a single function.

Decomp-permuter (https://github.com/simonlindholm/decomp-permuter) is
the standard matching-accelerator for NDS/GC/N64 decomps. Given a C
source and a target assembly, it applies bounded random permutations
(variable renames, type juggles, reordering, etc.) and reports which
permutations byte-match the target. Indispensable for any function
larger than ~100 bytes where the "write C that looks right" approach
doesn't converge.

This script is a one-stop helper:

    python tools/permute.py <function>             # show the resolved paths
    python tools/permute.py <function> --print     # print only (don't create dir)
    python tools/permute.py <function> --copy      # also stage files into perm_work/
    python tools/permute.py <function> --run       # auto-install + run permuter (brief 063)

What `--run` does (brief 063):

  1. Ensures decomp-permuter is vendored at `tools/_vendor/decomp-
     permuter/` at the pinned commit, cloning + installing pip deps
     on first invocation.
  2. Stages the work dir (same as `--copy`) including a fresh
     import.py invocation that populates `nonmatchings/<fn>/`.
  3. Subprocesses `permuter.py` against that dir with sensible
     defaults: `-j` = `max(1, ncpu - 1)`, `--stop-on-zero` to exit
     when a byte-match is produced, optional `--seed N`.
  4. Streams the permuter's stdout to `permute_log/<fn>.log` AND
     tail-prints "found new best" / "wrote to ..." lines to the
     calling shell so the decomper sees live progress.
  5. Enforces a wall-clock cap (`--max-seconds`, default 600s)
     because upstream permuter has no built-in iteration cap.
  6. Detects byte-matches by either the `--stop-on-zero` short-
     circuit OR a glob of `nonmatchings/<fn>/output-0-*/source.c`
     after exit. On match, copies the discovered C source to
     `perm_work/<fn>/result.c` and prints a one-liner with the
     copy-back command for the decomper.

Without `--run` the script behaves exactly as before (pure
bootstrap; no subprocess, no side effects beyond `perm_work/`
staging when `--copy` is passed).

Assumes `ninja rom` has run at least once so the target object exists.
If `ninja dis` (disassembly) has also run, the `.s` is picked up too;
otherwise the script tells the decomper what to run first.
"""

from __future__ import annotations

import argparse
import os
import re
import shutil
import subprocess
import sys
import time
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    Symbol,
    discover_modules,
    parse_symbols_file,
)


# --------------------------------------------------------------------------- #
# Auto-install — vendor decomp-permuter at a pinned commit
# --------------------------------------------------------------------------- #

# Path follows the project's tools/_vendor/ convention (already
# `.gitignore`-d, see also `tools/vendor_external_sources.py`).
PERMUTER_VENDOR_DIR = ROOT / "tools" / "_vendor" / "decomp-permuter"
PERMUTER_REPO_URL = "https://github.com/simonlindholm/decomp-permuter.git"

# Pinned upstream HEAD as of 2026-05-14. Bump if upstream lands a CLI
# change that breaks our wrapper (the `--stop-on-zero` flag, the
# `wrote to .*/output-0-` stdout signal, and the
# `output-<score>-<ctr>/source.c` layout are the contract surface).
# To bump: `git -C tools/_vendor/decomp-permuter log -1 --pretty=%H`
# after `git pull`, paste here.
PERMUTER_PINNED_COMMIT = "efc5c5e7d9850f7267323b7dca6b41bc30a42d1f"

# Upstream README's install line (no requirements.txt at repo root):
#   python3 -m pip install pynacl toml Levenshtein
# pynacl is only needed for permuter@home (distributed `-J` mode).
# Skip pynacl in the auto-install path — single-host `-j` mode is
# all this wrapper invokes.
PERMUTER_PIP_DEPS = ("toml", "Levenshtein")


# Match signals in permuter's stdout. Verified against the upstream
# strings in src/main.py at the pinned commit:
#   - "wrote to {output_dir}"   → fires whenever a candidate is
#     persisted. The `output_dir` starts with `output-0-` ONLY when
#     the score is 0 (i.e. byte-identical). This is the reliable
#     match signal.
#   - "found new best score!", "tied best score!", "found a better
#     score!" → progress markers worth tail-printing so the decomper
#     sees the run isn't stalled.
WROTE_OUTPUT_RE = re.compile(r"wrote to .*?(output-(\d+)-\d+)\b")
BEST_SCORE_RE = re.compile(
    r"^(found new best score!|tied best score!|found a better score!|wrote to )"
)


@dataclass
class PermuterRunResult:
    """Outcome of a `--run` invocation. Stable shape for tests."""
    match_found: bool = False
    best_score: int | None = None        # 0 means byte-match
    result_c_path: Path | None = None    # absolute path to the matched source
    log_path: Path | None = None
    timed_out: bool = False
    exit_code: int | None = None
    output_dirs: list[Path] = field(default_factory=list)


def module_symbols_path(config_root: Path, module: str) -> Path:
    arm9 = config_root / "arm9"
    if module == "main":
        return arm9 / "symbols.txt"
    if module in ("itcm", "dtcm"):
        return arm9 / module / "symbols.txt"
    return arm9 / "overlays" / module / "symbols.txt"


def module_delinks_path(config_root: Path, module: str) -> Path:
    arm9 = config_root / "arm9"
    if module == "main":
        return arm9 / "delinks.txt"
    if module in ("itcm", "dtcm"):
        return arm9 / module / "delinks.txt"
    return arm9 / "overlays" / module / "delinks.txt"


def find_function(config_root: Path, needle: str) -> tuple[str, Symbol] | None:
    """Find a function by name or hex address across all modules.
    Returns (module, Symbol) or None."""
    # Address form? Accept '0x021aa4a0' or bare '21aa4a0'.
    target_addr: int | None = None
    if needle.lower().startswith("0x"):
        try:
            target_addr = int(needle, 16)
        except ValueError:
            pass
    elif all(c in "0123456789abcdefABCDEF" for c in needle):
        try:
            target_addr = int(needle, 16)
        except ValueError:
            pass

    for module in discover_modules(config_root):
        syms = parse_symbols_file(module_symbols_path(config_root, module), module)
        for s in syms:
            if not s.is_function:
                continue
            if target_addr is not None and s.addr == target_addr:
                return module, s
            if target_addr is None and s.name == needle:
                return module, s
    return None


def parse_tu_ranges(delinks_path: Path) -> list[tuple[str, int, int]]:
    """Return [(source_file, start_addr, end_addr), ...] from delinks.txt.
    Only matched TU entries (with a `.text` section) are returned.

    delinks.txt layout (canonical):
        src/path/to/file.c:
            complete
            .text start:0xAAAA end:0xBBBB kind:code align:32
            ...
    """
    out: list[tuple[str, int, int]] = []
    if not delinks_path.is_file():
        return out
    current_src: str | None = None
    with delinks_path.open() as f:
        for raw in f:
            line = raw.rstrip()
            if not line.strip() or line.lstrip().startswith("#"):
                continue
            stripped = line.strip()
            # TU header: "src/...:"
            if stripped.endswith(":") and not stripped.startswith(("."  , "start:")):
                current_src = stripped.rstrip(":")
                continue
            # .text section within a TU
            if current_src and stripped.startswith(".text"):
                # Parse "start:0xAAAA end:0xBBBB"
                try:
                    start_tok = next(t for t in stripped.split() if t.startswith("start:0x"))
                    end_tok = next(t for t in stripped.split() if t.startswith("end:0x"))
                    start = int(start_tok.split(":0x", 1)[1], 16)
                    end = int(end_tok.split(":0x", 1)[1], 16)
                    out.append((current_src, start, end))
                except (StopIteration, ValueError):
                    pass
    return out


def tu_containing(delinks_path: Path, addr: int) -> str | None:
    """Return the source file whose .text range covers `addr`, or None
    if this address lies in a _dsd_gap or a not-yet-carved TU."""
    for src, start, end in parse_tu_ranges(delinks_path):
        if start <= addr < end:
            return src
    return None


def expected_object_path(build_root: Path, module: str, source_c: str | None) -> Path | None:
    """Best-guess path to the built .o under build/<ver>/ for the
    containing TU. mwldarm's output tree mirrors src/: if source_c is
    src/main/foo.c, the object is build/<ver>/src/main/foo.o."""
    if source_c is None:
        return None
    source_path = Path(source_c)
    # strip .c / .cpp -> .o
    obj_rel = source_path.with_suffix(".o")
    return build_root / obj_rel


def expected_disasm_path(build_root: Path, module: str, addr: int) -> Path:
    """Where `dsd dis` drops the per-module assembly. Convention taken
    from the decomper's earlier investigation: `build/disasm/` with
    files named by module + _dsd_gap range. This path is indicative;
    the decomper confirms by listing the directory."""
    if module == "main":
        return build_root / "disasm" / f"main_{addr:08x}.s"
    return build_root / "disasm" / f"{module}_{addr:08x}.s"


def render_run_sh(
    function_name: str,
    permuter_path: Path,
    source_c: Path,
    target_s: Path,
) -> str:
    """Render a `run.sh` the decomper can execute from inside the work
    dir. Runs import.py first (if base.c/base.s hasn't been imported
    yet), then the permuter. Idempotent — re-running is safe.

    Paths are emitted ABSOLUTE (via `-f` / `$(pwd)` patterns) so the
    shell script works regardless of what cwd the decomper invokes
    it from."""
    return f"""\
#!/usr/bin/env bash
# Auto-generated by tools/permute.py --copy.
# Runs decomp-permuter against {function_name!s}.

set -euo pipefail
WORK_DIR="$(cd "$(dirname "${{BASH_SOURCE[0]}}")" && pwd)"
PERMUTER_DIR="{permuter_path}"

# Import the source .c + target .s into the permuter's nonmatchings/
# if not already done. import.py is idempotent if you feed it the
# same inputs.
if [ ! -d "${{PERMUTER_DIR}}/nonmatchings/{function_name}" ]; then
    (cd "${{PERMUTER_DIR}}" \\
        && ./import.py "{source_c}" "{target_s}")
fi

# Run the permuter. -j uses all cores; tune as needed.
(cd "${{PERMUTER_DIR}}" \\
    && ./permuter.py "nonmatchings/{function_name}"* -j)
"""


def render_readme(
    function_name: str,
    module: str,
    addr: int,
    source_c: Path,
    target_s: Path,
) -> str:
    """Per-work-dir README. Minimises the "what was I running?"
    context-switch cost when the decomper comes back to a stale
    permuter work dir days later."""
    return f"""\
# `{function_name}` permuter workspace

_Generated by `tools/permute.py --copy` — safe to regenerate._

## Target

- **Function**: `{function_name}`
- **Module**: `{module}`
- **Address**: `0x{addr:08x}`
- **Source `.c`**: `{source_c}`
- **Target `.s`**: `{target_s}`

## How to run

```bash
./run.sh
```

The wrapper calls `decomp-permuter/import.py` once to populate
`decomp-permuter/nonmatchings/`, then `permuter.py` runs the
matching loop in `-j` (all-cores) mode.

## Next steps when the permuter finds a match

1. Copy the matched C body back into the source file at
   `{source_c}`.
2. Run `ninja rom && ninja objdiff && ninja report` to verify
   100% match in the objdiff scorer.
3. Mark the TU `complete` in the module's `delinks.txt` and
   `rename_symbol.py` if the placeholder name needs swapping.
4. Clean up this work dir (`rm -r perm_work/{module}_{function_name}_{addr:08x}`).

## Permuter tuning knobs

- Edit `base.c` to add `PERM_*` macros (see decomp-permuter's
  README for the full list). Typical first-passes:
  - `PERM_TEMP_VAR` for "did the compiler use a temp?"
  - `PERM_RANDOMIZE_TYPE` for int-vs-short swaps
- Re-run `./run.sh` after editing.
"""


def stage_work_dir(
    function_name: str,
    module: str,
    addr: int,
    source_c: Path,
    target_o: Path,
    target_s: Path | None = None,
    permuter_path: Path | None = None,
) -> Path:
    """Create perm_work/<module>_<name>_<addr>/ and populate it
    with the decomp-permuter inputs + a runnable wrapper + README.

    Contents (when all inputs are resolvable):
      base.c     — copy of the source .c
      base.o     — copy of the built object
      run.sh     — executable wrapper for `./import.py + ./permuter.py`
      README.md  — per-work-dir guide

    Backwards-compat: the pre-#161 signature was
    `(function_name, module, addr, source_c, target_o)`. target_s
    and permuter_path default to None; in that case `run.sh` and
    `README.md` aren't written (the work dir is still usable for
    the old flow where the decomper ran import.py manually).
    """
    work_dir = ROOT / "perm_work" / f"{module}_{function_name}_{addr:08x}"
    work_dir.mkdir(parents=True, exist_ok=True)
    if source_c.is_file():
        shutil.copy2(source_c, work_dir / "base.c")
    if target_o.is_file():
        shutil.copy2(target_o, work_dir / "base.o")
    if target_s is not None and permuter_path is not None:
        run_sh = work_dir / "run.sh"
        run_sh.write_text(render_run_sh(
            function_name=function_name,
            permuter_path=permuter_path,
            source_c=source_c,
            target_s=target_s,
        ), encoding="utf-8")
        # chmod +x so `./run.sh` works immediately.
        import stat as _stat
        mode = run_sh.stat().st_mode
        run_sh.chmod(mode | _stat.S_IXUSR | _stat.S_IXGRP)
        (work_dir / "README.md").write_text(render_readme(
            function_name=function_name,
            module=module,
            addr=addr,
            source_c=source_c,
            target_s=target_s,
        ), encoding="utf-8")
    return work_dir


# --------------------------------------------------------------------------- #
# Auto-install — clone + checkout pinned commit, install pip deps
# --------------------------------------------------------------------------- #

def _run_git(args: list[str], cwd: Path | None = None) -> subprocess.CompletedProcess:
    """Thin wrapper to standardise git invocation. Raises on non-zero
    exit. Kept separate so tests can monkeypatch it instead of
    actually shelling out."""
    return subprocess.run(
        ["git", *args],
        cwd=str(cwd) if cwd is not None else None,
        check=True,
        capture_output=True,
        text=True,
    )


def ensure_permuter_installed(
    vendor_dir: Path = PERMUTER_VENDOR_DIR,
    commit: str = PERMUTER_PINNED_COMMIT,
    *,
    run_git=_run_git,
    log=print,
) -> Path:
    """Clone decomp-permuter into `vendor_dir` if absent; checkout the
    pinned commit. Idempotent — calling on an already-installed vendor
    dir is a no-op fast path (HEAD already at pinned commit). Returns
    `vendor_dir`.

    `run_git` is injectable so tests can stub git out. `log` is a
    print-like callable for status messages.

    Does NOT install pip deps — that's a separate step (see
    `install_permuter_deps`) so callers can gate it on a venv check.
    """
    permuter_py = vendor_dir / "permuter.py"
    if permuter_py.is_file():
        # Fast path: check whether HEAD already matches the pin.
        try:
            head = run_git(["rev-parse", "HEAD"], cwd=vendor_dir)
            current = head.stdout.strip()
            if current == commit:
                log(f"  decomp-permuter already at pinned commit {commit[:12]}.")
                return vendor_dir
            log(
                f"  decomp-permuter at {current[:12]}, pinning to "
                f"{commit[:12]}..."
            )
            run_git(["fetch", "origin"], cwd=vendor_dir)
            run_git(["checkout", commit], cwd=vendor_dir)
            return vendor_dir
        except subprocess.CalledProcessError as e:
            log(f"  WARNING: pin check failed ({e}); proceeding with HEAD.")
            return vendor_dir

    # Cold path: clone.
    vendor_dir.parent.mkdir(parents=True, exist_ok=True)
    try:
        vendor_display = vendor_dir.relative_to(ROOT)
    except ValueError:
        vendor_display = vendor_dir
    log(f"  cloning decomp-permuter into {vendor_display}...")
    run_git(["clone", PERMUTER_REPO_URL, str(vendor_dir)])
    log(f"  checking out pinned commit {commit[:12]}...")
    run_git(["checkout", commit], cwd=vendor_dir)
    return vendor_dir


def install_permuter_deps(
    deps: tuple[str, ...] = PERMUTER_PIP_DEPS,
    *,
    python_exe: str | None = None,
    run_pip=None,
    log=print,
) -> None:
    """Install permuter's pip deps into the current Python env. The
    upstream repo has no requirements.txt — its README lists
    `pynacl toml Levenshtein`. We skip `pynacl` because we only run
    single-host `-j` mode, never the distributed `permuter@home` (`-J`)
    mode that uses it.

    `run_pip` is injectable for tests. `python_exe` defaults to
    `sys.executable` (the same Python that's running this script).
    Already-installed deps are pip's no-op fast path; no version
    pinning here intentionally — upstream doesn't pin and we don't
    want to surprise users with a downgrade.
    """
    if not deps:
        return
    py = python_exe or sys.executable
    cmd = [py, "-m", "pip", "install", *deps]
    runner = run_pip or (
        lambda c: subprocess.run(c, check=True, capture_output=True, text=True)
    )
    log(f"  installing pip deps: {' '.join(deps)}...")
    runner(cmd)


# --------------------------------------------------------------------------- #
# Run mode — invoke permuter.py, stream stdout, detect match
# --------------------------------------------------------------------------- #

def _detect_score_from_output_dir(output_dir_name: str) -> int | None:
    """Extract the score from a permuter `output-<score>-<ctr>` dir
    name. Returns None if the format doesn't match."""
    m = re.match(r"^output-(\d+)-\d+$", output_dir_name)
    if m is None:
        return None
    try:
        return int(m.group(1))
    except ValueError:
        return None


def collect_output_dirs(nonmatchings_dir: Path) -> list[Path]:
    """Glob permuter's output dirs after a run. Each dir has
    `source.c` (the permutation), `score.txt`, `diff.txt`. Sorted by
    score ascending so `[0]` is the best (lowest score; 0 = byte-
    match). Idempotent across re-runs (permuter increments `<ctr>` to
    avoid collision)."""
    if not nonmatchings_dir.is_dir():
        return []
    dirs = [
        d for d in nonmatchings_dir.iterdir()
        if d.is_dir() and d.name.startswith("output-")
    ]
    def key(d: Path) -> tuple[int, str]:
        score = _detect_score_from_output_dir(d.name)
        return (score if score is not None else 1 << 30, d.name)
    return sorted(dirs, key=key)


def best_output(nonmatchings_dir: Path) -> tuple[Path | None, int | None]:
    """Return `(dir, score)` of the lowest-score permutation, or
    `(None, None)` if no outputs exist. Score 0 = byte-match."""
    dirs = collect_output_dirs(nonmatchings_dir)
    if not dirs:
        return None, None
    best = dirs[0]
    return best, _detect_score_from_output_dir(best.name)


def run_permuter(
    *,
    vendor_dir: Path,
    nonmatchings_dir: Path,
    function_name: str,
    log_dir: Path,
    threads: int | None = None,
    seed: int | None = None,
    max_seconds: int = 600,
    stop_on_zero: bool = True,
    extra_args: tuple[str, ...] = (),
    popen=None,
    console_print=print,
    sleep=time.sleep,
) -> PermuterRunResult:
    """Invoke `permuter.py` against `nonmatchings_dir` as a subprocess.

    Stream stdout to `log_dir/<function_name>.log`. Enforce a
    wall-clock cap of `max_seconds` (upstream permuter has no
    built-in cap). Return a `PermuterRunResult` summarising the
    outcome — match found, best score, log path, etc.

    `popen` is injectable for tests (defaults to `subprocess.Popen`).
    `sleep` is also injectable to keep the wall-clock loop
    deterministic under test.

    Threads default: `max(1, os.cpu_count() - 1)`. Brief 063's
    rationale — leave one core for the decomper's editor / objdiff
    GUI / shell loops.
    """
    if threads is None:
        ncpu = os.cpu_count() or 2
        threads = max(1, ncpu - 1)

    permuter_py = vendor_dir / "permuter.py"
    cmd: list[str] = [
        sys.executable,
        str(permuter_py),
        str(nonmatchings_dir),
        "-j", str(threads),
    ]
    if stop_on_zero:
        cmd.append("--stop-on-zero")
    if seed is not None:
        cmd.extend(["--seed", str(seed)])
    if extra_args:
        cmd.extend(extra_args)

    log_dir.mkdir(parents=True, exist_ok=True)
    log_path = log_dir / f"{function_name}.log"

    popen_factory = popen or subprocess.Popen

    # Pretty-print the log path relative to ROOT when possible (the
    # common case); fall back to the absolute path for unit tests that
    # exercise run_permuter with tempdir-based logs outside ROOT.
    try:
        log_display = log_path.relative_to(ROOT)
    except ValueError:
        log_display = log_path
    console_print(f"  command: {' '.join(cmd)}")
    console_print(f"  log:     {log_display}")
    console_print(f"  cap:     {max_seconds}s wall-clock")
    console_print(f"  threads: {threads}")
    if seed is not None:
        console_print(f"  seed:    {seed}")
    console_print("")

    result = PermuterRunResult(log_path=log_path)

    with log_path.open("w", encoding="utf-8") as log_file:
        proc = popen_factory(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            bufsize=1,
        )
        start = time.monotonic()
        try:
            # Two cooperative loops: a wall-clock check + stdout drain.
            # The stdout drain is what actually moves the loop forward;
            # we just check elapsed each iteration and kill on overrun.
            if proc.stdout is None:
                proc.wait(timeout=max_seconds)
            else:
                while True:
                    raw = proc.stdout.readline()
                    if raw == "" and proc.poll() is not None:
                        break
                    if raw:
                        log_file.write(raw)
                        log_file.flush()
                        line = raw.rstrip()
                        if BEST_SCORE_RE.match(line):
                            console_print(f"  permuter: {line}")
                    elapsed = time.monotonic() - start
                    if elapsed >= max_seconds:
                        console_print(
                            f"  WALL-CLOCK CAP ({max_seconds}s) reached; "
                            f"terminating permuter."
                        )
                        proc.terminate()
                        try:
                            proc.wait(timeout=10)
                        except subprocess.TimeoutExpired:
                            proc.kill()
                        result.timed_out = True
                        break
                    if not raw:
                        # Brief sleep avoids a busy-wait while we're
                        # waiting on the child's next stdout line.
                        sleep(0.05)
            result.exit_code = proc.wait()
        except KeyboardInterrupt:
            console_print("  KeyboardInterrupt — terminating permuter.")
            proc.terminate()
            result.exit_code = proc.wait()
            raise

    # Outcome assessment is the same regardless of why we stopped:
    # glob `output-0-*` for the match, otherwise pick the lowest-score
    # dir as the "best so far".
    result.output_dirs = collect_output_dirs(nonmatchings_dir)
    best_dir, best_score = best_output(nonmatchings_dir)
    result.best_score = best_score
    if best_dir is not None and best_score == 0:
        result.match_found = True
        result.result_c_path = best_dir / "source.c"
    return result


def copy_match_to_perm_work(
    *,
    result_c: Path,
    perm_work_dir: Path,
) -> Path:
    """On a byte-match, copy permuter's output `source.c` to
    `perm_work/<...>/result.c` so the decomper has a stable
    well-known path to copy back into `src/`. Returns the
    destination."""
    perm_work_dir.mkdir(parents=True, exist_ok=True)
    dst = perm_work_dir / "result.c"
    shutil.copy2(result_c, dst)
    return dst


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Bootstrap (and optionally auto-run) decomp-permuter "
                    "for a single function"
    )
    ap.add_argument("function", help="Function name or hex address (0x...)")
    ap.add_argument("--version", default="eur",
                    help='Game version under config/<version>/ (default: "eur")')
    ap.add_argument("--permuter-path", type=Path, default=None,
                    help="Path to a local decomp-permuter checkout. "
                         "Default in `--run` mode: tools/_vendor/decomp-permuter "
                         "(auto-installed). Default otherwise: ../decomp-permuter "
                         "(matches pre-#161 muscle memory).")
    ap.add_argument("--copy", action="store_true",
                    help="Also stage source+object into perm_work/<name>/")
    ap.add_argument("--print", action="store_true",
                    help="Only print resolved paths; don't stage anything")

    # Brief 063 — auto-runner mode.
    run_group = ap.add_argument_group(
        "auto-runner mode (brief 063)",
        "Auto-install + run permuter. Implies --copy.",
    )
    run_group.add_argument("--run", action="store_true",
                           help="Auto-install permuter (if needed) and run "
                                "the matching loop against this function.")
    run_group.add_argument("--threads", type=int, default=None,
                           help="Worker thread count. Default: max(1, ncpu-1).")
    run_group.add_argument("--seed", type=int, default=None,
                           help="Permuter RNG seed (default: permuter's own time-based seed).")
    run_group.add_argument("--max-seconds", type=int, default=600,
                           help="Wall-clock cap in seconds for the permuter run "
                                "(default: 600 = 10 minutes). Upstream permuter "
                                "has no built-in cap; the wrapper enforces this.")
    run_group.add_argument("--no-stop-on-zero", action="store_true",
                           help="Don't pass --stop-on-zero (continue searching "
                                "after a match found — useful for collecting "
                                "multiple matching permutations).")
    run_group.add_argument("--skip-install", action="store_true",
                           help="Don't auto-clone / pip-install — assume the "
                                "vendor dir is already populated.")

    args = ap.parse_args()

    config_root = ROOT / "config" / args.version
    build_root = ROOT / "build" / args.version

    hit = find_function(config_root, args.function)
    if hit is None:
        print(
            f"ERROR: function {args.function!r} not found in "
            f"config/{args.version}/**/symbols.txt",
            file=sys.stderr,
        )
        return 2
    module, sym = hit

    source_c_rel = tu_containing(module_delinks_path(config_root, module), sym.addr)
    source_c_abs = (ROOT / source_c_rel) if source_c_rel else None
    target_o = expected_object_path(build_root, module, source_c_rel)
    disasm_s = expected_disasm_path(build_root, module, sym.addr)

    print(f"Function:    {sym.name}")
    print(f"  module:    {module}{'  [FAIL module]' if module in {'main','dtcm','ov004'} else ''}")
    print(f"  address:   0x{sym.addr:08x}")
    print(f"  size:      0x{sym.size:x} bytes ({sym.size} B)")
    print(f"  mode:      {sym.mode}")
    print()

    if source_c_rel is None:
        print("Source TU:   (not carved yet — no .c file covers this address)")
        print("  Action:    add a TU entry to "
              f"{module_delinks_path(config_root, module).relative_to(ROOT)}")
        print("             and create the corresponding .c in src/…")
    else:
        exists = "exists" if source_c_abs and source_c_abs.is_file() else "NOT YET CREATED"
        print(f"Source TU:   {source_c_rel}  [{exists}]")

    if target_o is not None:
        exists = "exists" if target_o.is_file() else "run `ninja rom` to produce"
        print(f"Target .o:   {target_o.relative_to(ROOT)}  [{exists}]")
    else:
        print("Target .o:   (unknown — depends on source TU resolution above)")

    exists = "exists" if disasm_s.is_file() else "run `ninja dis` (or the dsd dis equivalent) first"
    print(f"Target .s:   {disasm_s.relative_to(ROOT)}  [{exists}]")
    print()

    # Default permuter path: in `--run` mode use the vendored copy
    # (auto-installed); otherwise preserve the pre-#161 default so
    # the bootstrap mode's printed commands keep matching muscle
    # memory.
    if args.permuter_path is None:
        permuter_path = (
            PERMUTER_VENDOR_DIR if args.run else Path("../decomp-permuter")
        )
    else:
        permuter_path = args.permuter_path

    if args.print:
        return 0

    if args.copy or args.run:
        if source_c_abs is None or target_o is None:
            print(
                "ERROR: --copy / --run requires both source and target "
                "to be resolvable.",
                file=sys.stderr,
            )
            return 1
        work_dir = stage_work_dir(
            sym.name, module, sym.addr, source_c_abs, target_o,
            target_s=disasm_s,
            permuter_path=permuter_path,
        )
        print(f"Staged at:   {work_dir.relative_to(ROOT)}/")
        print("  run.sh:    ./perm_work/.../run.sh (executable)")
        print("  README.md: per-work-dir guide")
        print()

    if not args.run:
        print("Next step — run decomp-permuter's import.py:")
        print()
        if source_c_abs and target_o:
            print(f"  cd {permuter_path}")
            print(f"  ./import.py {source_c_abs} {disasm_s}")
            print()
            print("Then:")
            print(f"  ./permuter.py nonmatchings/{sym.name}*  -j")
        else:
            print("  (resolve the missing source or target paths above first)")
        return 0

    # --run path: auto-install (idempotent), invoke import.py if the
    # nonmatchings dir doesn't exist yet, then run permuter.
    return _run_mode(
        args=args,
        sym=sym,
        module=module,
        source_c_abs=source_c_abs,
        disasm_s=disasm_s,
        permuter_path=permuter_path,
    )


def _run_mode(
    *,
    args,
    sym: Symbol,
    module: str,
    source_c_abs: Path | None,
    disasm_s: Path,
    permuter_path: Path,
) -> int:
    """Body of the `--run` path. Kept separate from `main()` so the
    bootstrap path stays linear-easy-to-read and tests can target
    the run mode without driving the whole CLI."""
    # Windows users: upstream README explicitly recommends WSL for the
    # `-j` single-host mode (multiprocessing + pycparser pickle quirks).
    # Don't block — just emit a warning so brain knows what they're in
    # for if they invoke this on native Windows.
    if sys.platform == "win32":
        print(
            "  WARNING: decomp-permuter's upstream README recommends WSL for "
            "native Windows hosts. Single-host `-j` mode may stall on "
            "pycparser pickle errors. Continuing anyway — bail with Ctrl-C "
            "if stuck.",
            file=sys.stderr,
        )

    # Disasm gate — permuter needs the `.s`.
    if not disasm_s.is_file():
        print(
            f"ERROR: target asm not found at {disasm_s.relative_to(ROOT)}.\n"
            f"  Run dsd's disassembly step first, then re-run --run.",
            file=sys.stderr,
        )
        return 1
    if source_c_abs is None or not source_c_abs.is_file():
        print(
            "ERROR: source .c not resolvable — see Source TU line above.",
            file=sys.stderr,
        )
        return 1

    # 1. Auto-install (idempotent).
    print("Auto-install:")
    if args.skip_install:
        print("  --skip-install: assuming vendor dir already populated.")
        if not (permuter_path / "permuter.py").is_file():
            print(
                f"ERROR: --skip-install but {permuter_path.relative_to(ROOT)}/"
                f"permuter.py does not exist.",
                file=sys.stderr,
            )
            return 1
    else:
        try:
            ensure_permuter_installed(vendor_dir=permuter_path)
            install_permuter_deps()
        except subprocess.CalledProcessError as e:
            stderr = e.stderr or ""
            print(
                f"ERROR: auto-install failed:\n  {e}\n  stderr: {stderr[:400]}",
                file=sys.stderr,
            )
            return 1
    print()

    # 2. Populate the nonmatchings dir via import.py if not present.
    nonmatchings_root = permuter_path / "nonmatchings"
    nonmatchings_dir = nonmatchings_root / sym.name
    if not nonmatchings_dir.is_dir():
        # import.py creates `nonmatchings/<funcname>/` (or with a
        # numeric suffix on collision). We invoke it once; permuter
        # is idempotent on re-runs against the same dir.
        import_cmd = [
            sys.executable,
            str(permuter_path / "import.py"),
            str(source_c_abs),
            str(disasm_s),
        ]
        print("Importing into permuter:")
        print(f"  {' '.join(import_cmd)}")
        try:
            subprocess.run(import_cmd, check=True, cwd=str(permuter_path))
        except subprocess.CalledProcessError as e:
            print(
                f"ERROR: import.py failed (exit {e.returncode}). The .c "
                f"may not preprocess cleanly, or the .s may not match the "
                f"function name `{sym.name}`.",
                file=sys.stderr,
            )
            return 1
        # import.py may suffix the dir on collision; rescan.
        candidates = sorted(
            d for d in nonmatchings_root.iterdir()
            if d.is_dir() and d.name.startswith(sym.name)
        )
        if not candidates:
            print(
                f"ERROR: import.py exited 0 but no nonmatchings/{sym.name}*/ "
                f"was produced.",
                file=sys.stderr,
            )
            return 1
        nonmatchings_dir = candidates[-1]
    print(f"Nonmatchings dir: {nonmatchings_dir.relative_to(ROOT)}")
    print()

    # 3. Run permuter.
    log_dir = ROOT / "permute_log"
    print(f"Running permuter on {sym.name}...")
    result = run_permuter(
        vendor_dir=permuter_path,
        nonmatchings_dir=nonmatchings_dir,
        function_name=sym.name,
        log_dir=log_dir,
        threads=args.threads,
        seed=args.seed,
        max_seconds=args.max_seconds,
        stop_on_zero=not args.no_stop_on_zero,
    )
    print()

    # 4. Report outcome.
    log_rel = (
        result.log_path.relative_to(ROOT)
        if result.log_path else "(no log)"
    )
    if result.match_found and result.result_c_path is not None:
        # Copy to perm_work/<...>/result.c for the decomper.
        perm_work_dir = ROOT / "perm_work" / f"{module}_{sym.name}_{sym.addr:08x}"
        dst = copy_match_to_perm_work(
            result_c=result.result_c_path,
            perm_work_dir=perm_work_dir,
        )
        print(f"MATCH FOUND: {result.result_c_path.relative_to(ROOT)}")
        print(f"  copied to:    {dst.relative_to(ROOT)}")
        print(f"  log:          {log_rel}")
        print()
        print(
            f"  Next: copy {dst.relative_to(ROOT)} to {source_c_abs.relative_to(ROOT)} "
            f"and verify with `ninja rom && ninja objdiff && ninja report`."
        )
        return 0
    elif result.timed_out:
        score = result.best_score if result.best_score is not None else "(no output)"
        print(f"TIMED OUT after {args.max_seconds}s. Best score so far: {score}")
        print(f"  log:    {log_rel}")
        if result.output_dirs:
            best_dir = result.output_dirs[0]
            print(f"  best:   {best_dir.relative_to(ROOT)}/source.c")
        return 1
    else:
        score = result.best_score if result.best_score is not None else "(no output)"
        print(f"Permuter exited (code {result.exit_code}). Best score: {score}")
        print(f"  log:    {log_rel}")
        if result.output_dirs:
            best_dir = result.output_dirs[0]
            print(f"  best:   {best_dir.relative_to(ROOT)}/source.c")
        return 1


if __name__ == "__main__":
    sys.exit(main())
