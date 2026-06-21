#!/usr/bin/env python3.13
"""batch_carve.py — automate the DETERMINISTIC mechanical carve lanes (brief 456).

The ov002 `.s` reg-alloc lane and the region-port lane are deterministic: a
candidate either passes a byte-exact gate or it doesn't — no LLM judgement.
This driver enumerates uncarved candidates in a scope, runs the per-candidate
verification, stages the carve, and — crucially — **commits on a green
`ninja sha1` and reverts on a red one**, so a wave can never end with work
sitting uncommitted (the recurring ship-step miss).

    python3.13 tools/batch_carve.py --version eur --overlay ov002 \
        --min-size 0xc1 --max-size 0x100 --batch 20 --limit 60

Design — PURE vs IMPURE
=======================
Everything that decides *what* to do (enumeration filtering, delink-block
formatting, the newline guard, dedup, overlap/size audit, the bisect plan) is a
pure function, unit-tested with no build. Everything that *acts* (asm_escape /
ninja / git) goes through the injectable `Ops` object, so the tests drive the
whole driver with a fake `Ops` and never shell out.

Carve strategy
==============
v1 ships the ov002 `.s` strategy (`asm_escape --classify-data` then
`--whole-function`). The driver is written against the `Ops` / `Strategy`
seam so the region-port lane (`port_to_region.py`, gate on USA+JPN sha1) can be
slotted in later without touching the batch/commit/bisect core.

Safety
======
- Reverting a failed batch uses targeted `git checkout -- <delinks>` + `rm` of
  the batch's *new* `.s` files. It NEVER runs `git reset --hard` (that would
  destroy unrelated uncommitted work).
- A red batch is re-gated once (the large-tree `dsd`/`mwasmarm` transient,
  Verify item 11b) before being treated as a real failure.
- On a real red batch, the driver BISECTS (delta-debug) to isolate the
  culprit(s), parks them, and commits the good remainder — no good carve is
  lost to one bad sibling.
"""
from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# --------------------------------------------------------------------------- #
# PURE helpers (unit-tested, no build, no git)                                 #
# --------------------------------------------------------------------------- #

_SYM_RE = re.compile(r"(func_\w+)\s+kind:function\(arm,size=(0x[0-9a-f]+)\)")
_START_RE = re.compile(r"start:(0x[0-9a-f]+)")
_TEXT_RE = re.compile(r"\.text start:(0x[0-9a-f]+) end:(0x[0-9a-f]+)\s*$")
_SRC_HDR_RE = re.compile(r"(\S+/(func_\w+)\.s):$")


def parse_symbols(text: str) -> dict[str, int]:
    """func name -> size (bytes), ARM functions only."""
    out: dict[str, int] = {}
    for line in text.splitlines():
        m = _SYM_RE.match(line.strip())
        if m:
            out[m.group(1)] = int(m.group(2), 16)
    return out


def func_addr(func: str) -> int:
    """func_ovNNN_021abcde / func_021abcde -> 0x021abcde."""
    return int(func.rsplit("_", 1)[-1], 16)


def carved_addrs(delinks_text: str) -> set[int]:
    return {int(m.group(1), 16) for m in _START_RE.finditer(delinks_text)}


def parse_skiplist(text: str) -> set[str]:
    """A skip-list line is `<func> [reason...]`; blank/`#` lines ignored."""
    out: set[str] = set()
    for line in text.splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        out.add(line.split()[0])
    return out


def filter_candidates(symbols: dict[str, int], carved: set[int], skips: set[str],
                      *, min_addr: int, min_size: int, max_size: int) -> list[tuple[int, str]]:
    """(size, func) sorted by size then addr — the carve order (smallest first)."""
    out: list[tuple[int, str]] = []
    for func, size in symbols.items():
        a = func_addr(func)
        if a < min_addr or not (min_size <= size <= max_size):
            continue
        if a in carved or func in skips:
            continue
        out.append((size, func))
    out.sort(key=lambda t: (t[0], func_addr(t[1])))
    return out


def delink_block(func: str, addr: int, size: int, srcdir: str) -> str:
    """One `complete` .text delink block, trailing-newline terminated."""
    return (f"{srcdir}/{func}.s:\n"
            f"    complete\n"
            f"    .text start:0x{addr:08x} end:0x{addr + size:08x}\n")


def newline_guard(content: str) -> str:
    """Ensure `content` ends in exactly one newline before an append (b450 fix:
    origin/main's delinks.txt has no trailing newline, so a naive append fuses
    the new block header onto the previous block's end address)."""
    if content and not content.endswith("\n"):
        return content + "\n"
    return content


def audit(delinks_text: str, symbols: dict[str, int]) -> list[str]:
    """Return a list of problems: overlaps, concatenated lines, size mismatches.
    Empty list == clean."""
    problems: list[str] = []
    intervals: list[tuple[int, int, str | None]] = []
    cur: str | None = None
    for ln, raw in enumerate(delinks_text.splitlines(), 1):
        s = raw.rstrip()
        if ".s:" in s and ("start:" in s or "end:" in s):
            problems.append(f"concatenated line {ln}: {s!r}")
        mh = _SRC_HDR_RE.match(s)
        if mh:
            cur = mh.group(2)
        mt = _TEXT_RE.search(s)
        if mt:
            intervals.append((int(mt.group(1), 16), int(mt.group(2), 16), cur))
            cur = None
    ordered = sorted((a, b) for a, b, _ in intervals)
    for i in range(1, len(ordered)):
        if ordered[i][0] < ordered[i - 1][1]:
            problems.append(f"overlap: 0x{ordered[i-1][0]:08x}-0x{ordered[i-1][1]:08x} "
                            f"vs 0x{ordered[i][0]:08x}-0x{ordered[i][1]:08x}")
    for a, b, fn in intervals:
        if fn in symbols and b - a != symbols[fn]:
            problems.append(f"size mismatch {fn}: delink 0x{b-a:x} vs symbols 0x{symbols[fn]:x}")
    return problems


def bisect_plan(items: list) -> list[list]:
    """Split a failed batch into two halves for delta-debugging. A 1-item list
    has no plan (the single item is the culprit)."""
    if len(items) <= 1:
        return []
    mid = len(items) // 2
    return [items[:mid], items[mid:]]


# --------------------------------------------------------------------------- #
# IMPURE seam — Ops (real subprocess/git; the tests inject a fake)             #
# --------------------------------------------------------------------------- #

@dataclass
class CarveResult:
    func: str
    status: str          # "pass" | "refuse" | "verify-fail" | "gate-fail" | "deferred"
    note: str = ""


class Ops:
    """Real implementations. `call_timeout` (seconds, 0=off) kills a hung
    asm_escape call + orphan mwasmarm so the driver coexists with a concurrent
    worktree build on the shared wineserver, then defers the candidate."""

    def __init__(self, version: str, call_timeout: float = 0.0, gate_retries: int = 1,
                 gate_timeout: float = 0.0):
        self.version = version
        self.call_timeout = call_timeout
        self.gate_retries = gate_retries
        self.gate_timeout = gate_timeout

    def _run(self, cmd: list[str], timeout: float | None = None) -> subprocess.CompletedProcess:
        return subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True, timeout=timeout)

    def _kill_orphans(self) -> None:
        # kill every Win32 toolchain proc that can hang on a wedged wineserver
        for exe in ("mwasmarm.exe", "mwldarm.exe", "mwccarm.exe"):
            subprocess.run(["pkill", "-f", exe], capture_output=True)
        subprocess.run(["pkill", "-f", "ninja sha1"], capture_output=True)

    def classify(self, func: str) -> str:
        """'clean' | 'refuse' | 'deferred'."""
        try:
            r = self._run(["python3.13", "tools/asm_escape.py", "--classify-data",
                           "--version", self.version, func],
                          timeout=self.call_timeout or None)
        except subprocess.TimeoutExpired:
            self._kill_orphans()
            return "deferred"
        out = r.stdout + r.stderr
        if "REFUSE" in out:
            return "refuse"
        if "clean" in out or "✅" in out:
            return "clean"
        return "refuse"   # unknown output -> conservative park

    def whole_function(self, func: str, out_path: str) -> str:
        """'pass' | 'verify-fail' | 'deferred'. Writes out_path on pass."""
        try:
            r = self._run(["python3.13", "tools/asm_escape.py", "--whole-function",
                           "--version", self.version, func, "--out", out_path],
                          timeout=self.call_timeout or None)
        except subprocess.TimeoutExpired:
            self._kill_orphans()
            # asm_escape writes the .s BEFORE byte-verify; a deferred call leaves
            # an unverified .s — drop it so it can't be mistaken for a pass.
            Path(out_path).unlink(missing_ok=True)
            return "deferred"
        out = r.stdout + r.stderr
        if "byte-identical" in out or "✅" in out:
            return "pass"
        Path(out_path).unlink(missing_ok=True)
        return "verify-fail"

    def gate(self) -> bool:
        """`ninja sha1` with one retry (large-tree transient, item 11b).

        Green ONLY when ninja exits 0 AND sha1 prints `<rom>: OK` (a printed OK
        from a not-fully-rebuilt tree is not trusted). Distinguishes two failure
        modes so a concurrent-build deadlock never false-parks a clean carve:
          * a completed run that is not OK  -> return False (real RED -> bisect);
          * EVERY attempt killed by `gate_timeout` (a wineserver deadlock with a
            co-lane) -> raise GateTimeout -> the batch is DEFERRED, not parked."""
        to = self.gate_timeout or None
        completed_any = False
        for _ in range(self.gate_retries + 1):
            try:
                self._run(["python3.13", "tools/configure.py", self.version], timeout=to)
                r = self._run(["ninja", "sha1"], timeout=to)
            except subprocess.TimeoutExpired:
                self._kill_orphans()
                continue
            completed_any = True
            if r.returncode == 0 and f"{self._romname()}: OK" in (r.stdout + r.stderr):
                return True
        if not completed_any and self.gate_timeout:
            raise GateTimeout("ninja sha1 timed out every attempt (wineserver "
                              "contention) — deferring, not parking")
        return False

    def _romname(self) -> str:
        return f"gx-spirit-caller_{self.version}.nds"

    def head_rev(self) -> str:
        return self._run(["git", "rev-parse", "HEAD"]).stdout.strip()

    def is_dirty(self, path: str) -> bool:
        """True if `path` has uncommitted changes (staged or unstaged). Used to
        REFUSE to start when a co-lane (e.g. the decomper) has in-flight edits
        to the SHARED delinks file — batch_carve must never clobber those."""
        r = self._run(["git", "status", "--porcelain", "--", path])
        return bool(r.stdout.strip())

    def git_commit(self, paths: list[str], message: str) -> bool:
        """Commit `paths`; return True ONLY if HEAD actually advanced. A silent
        commit failure (hook, missing identity, locked index, nothing staged)
        must NOT be reported as a ship — the whole reset-on-fail model depends
        on HEAD == last-good-state."""
        for p in paths:
            if not (ROOT / p).exists():
                return False                      # don't stage a vanished .s
        before = self.head_rev()
        if self._run(["git", "add", "--", *paths]).returncode != 0:
            return False
        self._run(["git", "commit", "-q", "-m", message])
        return self.head_rev() != before

    def rm_files(self, paths: list[str]) -> None:
        for p in paths:
            Path(ROOT / p).unlink(missing_ok=True)

    def sort_delinks(self, delinks_path: str) -> None:
        r = self._run(["python3.13", "tools/sort_delinks.py", delinks_path])
        if r.returncode != 0:
            raise RuntimeError(f"sort_delinks failed on {delinks_path}: {r.stderr.strip()}")


# --------------------------------------------------------------------------- #
# Driver                                                                       #
# --------------------------------------------------------------------------- #

@dataclass
class Scope:
    version: str
    overlay: str | None       # "ov002" or None for arm9 main
    min_addr: int
    min_size: int
    max_size: int

    @property
    def cfg_dir(self) -> Path:
        if self.overlay:
            return ROOT / f"config/{self.version}/arm9/overlays/{self.overlay}"
        return ROOT / f"config/{self.version}/arm9"

    @property
    def srcdir(self) -> str:
        if self.overlay:
            return f"src/overlay{self.overlay[2:]}"   # ov002 -> src/overlay002
        return "src/main"

    @property
    def delinks_path(self) -> str:
        return str((self.cfg_dir / "delinks.txt").relative_to(ROOT))


@dataclass
class Report:
    passed: list[str] = field(default_factory=list)
    refused: list[str] = field(default_factory=list)
    verify_fail: list[str] = field(default_factory=list)
    gate_fail: list[str] = field(default_factory=list)
    deferred: list[str] = field(default_factory=list)
    committed_batches: int = 0

    def summary(self) -> str:
        total = len(self.passed) + len(self.refused) + len(self.verify_fail) + len(self.gate_fail)
        rate = (100 * len(self.passed) // total) if total else 0
        return (f"SHIPPED {len(self.passed)} | REFUSE {len(self.refused)} | "
                f"verify-fail {len(self.verify_fail)} | gate-fail {len(self.gate_fail)} | "
                f"deferred {len(self.deferred)} | clean-rate {rate}% | "
                f"commits {self.committed_batches}")


class GateTimeout(RuntimeError):
    """The gate timed out every attempt (wineserver contention, not a real RED)."""


class CommitError(RuntimeError):
    """A green-gated batch failed to commit (HEAD did not advance)."""


class DirtyTreeError(RuntimeError):
    """The shared delinks file already has uncommitted edits at run start."""


class BatchCarver:
    def __init__(self, scope: Scope, ops: Ops, *, batch: int, srcdir: str | None = None,
                 skip_path: str | None = None, verifyfail_path: str | None = None,
                 dry_run: bool = False, log=print):
        self.scope = scope
        self.ops = ops
        self.batch = batch
        self.srcdir = srcdir or scope.srcdir
        self.skip_path = skip_path
        self.verifyfail_path = verifyfail_path
        self.dry_run = dry_run
        self.log = log
        self.report = Report()
        # a staged carve: (func, addr, size, s_relpath, s_content)
        self.pending: list[tuple[str, int, int, str, str]] = []
        # in-memory authoritative delinks reconstruction (NEVER git-checkout the
        # shared file — that would clobber a co-lane's uncommitted edits):
        #   on-disk delinks == _baseline + committed blocks + pending blocks
        # _baseline is the run-start content (== HEAD; we refuse to start dirty).
        self._baseline: str = ""
        self._committed: list[tuple[str, int, int]] = []

    # ---- skip-list append (git-ignored build-local scratch) ----
    def _park(self, func: str, kind: str, path: str | None) -> None:
        if path:
            with open(ROOT / path, "a") as fh:
                fh.write(f"{func} {kind}\n")

    # ---- delinks reconstruction (no git checkout; survives a dirty co-lane) ----
    def _write_delinks(self, symbols: dict[str, int]) -> list[str]:
        """Rewrite the file as baseline + committed + pending, sort, audit.
        Returns audit problems (empty == clean)."""
        text = newline_guard(self._baseline)
        for func, addr, size in self._committed + [(p[0], p[1], p[2]) for p in self.pending]:
            text += delink_block(func, addr, size, self.srcdir)
        (ROOT / self.scope.delinks_path).write_text(text, encoding="utf-8")
        self.ops.sort_delinks(self.scope.delinks_path)
        return audit((ROOT / self.scope.delinks_path).read_text(encoding="utf-8"), symbols)

    def _stage(self, func: str, addr: int, size: int, symbols: dict[str, int]) -> None:
        s_rel = f"{self.srcdir}/{func}.s"
        # whole_function wrote the verified .s; cache its content so a bisect
        # revert can rm the file yet re-apply the exact bytes later.
        content = (ROOT / s_rel).read_text(encoding="utf-8")
        self.pending.append((func, addr, size, s_rel, content))
        self._write_delinks(symbols)

    def _revert_pending(self, symbols: dict[str, int]) -> None:
        """Undo staged-but-uncommitted carves: rewrite delinks WITHOUT pending
        (preserving baseline + committed + any co-lane edits in baseline), then
        rm only this run's pending .s. No git checkout, no reset --hard."""
        s_paths = [p[3] for p in self.pending]
        self.pending = []
        self._write_delinks(symbols)     # delinks first: never leave a block -> missing .s
        self.ops.rm_files(s_paths)

    def _reapply(self, carves: list[tuple[str, int, int, str, str]], symbols: dict[str, int]) -> None:
        for func, addr, size, s_rel, content in carves:
            (ROOT / s_rel).write_text(content, encoding="utf-8")
        self.pending = list(carves)
        self._write_delinks(symbols)

    def _commit_pending(self, symbols: dict[str, int]) -> bool:
        funcs = [p[0] for p in self.pending]
        lo = min(p[2] for p in self.pending)
        hi = max(p[2] for p in self.pending)
        paths = [self.scope.delinks_path] + [p[3] for p in self.pending]
        msg = (f"batch_carve: {self.scope.overlay or 'main'} .s +{len(funcs)} "
               f"(0x{lo:x}-0x{hi:x}) [auto, {self.scope.version} sha1 OK]")
        self._write_delinks(symbols)
        if not self.ops.git_commit(paths, msg):
            return False
        self._committed.extend((p[0], p[1], p[2]) for p in self.pending)
        self.report.passed.extend(funcs)
        self.report.committed_batches += 1
        self.pending = []
        return True

    def _commit_or_abort(self, symbols: dict[str, int]) -> None:
        if not self._commit_pending(symbols):
            raise CommitError("git commit did not advance HEAD — refusing to "
                              "continue (carves would be falsely reported shipped)")

    def _gate_commit_or_bisect(self, symbols: dict[str, int]) -> None:
        """Gate the pending batch; commit on green, bisect on red."""
        if not self.pending:
            return
        problems = self._write_delinks(symbols)
        if problems:
            self.log(f"  AUDIT FAILED ({len(problems)}): {problems[0]} -> bisect")
            self._bisect(self.pending, symbols, kind="audit-fail")
            return
        try:
            ok = self.ops.gate()
        except GateTimeout:
            funcs = [p[0] for p in self.pending]
            self.log(f"  ⏳ gate timed out (contention) -> DEFER {len(funcs)} "
                     f"(re-attemptable next run), no park")
            self._revert_pending(symbols)
            self.report.deferred.extend(funcs)
            return
        if ok:
            self.log(f"  ✅ gate OK -> commit {len(self.pending)} carves")
            self._commit_or_abort(symbols)
        else:
            self.log(f"  ❌ gate RED on batch of {len(self.pending)} -> bisect")
            self._bisect(self.pending, symbols, kind="gate-fail")

    def _bisect(self, carves: list, symbols: dict[str, int], kind: str = "gate-fail") -> None:
        """Delta-debug a red batch: revert, re-apply halves, commit the good,
        park the lone culprit (labelled `kind`: gate-fail or audit-fail). Each
        recursion re-gates with all already-committed carves present, so an
        interaction-only failure parks the later sibling, never a committed one."""
        self._revert_pending(symbols)
        if len(carves) == 1:
            func = carves[0][0]
            self.log(f"     culprit isolated: {func} -> park {kind}")
            self.report.gate_fail.append(func)
            self._park(func, kind, self.skip_path)
            return
        for half in bisect_plan(carves):
            self._reapply(half, symbols)
            if not self._write_delinks(symbols) and self.ops.gate():
                self.log(f"     half of {len(half)} OK -> commit")
                self._commit_or_abort(symbols)
            else:
                self._bisect(half, symbols, kind=kind)

    # ---- main loop ----
    def run(self, limit: int | None = None) -> Report:
        symbols = parse_symbols((self.scope.cfg_dir / "symbols.txt").read_text(encoding="utf-8"))
        self._baseline = (ROOT / self.scope.delinks_path).read_text(encoding="utf-8")
        # REFUSE to start if the SHARED delinks file already has uncommitted
        # edits — a co-lane (decomper) may have in-flight carves there, and our
        # reconstruction would otherwise drop them. (Skipped in dry-run / when
        # the file isn't under git, e.g. the unit-test sandbox.)
        if not self.dry_run and self.ops.is_dirty(self.scope.delinks_path):
            raise DirtyTreeError(
                f"{self.scope.delinks_path} has uncommitted changes — commit or "
                f"stash them before batch-carving the shared file")
        carved = carved_addrs(self._baseline)            # live set, grows as we stage
        skips = set()
        for p in (self.skip_path, self.verifyfail_path):
            if p and (ROOT / p).exists():
                skips |= parse_skiplist((ROOT / p).read_text(encoding="utf-8"))
        existing = set(os.listdir(ROOT / self.srcdir)) if (ROOT / self.srcdir).exists() else set()

        candidates = filter_candidates(symbols, carved, skips,
                                        min_addr=self.scope.min_addr,
                                        min_size=self.scope.min_size,
                                        max_size=self.scope.max_size)
        # file-level dedup (item 10): drop any candidate already present as .s/.c
        candidates = [(s, f) for s, f in candidates
                      if not any(f"{f}{ext}" in existing for ext in (".s", ".c"))]
        if limit:
            candidates = candidates[:limit]
        self.log(f"scope {self.scope.overlay or 'main'} "
                 f"0x{self.scope.min_size:x}-0x{self.scope.max_size:x}: "
                 f"{len(candidates)} candidates (batch={self.batch}, dry_run={self.dry_run})")

        for size, func in candidates:
            addr = func_addr(func)
            # live dedup re-check: another lane (or an earlier batch) may have
            # carved this addr / created this .s since the start-of-run snapshot.
            if addr in carved:
                self.log(f"  = {func} already carved (live dedup) — skip"); continue
            cd = self.ops.classify(func)
            if cd == "deferred":
                self.report.deferred.append(func); self.log(f"  ~ {func} deferred (classify)"); continue
            if cd == "refuse":
                self.report.refused.append(func); self._park(func, "kind:data-REFUSE", self.skip_path)
                self.log(f"  ⊘ {func} REFUSE (parked)"); continue
            if self.dry_run:
                self.report.passed.append(func); continue
            s_rel = f"{self.srcdir}/{func}.s"
            if (ROOT / s_rel).exists():               # never overwrite a co-lane's .s
                self.log(f"  = {func}.s already on disk — skip (no overwrite)"); continue
            wf = self.ops.whole_function(func, str(ROOT / s_rel))
            if wf == "deferred":
                self.report.deferred.append(func); self.log(f"  ~ {func} deferred (verify)"); continue
            if wf == "verify-fail":
                self.report.verify_fail.append(func); self._park(func, "verify-fail", self.verifyfail_path)
                self.log(f"  ✗ {func} verify-fail (parked)"); continue
            self._stage(func, addr, size, symbols)
            carved.add(addr)                          # keep the live set fresh
            self.log(f"  + {func} (0x{size:x}) staged [{len(self.pending)}/{self.batch}]")
            if len(self.pending) >= self.batch:
                self._gate_commit_or_bisect(symbols)

        # flush
        if not self.dry_run:
            self._gate_commit_or_bisect(symbols)
        self.log("REPORT: " + self.report.summary())
        return self.report


def _parse_size(s: str) -> int:
    return int(s, 0)


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description="Batch-carve driver (brief 456): "
                                 "deterministic mechanical lane with commit-on-pass.")
    ap.add_argument("--version", default="eur")
    ap.add_argument("--overlay", default=None, help="ovNNN (omit for arm9 main)")
    ap.add_argument("--min-addr", type=_parse_size, default=0x02234000,
                    help="upper-half guard (default 0x02234000)")
    ap.add_argument("--min-size", type=_parse_size, default=0x0)
    ap.add_argument("--max-size", type=_parse_size, default=0x10000)
    ap.add_argument("--batch", type=int, default=20, help="carves per gate/commit")
    ap.add_argument("--limit", type=int, default=None, help="max candidates this run")
    ap.add_argument("--call-timeout", type=float, default=0.0,
                    help="per asm_escape call timeout in s (0=off); defers on hang "
                         "so the driver coexists with a concurrent worktree build")
    ap.add_argument("--gate-timeout", type=float, default=0.0,
                    help="ninja sha1 gate timeout in s (0=off); on a wineserver "
                         "deadlock the gate is killed + treated as red (routes to "
                         "bisect/revert) instead of hanging forever")
    ap.add_argument("--gate-retries", type=int, default=1,
                    help="gate re-runs on a non-OK result before giving up "
                         "(absorbs the large-tree transient + a contention "
                         "timeout; raise under concurrent-worktree builds)")
    ap.add_argument("--skip-list", default=None)
    ap.add_argument("--verifyfail-list", default=None)
    ap.add_argument("--dry-run", action="store_true",
                    help="enumerate + classify only; no carve/gate/commit")
    ap.add_argument("--srcdir", default=None,
                    help="override .s output directory (default: scope.srcdir = "
                         "src/main or src/overlayNNN). Use src/usa/main for USA carves "
                         "so they stay region-specific and don't pollute the EUR baseline.")
    args = ap.parse_args(argv)

    scope = Scope(version=args.version, overlay=args.overlay, min_addr=args.min_addr,
                  min_size=args.min_size, max_size=args.max_size)
    ops = Ops(version=args.version, call_timeout=args.call_timeout,
              gate_timeout=args.gate_timeout, gate_retries=args.gate_retries)
    carver = BatchCarver(scope, ops, batch=args.batch, srcdir=args.srcdir,
                         skip_path=args.skip_list, verifyfail_path=args.verifyfail_list,
                         dry_run=args.dry_run)
    try:
        rep = carver.run(limit=args.limit)
    except (DirtyTreeError, CommitError) as e:
        print(f"batch_carve: ABORT — {e}", file=sys.stderr)
        return 2
    return 0 if not rep.gate_fail else 1


if __name__ == "__main__":
    raise SystemExit(main())
