#!/usr/bin/env python3
"""batch_carve.py — automate the DETERMINISTIC mechanical carve lanes (brief 456).

The ov002 `.s` reg-alloc lane and the region-port lane are deterministic: a
candidate either passes a byte-exact gate or it doesn't — no LLM judgement.
This driver enumerates uncarved candidates in a scope, runs the per-candidate
verification, stages the carve, and — crucially — **commits on a green
`ninja sha1` and reverts on a red one**, so a wave can never end with work
sitting uncommitted (the recurring ship-step miss).

    python tools/batch_carve.py --version eur --overlay ov002 \
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
- Brief 614: `gate()` no longer takes a Python-level lock. Each worktree
  gets its own WINEPREFIX (tools/configure.py) so concurrent `ninja sha1`
  calls no longer share a wineserver for the compile portion; only the
  `mwld` link step stays serialised, via a flock `tools/configure.py`
  embeds directly in the `mwld` ninja rule (tools/wine_link_lock.py) — a
  POSIX-only no-op on native Windows, which has no wineserver to
  serialise against. See docs/research/brief-608-wineprefix-spike.md.
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

_SYM_RE = re.compile(r"(\S+)\s+kind:function\(arm,size=(0x[0-9a-f]+)\)")
_SYM_ADDR_RE = re.compile(
    r"(\S+)\s+kind:function\(arm,size=0x[0-9a-f]+\)\s+addr:(0x[0-9a-f]+)")
_ALL_SYM_RE = re.compile(
    r"(\S+)\s+kind:function\((arm|thumb),size=(0x[0-9a-f]+)\)\s+addr:(0x[0-9a-f]+)")
# Per-TU section lines are a single space before "start:" and end right
# after end:0x...; the module-level section-map header at the top of every
# delinks.txt uses multiple spaces plus a kind:/align: suffix ("    .text
# start:0x... end:0x... kind:code align:32") and is deliberately NOT
# matched here -- brief 596, the same false-positive shape size_census.py
# was fixed for in brief 583 (see parse_claimed_text there).
_CARVED_RANGE_RE = re.compile(r"\.(?:text|init) start:(0x[0-9a-f]+) end:(0x[0-9a-f]+)\s*$")
_TEXT_RE = re.compile(r"\.text start:(0x[0-9a-f]+) end:(0x[0-9a-f]+)\s*$")
_SRC_HDR_RE = re.compile(r"(\S+/(func_\w+)\.s):$")
_REFUSE_VERDICT_RE = re.compile(r"data-ref \S+ @0x[0-9a-f]+: (\S+) \(REFUSE\)")


def classify_refuse_kind(output: str) -> str:
    """PURE (brief 545): given `asm_escape.py --classify-data`'s combined
    stdout+stderr, decide whether a REFUSE is the `C-absorbed`
    `base+small_offset` sub-case brief 543 proved recoverable via
    `--allow-absorbed-offset`, or a genuine wall.

    Parses the `data-ref SYM @0xADDR: VERDICT (REFUSE)` lines the preflight
    prints per brief 406's 5-verdict classifier (`asm_escape.classify_data_refs`)
    — mirrors that module's own `resolve_absorbed_substitutions`: recoverable
    ONLY if every refused ref is specifically `C-absorbed`. A REFUSE mixed
    with (or consisting of) `OFFSET`, `MISADDRESSED`, or an under-defined
    `B-gap` is a real wall — `--allow-absorbed-offset` cannot fix those, so
    don't waste a retry (or worse, blur the REFUSE/verify-fail park
    bucketing) on one.

    Returns 'absorbed' or 'wall'. No REFUSE lines found at all (unexpected
    output shape) conservatively returns 'wall' — same as today's behaviour."""
    verdicts = _REFUSE_VERDICT_RE.findall(output)
    if verdicts and all(v == "C-absorbed" for v in verdicts):
        return "absorbed"
    return "wall"


def parse_symbols(text: str) -> dict[str, int]:
    """func name -> size (bytes), ARM functions only.

    brief 596: the name capture used to require a literal `func_` prefix,
    so a symbol RENAMED to a semantic name (`OS_DisableIrq`, `Copy32`,
    `main`, ...) was invisible here even when genuinely still uncarved --
    naming (via signature-matching) and carving are independent steps, so
    an identified-but-uncarved renamed symbol is a real, common case, not
    an edge case. size_census.py's `_FUNC_RE` never had this restriction
    (`(\\S+)`), which is why size_census and batch_carve disagreed on
    candidate counts for every module with any renamed residue."""
    out: dict[str, int] = {}
    for line in text.splitlines():
        m = _SYM_RE.match(line.strip())
        if m:
            out[m.group(1)] = int(m.group(2), 16)
    return out


def parse_all_symbols(text: str) -> dict[str, tuple[str, int, int]]:
    """func name -> (kind, size, addr) for EVERY kind:function entry —
    ARM *and* THUMB (brief 596). Used only for the census breakdown
    (`census_breakdown`), so an empty batch_carve census can explain
    itself ("N thumb excluded by mode filter") instead of reporting an
    ambiguous bare zero. `parse_symbols`/`parse_symbol_addrs` remain the
    ARM-only, carve-eligible view the real carve loop uses — this
    function is reporting-only and never feeds a carve decision."""
    out: dict[str, tuple[str, int, int]] = {}
    for line in text.splitlines():
        m = _ALL_SYM_RE.match(line.strip())
        if m:
            out[m.group(1)] = (m.group(2), int(m.group(3), 16), int(m.group(4), 16))
    return out


def parse_symbol_addrs(text: str) -> dict[str, int]:
    """func name -> its REAL ROM addr (the `addr:` field), ARM functions only.

    Most funcs are named after their address (func_021abcde @ 0x021abcde), but
    some are NOT: the -0xF4 USA/JPN main drift band names a func for its nominal
    (EUR) address while dsd places it 0xF4 lower — e.g. func_020a60a8 lives at
    0x020a5fb4.  The delinks block MUST use this real addr; the name-derived
    address (func_addr) writes the .s delink at the wrong location, so dsd links
    the bytes into the wrong place and the ROM sha1 gate fails (brief 483 autopsy).
    asm_escape already resolves the symbol to its real addr, so the .s itself is
    byte-correct — only the delink position was wrong.

    brief 596: like `parse_symbols`, the name capture used to require a
    literal `func_` prefix — a RENAMED symbol has no address encoded in
    its name at all (not just a drifted one), so it needs this dict even
    more than an address-named func does; `filter_candidates` now resolves
    every candidate's address through here first, `func_addr()` only as a
    last-resort fallback.
    """
    out: dict[str, int] = {}
    for line in text.splitlines():
        m = _SYM_ADDR_RE.match(line.strip())
        if m:
            out[m.group(1)] = int(m.group(2), 16)
    return out


def func_addr(func: str) -> int:
    """func_ovNNN_021abcde / func_021abcde -> 0x021abcde (NAME-derived; a fallback
    only — prefer parse_symbol_addrs for the real ROM addr, see its note)."""
    return int(func.rsplit("_", 1)[-1], 16)


_DELINK_HDR_RE = re.compile(r"(?:\S+/)?(func_\w+)\.\S+:$")

def carved_addrs(delinks_text: str) -> set[int]:
    """Every address a delinks.txt entry has already claimed.

    brief 596: used to collect ANY `start:0x...` occurrence in the whole
    text via a bare, unanchored regex — including the module-level
    section-map header at the top of every delinks.txt ("    .text
    start:0x... end:0x... kind:code align:32", multiple spaces + a
    kind:/align: suffix). That header's start: address is always the
    module's very first byte, which is ALSO the real address of whichever
    function happens to sit there — so the first function of every
    module was silently marked "carved" even when genuinely still
    uncarved (confirmed live: func_ov002_021aa3c0 and 20+ siblings, one
    per overlay, all at each module's own base address). Scoped now to
    per-TU CODE_SECTIONS (.text + .init) lines only, via the same
    single-space/no-suffix discipline size_census.py's
    `parse_claimed_text` was fixed to use in brief 583 — a module header
    never satisfies it, a real per-TU claim always does.
    """
    # Include both start: addresses AND name-derived addresses from headers.
    # Some symbols have a name that doesn't match their ROM addr (thunks/trampolines),
    # so checking both prevents re-queuing already-delinked symbols.
    addrs: set[int] = set()
    for raw in delinks_text.splitlines():
        m = _CARVED_RANGE_RE.search(raw.rstrip())
        if m:
            addrs.add(int(m.group(1), 16))
    for line in delinks_text.splitlines():
        m = _DELINK_HDR_RE.match(line.strip())
        if m:
            try:
                addrs.add(func_addr(m.group(1)))
            except ValueError:
                pass
    return addrs


def parse_skiplist(text: str) -> set[str]:
    """A skip-list line is `<func> [reason...]`; blank/`#` lines ignored."""
    out: set[str] = set()
    for line in text.splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        out.add(line.split()[0])
    return out


def real_addr(func: str, sym_addrs: dict[str, int]) -> int | None:
    """The function's real ROM address: `sym_addrs` (the authoritative
    `addr:` field) first, name-derived `func_addr()` as a last-resort
    fallback for a name absent from `sym_addrs`. Returns None (never
    raises) if neither resolves — e.g. a renamed symbol somehow missing
    its own `addr:` entry, which should not occur in well-formed
    symbols.txt but must not crash a census over one bad line."""
    a = sym_addrs.get(func)
    if a is not None:
        return a
    try:
        return func_addr(func)
    except ValueError:
        return None


def filter_candidates(symbols: dict[str, int], sym_addrs: dict[str, int],
                      carved: set[int], skips: set[str],
                      *, min_addr: int, min_size: int, max_size: int) -> list[tuple[int, str]]:
    """(size, func) sorted by size then addr — the carve order (smallest first).

    brief 596: resolves each candidate's address via `sym_addrs` (real ROM
    addr) rather than name-derived `func_addr()` throughout — a renamed
    function (`OS_DisableIrq`) has no address encoded in its name at all,
    and even an address-named one can drift from its own name in the
    USA/JPN main -0xF4 band (see `parse_symbol_addrs`'s docstring); the
    real address is correct in both cases. Previously this used
    `func_addr(func)` directly, which would raise on any renamed symbol —
    moot before brief 596 since `parse_symbols` never surfaced renamed
    symbols to begin with, but load-bearing now that it does.
    """
    out: list[tuple[int, str]] = []
    for func, size in symbols.items():
        a = real_addr(func, sym_addrs)
        if a is None:
            continue
        if a < min_addr or not (min_size <= size <= max_size):
            continue
        if a in carved or func in skips:
            continue
        out.append((size, func))
    out.sort(key=lambda t: (t[0], real_addr(t[1], sym_addrs) or 0))
    return out


@dataclass
class CensusBreakdown:
    """Explains a candidate census, especially an empty one (brief 596: a
    bare "0 candidates" line fooled the brain twice into concluding a
    module had no residue, when the real cause was a mode filter or a
    parsing gap — not an actually-drained module). Every kind:function
    entry in the module's symbols.txt lands in exactly one bucket."""
    total_functions: int = 0       # every kind:function(arm|thumb) entry
    thumb_excluded: int = 0        # kind=thumb -- invisible to the arm-only carve mode
    below_min_addr: int = 0        # arm, real addr < min_addr
    size_out_of_range: int = 0     # arm, in addr range, size outside [min_size, max_size]
    already_carved: int = 0        # arm, in range, but addr already claimed
    skiplisted: int = 0            # arm, uncarved, but func is in a skip/verifyfail list
    on_disk_dedup: int = 0         # arm, would-be candidate, but a .s/.c already exists
    candidates: list[tuple[int, str]] = field(default_factory=list)

    def summary(self) -> str:
        if self.candidates:
            return f"{len(self.candidates)} candidates"
        reasons = []
        if self.thumb_excluded:
            reasons.append(f"{self.thumb_excluded} thumb excluded by mode filter")
        if self.already_carved:
            reasons.append(f"{self.already_carved} already carved")
        if self.on_disk_dedup:
            reasons.append(f"{self.on_disk_dedup} already have a .s/.c on disk")
        if self.size_out_of_range:
            reasons.append(f"{self.size_out_of_range} outside size range")
        if self.below_min_addr:
            reasons.append(f"{self.below_min_addr} below min-addr")
        if self.skiplisted:
            reasons.append(f"{self.skiplisted} skip-listed")
        if not reasons:
            return "0 candidates (module has no kind:function entries in scope)"
        return "0 candidates (" + ", ".join(reasons) + ")"


def census_breakdown(sym_text: str, carved: set[int], skips: set[str],
                     existing: frozenset[str] = frozenset(), *,
                     min_addr: int, min_size: int, max_size: int) -> CensusBreakdown:
    """PURE (brief 596): classify EVERY `kind:function` entry — ARM *and*
    THUMB — in a module's symbols.txt into exactly one bucket, so a
    0-candidate census can explain itself instead of printing a bare,
    uninformative zero.

    This is a reporting-only parallel to `filter_candidates` (parses via
    `parse_all_symbols`, independent of `parse_symbols`/`parse_symbol_addrs`),
    not a rewrite of it — the real carve loop still goes through
    `filter_candidates`/`carved_addrs` unchanged. `test_census_breakdown_
    matches_filter_candidates` pins the two candidate lists against each
    other on real fixtures so they cannot silently drift apart.
    """
    all_symbols = parse_all_symbols(sym_text)
    b = CensusBreakdown(total_functions=len(all_symbols))
    staged: list[tuple[int, int, str]] = []  # (size, addr, func) pre-sort
    for func, (kind, size, addr) in all_symbols.items():
        if kind == "thumb":
            b.thumb_excluded += 1
            continue
        if addr < min_addr:
            b.below_min_addr += 1
            continue
        if not (min_size <= size <= max_size):
            b.size_out_of_range += 1
            continue
        if addr in carved:
            b.already_carved += 1
            continue
        if func in skips:
            b.skiplisted += 1
            continue
        if any(f"{func}{ext}" in existing for ext in (".s", ".c")):
            b.on_disk_dedup += 1
            continue
        staged.append((size, addr, func))
    staged.sort()
    b.candidates = [(size, func) for size, _addr, func in staged]
    return b


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


def branch_guard_message(branch: str, detached_at_origin_main: bool, force: bool) -> str | None:
    """PURE (improvement-swarm r3 safety flag): decide whether batch_carve should
    refuse to run given the current branch state. Returns an error message if it
    should refuse, or None if it's safe to proceed.

    Real risk: batch_carve auto-commits every green batch (see module docstring).
    An unattended launch in the wrong worktree — HEAD still on `main`, or a
    detached HEAD that happens to point at origin/main — would push carve waves
    straight past review. `force=True` (--force-branch) is an explicit escape
    hatch for the rare intentional case."""
    if force:
        return None
    if branch == "main":
        return ("refusing to carve on branch 'main' — batch_carve auto-commits "
                 "each green-gated batch, and an unattended run on main would "
                 "ship carve waves with no review. Create a work branch first "
                 "(git switch -C claude/<brief>-NNN origin/main), or pass "
                 "--force-branch if this is intentional.")
    if detached_at_origin_main:
        return ("refusing to carve on a detached HEAD pointing at origin/main — "
                 "same risk as branch 'main' (see above). Create a work branch "
                 "first, or pass --force-branch if this is intentional.")
    return None


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
                 gate_timeout: float = 0.0, platform: str | None = None):
        self.version = version
        self.call_timeout = call_timeout
        self.gate_retries = gate_retries
        self.gate_timeout = gate_timeout
        self.platform = platform or sys.platform

    @property
    def is_windows(self) -> bool:
        return self.platform == "win32"

    def _run(self, cmd: list[str], timeout: float | None = None) -> subprocess.CompletedProcess:
        return subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True, timeout=timeout)

    def _kill_orphans(self) -> None:
        # Windows runs the toolchain natively. Never use POSIX process tools or
        # globally task-kill mwcc/mwld there: another worktree may own them.
        if self.is_windows:
            return
        # kill every Win32 toolchain proc that can hang on a wedged wineserver
        for exe in ("mwasmarm.exe", "mwldarm.exe", "mwccarm.exe"):
            subprocess.run(["pkill", "-f", exe], capture_output=True)
        subprocess.run(["pkill", "-f", "ninja sha1"], capture_output=True)

    def classify(self, func: str) -> str:
        """'clean' | 'refuse' | 'refuse-absorbed' | 'tool-error' | 'deferred'.

        'refuse-absorbed' (brief 545): the REFUSE is purely the `C-absorbed`
        sub-case brief 543 proved recoverable — `run()` retries these via
        `whole_function()` (which now always carries
        `--allow-absorbed-offset`) instead of parking immediately. A genuine
        wall (OFFSET/MISADDRESSED/other) still returns plain 'refuse' and is
        parked exactly as before.

        'tool-error' (brief 583, r5 finding): asm_escape's `--classify-data`
        returns exit 1 for BOTH a genuine data-ref REFUSE and an infra
        failure reading module config (a `FileNotFoundError`, printed as
        "error: preflight could not read module config: ..." — no "REFUSE"
        text). The old code's `return "refuse"` fallback for any output
        containing neither "REFUSE" nor "clean"/"✅" silently parked infra
        failures into the SAME skip-list bucket as a real wall (r.returncode
        was never even read). `tool-error` is deliberately NEVER parked (see
        BatchCarver.run()) and NEVER counted in the clean-rate denominator
        (see Report.summary()) — it means "no real verdict", not "wall"."""
        try:
            r = self._run([sys.executable, "tools/asm_escape.py", "--classify-data",
                           "--version", self.version, func],
                          timeout=self.call_timeout or None)
        except subprocess.TimeoutExpired:
            self._kill_orphans()
            return "deferred"
        out = r.stdout + r.stderr
        if r.returncode not in (0, 1):
            return "tool-error"   # crashed / killed / unexpected exit
        if "REFUSE" in out:
            return "refuse-absorbed" if classify_refuse_kind(out) == "absorbed" else "refuse"
        if r.returncode == 0 and ("clean" in out or "✅" in out):
            return "clean"
        return "tool-error"   # unknown output (e.g. infra error) -> do NOT park as a wall

    def whole_function(self, func: str, out_path: str) -> str:
        """'pass' | 'verify-fail' | 'tool-error' | 'deferred'. Writes out_path
        on pass.

        Always passes `--allow-absorbed-offset` (brief 545): a proven no-op
        when the preflight is clean or the REFUSE isn't purely `C-absorbed`
        (asm_escape refuses identically either way — see brief 543), and the
        only way a 'refuse-absorbed' classify() retry can actually recover.

        'tool-error' (brief 583, r5 finding): asm_escape's `generate_whole()`
        returns exit 2 at 7 distinct infra-failure sites ("not found in
        build/{version}/delinks ... run `ninja` first?", "no configured
        function size", "did not assemble", ...) and exit 1 for BOTH a
        genuine byte-mismatch (the "did NOT verify" case, the one that
        belongs in verify-fail/the floor) and a couple of REFUSE-shaped
        early-outs that should never reach this method in practice (classify()
        already filtered to clean/refuse-absorbed candidates). The old code
        read neither `r.returncode` NOR the message text — ANY non-pass
        output landed in `verify-fail`, the exact bucket every endgame-ledger
        residual row is built from (b577 already shipped real `ninja sha1`
        fixes for two functions the ledger had recorded as permanent floor).
        Now `verify-fail` requires BOTH returncode==1 AND asm_escape's own
        explicit "did NOT verify" marker; everything else — exit 2, or exit 1
        without that marker — is `tool-error` (never parked, never counted
        as floor; see Report.summary() and BatchCarver.run())."""
        try:
            r = self._run([sys.executable, "tools/asm_escape.py", "--whole-function",
                           "--allow-absorbed-offset",
                           "--version", self.version, func, "--out", out_path],
                          timeout=self.call_timeout or None)
        except subprocess.TimeoutExpired:
            self._kill_orphans()
            # asm_escape writes the .s BEFORE byte-verify; a deferred call leaves
            # an unverified .s — drop it so it can't be mistaken for a pass.
            Path(out_path).unlink(missing_ok=True)
            return "deferred"
        out = r.stdout + r.stderr
        if r.returncode == 0 and ("byte-identical" in out or "✅" in out):
            return "pass"
        Path(out_path).unlink(missing_ok=True)
        if r.returncode == 1 and "did NOT verify" in out:
            return "verify-fail"
        return "tool-error"

    def gate(self) -> bool:
        """`ninja sha1` with one retry (large-tree transient, item 11b).

        Green ONLY when ninja exits 0 AND sha1 prints `<rom>: OK` (a printed OK
        from a not-fully-rebuilt tree is not trusted). Distinguishes two failure
        modes so a concurrent-build deadlock never false-parks a clean carve:
          * a completed run that is not OK  -> return False (real RED -> bisect);
          * EVERY attempt killed by `gate_timeout` (a hung build) -> raise
            GateTimeout -> the batch is DEFERRED, not parked.

        Brief 614: no longer takes a Python-level lock around this call. Each
        worktree gets its own WINEPREFIX (tools/configure.py), so concurrent
        `ninja sha1` calls no longer share a wineserver for the compile
        portion; the `mwld` link step alone stays serialised, via a flock
        `tools/configure.py` embeds directly in the `mwld` ninja rule
        (tools/wine_link_lock.py) — invisible from here, since it's inside
        the `ninja sha1` subprocess call below, not wrapped around it."""
        to = self.gate_timeout or None
        completed_any = False
        for _ in range(self.gate_retries + 1):
            try:
                self._run([sys.executable, "tools/configure.py", self.version], timeout=to)
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

    def current_branch(self) -> str:
        """The checked-out branch name, or 'HEAD' if detached (git's own
        convention for `--abbrev-ref` on a detached HEAD)."""
        return self._run(["git", "rev-parse", "--abbrev-ref", "HEAD"]).stdout.strip()

    def is_detached_at_origin_main(self) -> bool:
        """True only when HEAD is detached AND its commit == origin/main's tip —
        the risky case the branch guard exists for (see branch_guard_message).
        A detached HEAD elsewhere (e.g. mid-rebase, a pinned older commit) is not
        guarded against; only an accidental "still on main's tip" launch is."""
        if self.current_branch() != "HEAD":
            return False
        r = self._run(["git", "rev-parse", "origin/main"])
        if r.returncode != 0:
            return False   # no origin/main to compare against -> nothing to guard
        return self.head_rev() == r.stdout.strip()

    def check_delink_dupes(self) -> tuple[bool, str]:
        """Preflight (improvement-swarm r3 safety flag): scan every
        config/**/delinks.txt for a `.text` address two different files both
        claim, BEFORE this run stages any more entries on top of a possibly
        already-broken tree. Returns (ok, combined stdout+stderr)."""
        r = self._run([sys.executable, "tools/check_delink_dupes.py"])
        return r.returncode == 0, (r.stdout + r.stderr)

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
        r = self._run([sys.executable, "tools/sort_delinks.py", delinks_path])
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
    absorbed: list[str] = field(default_factory=list)
    verify_fail: list[str] = field(default_factory=list)
    gate_fail: list[str] = field(default_factory=list)
    deferred: list[str] = field(default_factory=list)
    tool_error: list[str] = field(default_factory=list)
    committed_batches: int = 0

    def summary(self) -> str:
        """`absorbed` is a SUBSET count, not a new bucket: every func in it
        also lands in `passed`/`verify_fail`/`deferred` (its real outcome) —
        it just tags "REFUSE routed through --allow-absorbed-offset instead
        of parked" (brief 545). In `--dry-run` it's an unattempted estimate
        (classify() only), same caveat `passed` already carries there.

        `tool_error` (brief 583) is excluded from the clean-rate denominator
        for the same reason `deferred` already is: it means "no real verdict
        this run" (a returncode/output classify() or whole_function() didn't
        recognize), not a real pass or a real park — counting it either way
        would misrepresent the actual wall rate."""
        total = len(self.passed) + len(self.refused) + len(self.verify_fail) + len(self.gate_fail)
        rate = (100 * len(self.passed) // total) if total else 0
        return (f"SHIPPED {len(self.passed)} | REFUSE {len(self.refused)} | "
                f"absorbed-routed {len(self.absorbed)} | "
                f"verify-fail {len(self.verify_fail)} | gate-fail {len(self.gate_fail)} | "
                f"deferred {len(self.deferred)} | tool-error {len(self.tool_error)} | "
                f"clean-rate {rate}% | commits {self.committed_batches}")


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
        for _, _, _, s_rel, content in carves:
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
            if not self._write_delinks(symbols):
                try:
                    green = self.ops.gate()
                except GateTimeout:
                    # contention during bisect -> defer this half cleanly
                    # rather than crash the run with an uncaught GateTimeout.
                    funcs = [p[0] for p in half]
                    self.log(f"     ⏳ gate timed out in bisect -> DEFER "
                             f"{len(funcs)} (re-attemptable next run)")
                    self._revert_pending(symbols)
                    self.report.deferred.extend(funcs)
                    continue
                if green:
                    self.log(f"     half of {len(half)} OK -> commit")
                    self._commit_or_abort(symbols)
                    continue
            self._bisect(half, symbols, kind=kind)

    # ---- main loop ----
    def run(self, limit: int | None = None) -> Report:
        sym_text = (self.scope.cfg_dir / "symbols.txt").read_text(encoding="utf-8")
        symbols = parse_symbols(sym_text)
        sym_addrs = parse_symbol_addrs(sym_text)   # real ROM addr per func (drift band)
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

        candidates = filter_candidates(symbols, sym_addrs, carved, skips,
                                        min_addr=self.scope.min_addr,
                                        min_size=self.scope.min_size,
                                        max_size=self.scope.max_size)
        # file-level dedup (item 10): drop any candidate already present as .s/.c
        candidates = [(s, f) for s, f in candidates
                      if not any(f"{f}{ext}" in existing for ext in (".s", ".c"))]
        # brief 596: self-describing census — WHY, not just how many. Cheap
        # (pure, no I/O beyond the sym_text already in hand) so it's always
        # computed, not just on the zero-candidate path; its own candidate
        # count matches `candidates` above exactly (pinned by
        # test_census_breakdown_matches_filter_candidates), so the "N
        # candidates" case is unchanged and the "0 candidates" case gains
        # an explanation instead of a placeholder scope line the brain has
        # already been fooled by twice.
        breakdown = census_breakdown(sym_text, carved, skips, frozenset(existing),
                                     min_addr=self.scope.min_addr,
                                     min_size=self.scope.min_size,
                                     max_size=self.scope.max_size)
        if limit:
            candidates = candidates[:limit]
        self.log(f"scope {self.scope.overlay or 'main'} "
                 f"0x{self.scope.min_size:x}-0x{self.scope.max_size:x}: "
                 f"{breakdown.summary()} (of {breakdown.total_functions} total; "
                 f"batch={self.batch}, dry_run={self.dry_run})")

        for size, func in candidates:
            addr = real_addr(func, sym_addrs)   # real ROM addr (drift band / renamed); never name-derived-only
            # live dedup re-check: another lane (or an earlier batch) may have
            # carved this addr / created this .s since the start-of-run snapshot.
            if addr in carved:
                self.log(f"  = {func} already carved (live dedup) — skip"); continue
            cd = self.ops.classify(func)
            if cd == "deferred":
                self.report.deferred.append(func); self.log(f"  ~ {func} deferred (classify)"); continue
            if cd == "tool-error":
                # brief 583: no real verdict (infra failure, not a genuine
                # wall) -- must NOT be parked, must NOT count as REFUSE. The
                # candidate simply reappears as uncarved next run.
                self.report.tool_error.append(func)
                self.log(f"  ⚠ {func} tool-error (classify) — not parked, retry next run"); continue
            if cd == "refuse":
                self.report.refused.append(func); self._park(func, "kind:data-REFUSE", self.skip_path)
                self.log(f"  ⊘ {func} REFUSE (parked)"); continue
            if cd == "refuse-absorbed":
                # brief 545: purely C-absorbed -- don't park, fall through and
                # let whole_function() (always --allow-absorbed-offset) try it.
                self.report.absorbed.append(func)
                self.log(f"  ◆ {func} REFUSE (C-absorbed, base+offset-recoverable — attempting)")
            if self.dry_run:
                self.report.passed.append(func); continue
            s_rel = f"{self.srcdir}/{func}.s"
            if (ROOT / s_rel).exists():               # never overwrite a co-lane's .s
                self.log(f"  = {func}.s already on disk — skip (no overwrite)"); continue
            wf = self.ops.whole_function(func, str(ROOT / s_rel))
            if wf == "deferred":
                self.report.deferred.append(func); self.log(f"  ~ {func} deferred (verify)"); continue
            if wf == "tool-error":
                # brief 583: exit-2 infra failure (or exit-1 without asm_escape's
                # explicit "did NOT verify" marker) -- NOT a genuine byte
                # mismatch, must NOT be parked into verifyfail_path (that
                # bucket is the floor/ledger's source; this isn't a wall).
                self.report.tool_error.append(func)
                self.log(f"  ⚠ {func} tool-error (verify) — not parked, retry next run"); continue
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
                         "deadlock the gate is killed + deferred instead of "
                         "being parked as a real red")
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
    ap.add_argument("--force-branch", action="store_true",
                    help="bypass the branch-safety guard (refuses to carve on "
                         "'main' or a detached HEAD at origin/main — batch_carve "
                         "auto-commits every green batch). Only for an "
                         "intentional main-targeted run.")
    ap.add_argument("--skip-dupe-check", action="store_true",
                    help="skip the check_delink_dupes.py preflight (default: run "
                         "it before carving and abort on any duplicate .text "
                         "address, since `dsd lcf` would fail at merge anyway)")
    args = ap.parse_args(argv)

    ops = Ops(version=args.version, call_timeout=args.call_timeout,
              gate_timeout=args.gate_timeout, gate_retries=args.gate_retries)

    branch = ops.current_branch()
    guard_msg = branch_guard_message(branch, ops.is_detached_at_origin_main(),
                                     args.force_branch)
    if guard_msg:
        print(f"batch_carve: REFUSING (branch={branch!r}) — {guard_msg}", file=sys.stderr)
        return 2

    if not args.skip_dupe_check:
        dupes_ok, dupes_out = ops.check_delink_dupes()
        if not dupes_ok:
            print(dupes_out, file=sys.stderr)
            print("batch_carve: ABORT — check_delink_dupes preflight found a "
                  "pre-existing duplicate .text address (see above); fix it "
                  "before carving on top of it, or pass --skip-dupe-check if "
                  "this is a known false positive.", file=sys.stderr)
            return 2

    scope = Scope(version=args.version, overlay=args.overlay, min_addr=args.min_addr,
                  min_size=args.min_size, max_size=args.max_size)
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
