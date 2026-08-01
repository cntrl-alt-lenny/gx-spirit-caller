#!/usr/bin/env python3
"""batch_port.py — turnkey gated loop for the cross-region port backlog (q-batch-port).

Builds on tools/batch_carve.py's Ops/commit-on-pass seam: batch_carve ADDS a
brand-new delinks.txt block for a freshly-carved .s; batch_port FLIPS an
EXISTING block's header from an already-shipped .s to a freshly-ported .c
(the mechanical EUR->region port, tools/port_to_region.py) and only then
retires the .s. Same discipline throughout: stage in memory, gate the whole
ROM once per batch, commit ONLY on green, revert a red batch cleanly, never
leave a run with work sitting uncommitted.

    python tools/batch_port.py --target usa --batch 20 --limit 60

Source of candidates
=====================
`python tools/port_census.py` (read-only) writes build/port_backlog.json:
every EUR .c whose USA/JPN twin still ships as .s, matched via
find_region_siblings HIGH confidence. Each entry carries a `byte_sim` — the
ground-truth Hamming-distance byte comparison against the EUR side.
batch_port ONLY consumes `byte_sim >= 0.9999` ("sim==1.0") entries: at that
floor the underlying machine code is byte-identical modulo relocations,
which eliminates the region-specific struct-offset bug class outright (see
docs/research/brief-677-crossregion-ports.md) — the sub-1.0 remainder needs
per-candidate handling and is out of scope for this mechanical loop.

The flip, precisely
====================
A backlog entry names an EUR source + a target function/address; it does
NOT name the target's CURRENT delinks.txt path. Deriving that path by
guessing a naming convention from the EUR source's filename is exactly the
bug this campaign hit repeatedly (brief 677: a EUR source's own filename
convention ported under the wrong convention because the target region's
tree already used a different one for that same address) — so batch_port
never guesses. It reads the target module's delinks.txt directly and takes
whichever TU header currently owns the port's target address
(`find_tu_header_for_addr`) as ground truth for BOTH the directory and the
filename stem. The routing-tier suffix (`.legacy`/`.legacy_sp3`/`.thumb`/
none) is a compiler-tier fact carried by the EUR source instead — a `.s`
file has no routing concept of its own, so that half comes from the EUR
side (`compute_port_output_path`).

Safety (mirrors batch_carve.py; see its module docstring for the shared
rationale)
==========================================================================
- The `.s` sibling's CONTENT is cached in memory before it's ever touched,
  so a revert can always restore a buildable .s regardless of when it's
  called (brief 675's bug: a bisect revert with no buildable target to
  flip back to reports the WHOLE batch — not just the real culprit — as
  unconfirmed). The .s is physically deleted at stage time, not deferred
  to commit: dsd's per-TU rule generation keys the object filename off the
  function stem, so a .s and a .c with the same stem coexisting on disk
  makes ninja refuse the whole build outright (`multiple rules generate
  ...`) — discovered live when a first real batch gate-failed on every
  single candidate identically, which is what a mechanical bug (not 7
  coincidental real mismatches) looks like.
- Branch guard: refuses to run on `main` or a detached HEAD at
  origin/main's tip (reuses `batch_carve.branch_guard_message` verbatim).
- A red batch bisects (reuses `batch_carve.bisect_plan`) to isolate the
  culprit(s); the clean remainder still commits.
- A candidate whose port needs a NOT-YET-NAMED target data symbol
  (`new_symbols_txt_lines` in port_to_region.py's output) is parked, not
  auto-applied — writing a new symbols.txt line is a different class of
  edit than this loop's delinks.txt/.c flip and stays a manual step.
- Before a candidate enters a gated batch, `fastmatch.py` compiles only its
  target object and performs the resolved comparison. A non-100% result,
  including fastmatch's fail-closed `NO-INSTRUCTIONS-PARSED` result, is
  parked before any ROM gate. Compile/gap/tool failures remain retryable tool
  errors rather than being silently treated as matches or permanent walls.
"""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from collections.abc import Callable
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(Path(__file__).resolve().parent))

import batch_carve as bc  # noqa: E402 -- the Ops seam this tool builds on
from batch_sha1 import _flip_delinks  # noqa: E402 -- proven CRLF-safe header flip
from routing_suffixes import split_routing_suffix  # noqa: E402


# --------------------------------------------------------------------------- #
# PURE helpers (unit-tested, no build, no git)                                #
# --------------------------------------------------------------------------- #

SIM_FLOOR = 0.9999   # matches port_census.py's own "sim=1.0" bucket threshold


def filter_sim1_backlog(entries: list[dict]) -> list[dict]:
    """Restrict a port_backlog.json region list to the sim==1.0 floor
    (must-have (d)): at that floor the region-specific struct-offset bug
    class (docs/research/brief-677-crossregion-ports.md) cannot occur.
    `byte_sim is None` (no relocs to compare) is excluded too — it's not
    proven, just untested."""
    return [e for e in entries
            if e.get("byte_sim") is not None and e["byte_sim"] >= SIM_FLOOR]


def classify_port_refusal(result: dict) -> str:
    """Return the exclusive primary class for a HIGH-floor port refusal.

    The class order mirrors the residual triage ledger: an EUR-only
    placeholder twin is most specific, then mixed/weak function resolution,
    then a data-only resolution failure.  Unknown shapes fail closed into
    ``unclassified`` rather than being silently counted as a known bucket.
    """
    failed = result.get("failed", [])
    if not isinstance(failed, list):
        return "unclassified"
    failed = [r for r in failed if isinstance(r, dict)]
    if any("placeholder twin" in str(r.get("notes", "")) for r in failed):
        return "placeholder-twin"
    function_failed = [r for r in failed if r.get("kind") == "func"]
    data_failed = [r for r in failed if r.get("kind") == "data"]
    if function_failed:
        confidences = {r.get("confidence") for r in function_failed}
        if confidences == {"MEDIUM"}:
            return "medium-only"
        if "LOW" in confidences and "MEDIUM" in confidences:
            return "low-plus-medium"
        return "function-symbol"
    if data_failed:
        return "data-symbol"
    return "unclassified"


def _fastmatch_has_no_instructions(value: object) -> bool:
    """Return whether a fastmatch JSON value contains its fail-closed marker."""
    if isinstance(value, str):
        return "NO-INSTRUCTIONS-PARSED" in value
    if isinstance(value, dict):
        return any(_fastmatch_has_no_instructions(v) for v in value.values())
    if isinstance(value, (list, tuple)):
        return any(_fastmatch_has_no_instructions(v) for v in value)
    return False


def fastmatch_verdict(payload: object, returncode: int) -> tuple[str, str]:
    """Classify one `fastmatch --json` result without allowing false passes.

    Returns ``("pass", reason)`` only for one healthy result whose requested
    function has an explicit 100.0 match. A mismatch is a prefilter refusal;
    malformed output, missing functions, and missing gap data are retryable
    tool errors. A compiler diagnostic caused by the candidate itself is an
    early refusal; missing compiler/build infrastructure remains retryable.
    The distinction matters: a broken prefilter must never turn an
    infrastructure failure into a permanent park.
    """
    if not isinstance(payload, list) or len(payload) != 1:
        return "tool-error", "expected one fastmatch JSON result"
    result = payload[0]
    if not isinstance(result, dict):
        return "tool-error", "malformed fastmatch result"
    status = result.get("status")
    if status == "compile_error":
        error = str(result.get("error", ""))
        lower_error = error.lower()
        infra_markers = (
            "not found", "not recognized", "no such file", "cannot open",
            "build.ninja:", "ninja: error: loading",
        )
        if not error or any(marker in lower_error for marker in infra_markers):
            return "tool-error", "fastmatch compile infrastructure error"
        first_diagnostic = next(
            (line.strip() for line in error.splitlines()
             if line.strip() and "FAILED:" not in line and "mwccarm.exe" not in line),
            "candidate compiler diagnostic",
        )
        return "refused", f"candidate compile error: {first_diagnostic[:240]}"
    if status != "ok":
        return "tool-error", f"fastmatch status={status!r}"
    functions = result.get("functions")
    if not isinstance(functions, list) or not functions:
        return "tool-error", "fastmatch returned no function result"
    if returncode not in (0, 1):
        return "tool-error", f"fastmatch exited {returncode}"

    for function in functions:
        if not isinstance(function, dict):
            return "tool-error", "malformed fastmatch function result"
        name = function.get("name", "?")
        if _fastmatch_has_no_instructions(function):
            return "refused", f"{name}: NO-INSTRUCTIONS-PARSED"
        if function.get("status") != "ok":
            if function.get("status") == "not_in_gap":
                return "refused", f"{name}: not-in-gap"
            return "tool-error", f"{name}: status={function.get('status')!r}"
        pct = function.get("match_percent")
        if pct != 100.0:
            return "refused", f"{name}: resolved match {pct!r}%"
    if returncode != 0:
        return "tool-error", f"fastmatch exited {returncode} despite 100.0% results"
    return "pass", "all requested functions resolved at 100.0%"


_HDR_RE = re.compile(r"^(\S+):$")
_RANGE_RE = re.compile(r"\.(?:text|init) start:(0x[0-9a-f]+) end:(0x[0-9a-f]+)")


def find_tu_header_for_addr(delinks_text: str, addr: int) -> str | None:
    """The CURRENT TU header path owning `addr`'s .text/.init range —
    ground truth read directly from delinks.txt, never guessed from a
    filename convention (see module docstring, "The flip, precisely").
    None if no block currently claims that address. `.rstrip()`-only
    (matches batch_carve.audit()'s own convention): header lines are
    always column 0, only trailing newline/whitespace is noise."""
    cur: str | None = None
    for raw in delinks_text.splitlines():
        s = raw.rstrip()
        m = _HDR_RE.match(s)
        if m:
            cur = m.group(1)
            continue
        m = _RANGE_RE.search(s)
        if m and cur is not None and int(m.group(1), 16) == addr:
            return cur
    return None


def compute_port_output_path(old_s_rel: str, eur_source_rel: str) -> str:
    """The output .c path for a port: same directory + stem as the
    CURRENTLY-SHIPPED .s (ground truth for this region's own naming
    convention — sidesteps the EUR-vs-target filename-convention mismatch
    bug class), with the routing-tier suffix copied from the EUR source (a
    .s carries no routing signal of its own; the compiler-tier requirement
    is a property of the function's code shape, already proven on the EUR
    side)."""
    if not old_s_rel.endswith(".s"):
        raise ValueError(f"expected a .s path, got: {old_s_rel}")
    stem = old_s_rel[:-2]
    eur_stem = Path(eur_source_rel).stem   # strips only the final ".c"
    _, routing_suffix = split_routing_suffix(eur_stem)
    return f"{stem}{routing_suffix}.c"


def module_dirs(region: str, module: str) -> tuple[str, str]:
    """(delinks.txt relpath, target srcdir) for a region+module — module is
    "main" or "ovNNN" (port_backlog.json's own convention, matches
    port_to_region.py's `infer_module_from_path`/`module_to_src_dir`)."""
    if module == "main":
        return f"config/{region}/arm9/delinks.txt", f"src/{region}/main"
    return (f"config/{region}/arm9/overlays/{module}/delinks.txt",
            f"src/{region}/overlay{module[2:]}")


# --------------------------------------------------------------------------- #
# IMPURE seam — Ops (extends batch_carve.Ops; real subprocess/git)            #
# --------------------------------------------------------------------------- #

class PortOps(bc.Ops):
    """Adds the two operations batch_carve.Ops has no use for: running the
    mechanical porter, and committing an add+remove pair atomically.
    Everything else (gate/branch-guard/dirty-check/kill-orphans) is
    inherited unchanged — the literal "existing Ops seam" this tool builds
    on."""

    def port(self, eur_rel: str, target: str, confidence_floor: str = "HIGH") -> dict:
        """Shell out to port_to_region.py --json. `--json` alone (see that
        script's CLI) never writes to disk — batch_port controls the
        physical write itself, exactly like whole_function() controls the
        .s write in batch_carve. Returns the parsed JSON dict, or a
        {'status': 'tool-error', ...} sentinel on a crash / unparseable
        output — callers must never treat a tool-error as a genuine REFUSE
        (same discipline as classify()/whole_function())."""
        try:
            r = self._run([sys.executable, "tools/port_to_region.py", eur_rel,
                           "--target", target,
                           "--confidence-floor", confidence_floor, "--json"],
                          timeout=self.call_timeout or None)
        except subprocess.TimeoutExpired:
            self._kill_orphans()
            return {"status": "tool-error", "reason": "timeout"}
        try:
            return json.loads(r.stdout)
        except (json.JSONDecodeError, ValueError):
            combined = (r.stdout + r.stderr)[:400]
            return {"status": "tool-error",
                    "reason": f"non-JSON output (rc={r.returncode}): {combined}"}

    def prefilter(self, c_rel: str, func: str) -> tuple[str, str]:
        """Run the cheap one-object resolved check before a ROM gate.

        The temporary C is already present when this method is called, so a
        fresh configure is required to add it to build.ninja. `fastmatch.py`
        then invokes exactly one ninja object target; it never links or runs
        the ROM SHA-1 gate. The caller removes the temporary C in a finally
        block, whether this returns pass, refusal, or tool-error.
        """
        try:
            configured = self._run(
                [sys.executable, "tools/configure.py", self.version],
                timeout=self.call_timeout or None,
            )
        except subprocess.TimeoutExpired:
            self._kill_orphans()
            return "tool-error", "configure timeout"
        if configured.returncode != 0:
            combined = (configured.stdout + configured.stderr).strip()[:400]
            return "tool-error", f"configure failed (rc={configured.returncode}): {combined}"

        try:
            checked = self._run(
                [sys.executable, "tools/fastmatch.py", self.version, c_rel,
                 "--func", func, "--json"],
                timeout=self.call_timeout or None,
            )
        except subprocess.TimeoutExpired:
            self._kill_orphans()
            return "tool-error", "fastmatch timeout"
        try:
            payload = json.loads(checked.stdout)
        except (json.JSONDecodeError, ValueError):
            combined = (checked.stdout + checked.stderr).strip()[:400]
            return "tool-error", f"fastmatch produced non-JSON output: {combined}"
        return fastmatch_verdict(payload, checked.returncode)

    def git_commit_port(self, add_paths: list[str], remove_paths: list[str],
                        message: str) -> bool:
        """Commit a port batch: `add_paths` (new .c + touched delinks.txt)
        must exist; `remove_paths` (stale .s siblings) must NOT — the caller
        unlinks them only once the batch is proven green, and `git add` on a
        vanished tracked path stages the deletion exactly like `git rm`
        would. Returns True only if HEAD actually advanced (same
        false-ship guard as batch_carve.Ops.git_commit)."""
        for p in add_paths:
            if not (ROOT / p).exists():
                return False
        for p in remove_paths:
            if (ROOT / p).exists():
                return False
        before = self.head_rev()
        all_paths = add_paths + remove_paths
        if self._run(["git", "add", "--", *all_paths]).returncode != 0:
            return False
        self._run(["git", "commit", "-q", "-m", message])
        return self.head_rev() != before


# --------------------------------------------------------------------------- #
# Driver                                                                       #
# --------------------------------------------------------------------------- #

@dataclass
class PendingPort:
    func: str              # TARGET function name (e.g. func_02006148)
    old_s_rel: str
    new_c_rel: str
    delinks_rel: str
    source_text: str
    old_s_content: bytes   # cached at stage time -- see _stage()'s docstring


@dataclass
class Report:
    passed: list[str] = field(default_factory=list)
    parked_refuse: list[str] = field(default_factory=list)
    parked_needs_symbol: list[str] = field(default_factory=list)
    stale: list[str] = field(default_factory=list)
    tool_error: list[str] = field(default_factory=list)
    prefilter_refuse: list[str] = field(default_factory=list)
    prefilter_tool_error: list[str] = field(default_factory=list)
    gate_fail: list[str] = field(default_factory=list)
    deferred: list[str] = field(default_factory=list)
    contention_deferred: list[str] = field(default_factory=list)
    committed_batches: int = 0
    gate_calls: int = 0
    refused_by_class: dict[str, int] = field(default_factory=dict)

    def summary(self) -> str:
        return (f"PORTED {len(self.passed)} | refused {len(self.parked_refuse)} | "
                f"needs-symbol {len(self.parked_needs_symbol)} | "
                f"prefilter-refuse {len(self.prefilter_refuse)} | "
                f"prefilter-error {len(self.prefilter_tool_error)} | "
                f"stale {len(self.stale)} | tool-error {len(self.tool_error)} | "
                f"gate-fail {len(self.gate_fail)} | deferred {len(self.deferred)} | "
                f"commits {self.committed_batches}")


class CommitError(RuntimeError):
    """A green-gated batch failed to commit (HEAD did not advance)."""


class BatchPorter:
    def __init__(self, region: str, ops: PortOps, *, batch: int,
                 confidence_floor: str = "HIGH", park_path: str | None = None,
                 dry_run: bool = False, log=print,
                 before_batch: Callable[[], bool] | None = None):
        self.region = region
        self.ops = ops
        self.batch = batch
        self.confidence_floor = confidence_floor
        self.park_path = park_path
        self.dry_run = dry_run
        self.log = log
        self.before_batch = before_batch
        self.report = Report()
        self.pending: list[PendingPort] = []
        self._delinks_cache: dict[str, str] = {}   # delinks_rel -> current text

    def _park(self, func: str, kind: str) -> None:
        if self.park_path:
            with open(ROOT / self.park_path, "a") as fh:
                fh.write(f"{func} {kind}\n")

    def _delinks_text(self, delinks_rel: str) -> str:
        if delinks_rel not in self._delinks_cache:
            self._delinks_cache[delinks_rel] = (ROOT / delinks_rel).read_text(
                encoding="utf-8", errors="replace")
        return self._delinks_cache[delinks_rel]

    def _refresh_cache(self, delinks_rel: str) -> None:
        self._delinks_cache[delinks_rel] = (ROOT / delinks_rel).read_text(
            encoding="utf-8", errors="replace")

    # ---- stage/revert (flip model, not append -- see module docstring) ----
    def _stage(self, p: PendingPort) -> None:
        """Write the new .c, flip the delinks.txt header, then delete the
        .s -- in that order, and the .s comes out only AFTER the flip
        succeeds. The .s can't just stay on disk alongside the .c: dsd's
        per-TU rule generation keys the object filename off the function
        STEM, so a .s and a .c with the same stem both present makes ninja
        refuse the whole build outright (`multiple rules generate
        build/.../func_X.o`) -- discovered live the hard way (every
        candidate in the first real batch gate-failed identically, which
        pointed at a mechanical bug rather than 7 coincidental real
        mismatches). `old_s_content` was cached into `p` by the caller
        BEFORE this runs, so `_revert_one` can always restore a buildable
        .s regardless of when it's called -- must-have (b), satisfied via
        an in-memory cache instead of leaving the file physically in
        place (which is what actually broke the gate)."""
        (ROOT / p.new_c_rel).parent.mkdir(parents=True, exist_ok=True)
        (ROOT / p.new_c_rel).write_text(p.source_text, encoding="utf-8")
        ok = _flip_delinks(ROOT / p.delinks_rel, p.old_s_rel, p.new_c_rel)
        if not ok:
            (ROOT / p.new_c_rel).unlink(missing_ok=True)
            raise RuntimeError(f"delinks flip failed for {p.func} "
                              f"({p.old_s_rel} -> {p.new_c_rel})")
        (ROOT / p.old_s_rel).unlink(missing_ok=True)
        self._refresh_cache(p.delinks_rel)
        self.pending.append(p)

    def _revert_one(self, p: PendingPort) -> None:
        _flip_delinks(ROOT / p.delinks_rel, p.new_c_rel, p.old_s_rel)
        (ROOT / p.new_c_rel).unlink(missing_ok=True)
        (ROOT / p.old_s_rel).write_bytes(p.old_s_content)   # restore from cache
        self._refresh_cache(p.delinks_rel)

    def _revert_pending(self) -> None:
        for p in self.pending:
            self._revert_one(p)
        self.pending = []

    def _reapply(self, ports: list[PendingPort]) -> None:
        for p in ports:
            self._stage(p)

    def _commit_pending(self) -> bool:
        delinks_paths = sorted({p.delinks_rel for p in self.pending})
        add_paths = delinks_paths + [p.new_c_rel for p in self.pending]
        remove_paths = [p.old_s_rel for p in self.pending]
        funcs = [p.func for p in self.pending]
        msg = (f"batch_port: {self.region} +{len(funcs)} ported "
               f"[auto, {self.region} sha1 OK]")
        # _stage() already unlinked every .s in this batch (had to, for
        # ninja -- see its docstring); this is just belt-and-suspenders in
        # case anything external re-created one.
        self.ops.rm_files(remove_paths)
        if not self.ops.git_commit_port(add_paths, remove_paths, msg):
            return False
        self.report.passed.extend(funcs)
        self.report.committed_batches += 1
        self.pending = []
        return True

    def _commit_or_abort(self) -> None:
        if not self._commit_pending():
            raise CommitError("git commit did not advance HEAD -- refusing to "
                             "continue (ports would be falsely reported shipped)")

    def _gate(self) -> bool:
        """Run one ROM gate and count it for machine-readable harvest reports."""
        self.report.gate_calls += 1
        return self.ops.gate()

    def _gate_commit_or_bisect(self) -> None:
        if not self.pending:
            return
        try:
            ok = self._gate()
        except bc.GateTimeout:
            funcs = [p.func for p in self.pending]
            self.log(f"  ⏳ gate timed out (contention) -> DEFER {len(funcs)} "
                     f"(re-attemptable next run), no park")
            self._revert_pending()
            self.report.deferred.extend(funcs)
            return
        if ok:
            self.log(f"  ✅ gate OK -> commit {len(self.pending)} port(s)")
            self._commit_or_abort()
        else:
            self.log(f"  ❌ gate RED on batch of {len(self.pending)} -> bisect")
            self._bisect(self.pending)

    def _bisect(self, ports: list[PendingPort]) -> None:
        """Delta-debug a red batch (mirrors batch_carve._bisect, minus its
        audit() step -- a header-rename flip can't produce the
        overlap/concatenation shapes audit() exists to catch; the range
        lines are never touched, only the header text)."""
        self._revert_pending()
        if len(ports) == 1:
            p = ports[0]
            self.log(f"     culprit isolated: {p.func} -> park gate-fail")
            self.report.gate_fail.append(p.func)
            self._park(p.func, "gate-fail")
            return
        for half in bc.bisect_plan(ports):
            self._reapply(half)
            try:
                green = self._gate()
            except bc.GateTimeout:
                funcs = [p.func for p in half]
                self.log(f"     ⏳ gate timed out in bisect -> DEFER "
                         f"{len(funcs)} (re-attemptable next run)")
                self._revert_pending()
                self.report.deferred.extend(funcs)
                continue
            if green:
                self.log(f"     half of {len(half)} OK -> commit")
                self._commit_or_abort()
            else:
                self._bisect(half)

    # ---- per-candidate resolution ----
    def _resolve(self, entry: dict) -> PendingPort | None:
        module = entry["module"]
        addr = int(entry["tgt_addr"], 16)
        delinks_rel, _srcdir = module_dirs(self.region, module)
        if not (ROOT / delinks_rel).is_file():
            self.report.stale.append(entry["tgt"])
            self.log(f"  ~ {entry['tgt']} no delinks.txt for {module} ({self.region}) -- skip")
            return None
        header = find_tu_header_for_addr(self._delinks_text(delinks_rel), addr)
        if header is None:
            self.report.stale.append(entry["tgt"])
            self.log(f"  ~ {entry['tgt']} no TU claims 0x{addr:08x} -- stale backlog, skip")
            return None
        if not header.endswith(".s"):
            self.report.stale.append(entry["tgt"])
            self.log(f"  = {entry['tgt']} already ported (live dedup) -- skip")
            return None
        if not (ROOT / header).is_file():
            self.report.stale.append(entry["tgt"])
            self.log(f"  ⚠ {entry['tgt']} delinks says {header} but it's missing "
                     f"on disk -- skip (must-have (b): never stage without a .s to "
                     f"revert to)")
            return None
        old_s_content = (ROOT / header).read_bytes()
        new_c_rel = compute_port_output_path(header, entry["eur"])
        if (ROOT / new_c_rel).exists():
            self.report.stale.append(entry["tgt"])
            self.log(f"  = {new_c_rel} already on disk -- skip (no overwrite)")
            return None
        result = self.ops.port(entry["eur"], self.region, self.confidence_floor)
        status = result.get("status")
        if status == "tool-error":
            self.report.tool_error.append(entry["tgt"])
            self.log(f"  ⚠ {entry['tgt']} tool-error ({str(result.get('reason', ''))[:80]}) "
                     f"-- not parked, retry next run")
            return None
        if status == "refused":
            self.report.parked_refuse.append(entry["tgt"])
            refusal_class = classify_port_refusal(result)
            self.report.refused_by_class[refusal_class] = (
                self.report.refused_by_class.get(refusal_class, 0) + 1
            )
            self._park(entry["tgt"], "port-refused")
            self.log(f"  ⊘ {entry['tgt']} port refused ({str(result.get('reason', ''))[:80]})")
            return None
        if status != "ok":
            self.report.tool_error.append(entry["tgt"])
            self.log(f"  ⚠ {entry['tgt']} unexpected port status {status!r} -- not parked")
            return None
        if result.get("new_symbols_txt_lines"):
            self.report.parked_needs_symbol.append(entry["tgt"])
            self._park(entry["tgt"], "needs-symbols-txt-line")
            self.log(f"  ⊘ {entry['tgt']} needs a new symbols.txt line -- manual, skip")
            return None

        # Keep the generated C out of the staged batch until the cheap,
        # resolved one-object check has passed. Test doubles used by the pure
        # driver tests do not implement this optional seam; production
        # PortOps does, so real runs are always prefiltered.
        prefilter = getattr(self.ops, "prefilter", None)
        if callable(prefilter):
            candidate_path = ROOT / new_c_rel
            candidate_path.parent.mkdir(parents=True, exist_ok=True)
            candidate_path.write_text(result["rewritten"], encoding="utf-8")
            try:
                verdict, reason = prefilter(new_c_rel, entry["tgt"])
            finally:
                candidate_path.unlink(missing_ok=True)
            if verdict == "refused":
                self.report.prefilter_refuse.append(entry["tgt"])
                self._park(entry["tgt"], "prefilter-refuse")
                self.log(f"  ⊘ {entry['tgt']} fastmatch refused ({reason})")
                return None
            if verdict != "pass":
                self.report.prefilter_tool_error.append(entry["tgt"])
                self.log(f"  ⚠ {entry['tgt']} fastmatch tool-error ({reason}) "
                         "-- retry next run")
                return None
        return PendingPort(func=entry["tgt"], old_s_rel=header, new_c_rel=new_c_rel,
                          delinks_rel=delinks_rel, source_text=result["rewritten"],
                          old_s_content=old_s_content)

    # ---- main loop ----
    def run(self, backlog: list[dict], limit: int | None = None) -> Report:
        candidates = filter_sim1_backlog(backlog)
        if limit:
            candidates = candidates[:limit]
        self.log(f"batch_port {self.region}: {len(candidates)} sim==1.0 candidate(s) "
                 f"(batch={self.batch}, dry_run={self.dry_run})")
        batch_open = False
        for index, entry in enumerate(candidates):
            if self.dry_run:
                self.report.passed.append(entry["tgt"])
                continue
            if not batch_open:
                if self.before_batch is not None and not self.before_batch():
                    remaining = [candidate["tgt"]
                                 for candidate in candidates[index:]]
                    self.report.deferred.extend(remaining)
                    self.report.contention_deferred.extend(remaining)
                    self.log(f"  ⏸ machine busy -> DEFER {len(remaining)} "
                             "candidate(s), no gate or commit")
                    break
                batch_open = True
            p = self._resolve(entry)
            if p is None:
                continue
            self._stage(p)
            self.log(f"  + {p.func} ({p.old_s_rel} -> {p.new_c_rel}) staged "
                     f"[{len(self.pending)}/{self.batch}]")
            if len(self.pending) >= self.batch:
                self._gate_commit_or_bisect()
                batch_open = False
        if not self.dry_run:
            self._gate_commit_or_bisect()
        self.log("REPORT: " + self.report.summary())
        return self.report


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description="Turnkey gated port loop (q-batch-port): drains the "
                    "sim==1.0 cross-region port backlog in batches, "
                    "auto-committing green and cleanly reverting red.")
    ap.add_argument("--target", required=True, choices=["usa", "jpn"])
    ap.add_argument("--backlog", default=None,
                    help="override build/port_backlog.json path")
    ap.add_argument("--confidence-floor", default="HIGH",
                    choices=["HIGH", "MEDIUM", "LOW"])
    ap.add_argument("--batch", type=int, default=20, help="ports per gate/commit")
    ap.add_argument("--limit", type=int, default=None, help="max candidates this run")
    ap.add_argument("--call-timeout", type=float, default=0.0)
    ap.add_argument("--gate-timeout", type=float, default=0.0)
    ap.add_argument("--gate-retries", type=int, default=1)
    ap.add_argument("--park-list", default=None,
                    help="append refused/gate-fail/needs-symbol candidates here")
    ap.add_argument("--dry-run", action="store_true",
                    help="enumerate + filter only; no port/gate/commit")
    ap.add_argument("--force-branch", action="store_true",
                    help="bypass the branch-safety guard (see batch_carve.py's "
                         "--force-branch — same rationale, this tool auto-commits too)")
    args = ap.parse_args(argv)

    ops = PortOps(version=args.target, call_timeout=args.call_timeout,
                 gate_timeout=args.gate_timeout, gate_retries=args.gate_retries)

    branch = ops.current_branch()
    guard_msg = bc.branch_guard_message(branch, ops.is_detached_at_origin_main(),
                                        args.force_branch)
    if guard_msg:
        print(f"batch_port: REFUSING (branch={branch!r}) -- {guard_msg}", file=sys.stderr)
        return 2

    backlog_path = Path(args.backlog) if args.backlog else ROOT / "build" / "port_backlog.json"
    if not backlog_path.is_file():
        print(f"batch_port: {backlog_path} not found -- run "
             f"`python tools/port_census.py` first", file=sys.stderr)
        return 2
    data = json.loads(backlog_path.read_text(encoding="utf-8"))
    backlog = data.get("backlog", {}).get(args.target, [])

    porter = BatchPorter(args.target, ops, batch=args.batch,
                         confidence_floor=args.confidence_floor,
                         park_path=args.park_list, dry_run=args.dry_run)
    try:
        rep = porter.run(backlog, limit=args.limit)
    except CommitError as e:
        print(f"batch_port: ABORT -- {e}", file=sys.stderr)
        return 2
    return 0 if not rep.gate_fail else 1


if __name__ == "__main__":
    raise SystemExit(main())
