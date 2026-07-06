#!/usr/bin/env python3
"""
containment_check.py — classify a candidate's build-vs-baseline ARM9 diff as
CONTAINED (reshapeable) or AVALANCHE (park it).

Brief 514 (docs/research/brief-514-forensics.md) found that objdiff/sha1
alone don't distinguish two very different failure modes for a candidate
that fails `ninja sha1`:

  1. LOCALIZED CANDIDATE MISMATCH: every differing byte in the built ARM9
     image falls inside the candidate's own delinked [start, end) range.
     This is a normal C-shaping/regalloc/operand-order miss — worth
     continued instruction-level iteration ("reshapeable").
  2. LINK/LAYOUT AVALANCHE: differing bytes appear OUTSIDE the candidate's
     range (often starting in early ARM9 text / Entry.c), or the linked
     ARM9 image changed SIZE. The candidate's current C draft perturbed
     link layout/relocation output project-wide — not a pool/callee value
     problem, and not worth further per-instruction tuning until the size/
     layout issue itself is understood. Park it.

This tool automates brief 514's manual recipe: diff a built binary against
its baseline, map every differing byte run to a virtual address, and check
whether every run's VA range is fully contained in the candidate's own
delinked range — PLUS an unconditional full-length size check that alone
forces AVALANCHE on any mismatch (see "brief 534 fix" below).

MODULE-AWARE (brief 534 fix — read this if you're touching overlay code):
this tool used to hardcode "main"'s binaries (`build/<region>/build/
arm9.bin` / `extract/<region>/arm9/arm9.bin`) and VA base (`0x02000000`)
as the ONLY default, regardless of which module a candidate actually
belonged to. For an overlay candidate, that default pair is a DIFFERENT,
always-clean binary the overlay's own compiled bytes never touch — a
caller who forgot to manually pass `--built`/`--extract` overlay overrides
got a rubber-stamp CONTAINED that said nothing about the real overlay
state. Confirmed as the actual mechanism behind 3 false-CONTAINED
verdicts in brief 525. Now the module is resolved (from `--candidate`'s
path, `--addr`'s matched delinks.txt entry, or `--range` via the same
address-containment lookup) BEFORE picking defaults, so `--built`/
`--extract` auto-select the right binary pair and VA base for whichever
module the candidate is actually in. Explicit `--built`/`--extract` still
override the default, same as before.

Prerequisites:
  - `python tools/configure.py <region>` has been run
  - The candidate is currently applied (its delinks.txt entry is the `.c`
    under test) and `ninja rom` has been rebuilt, so the module's built
    binary (`build/<region>/build/arm9.bin` for main, `arm9_ovNNN.bin` for
    an overlay, `itcm.bin`/`dtcm.bin` for those) reflects the candidate
  - The module's baseline binary exists under `extract/<region>/...`
    (produced by `dsd rom extract`, which `ninja` runs once per region)

Usage:
    # Explicit range (already known, e.g. from delinks.txt or a dossier) —
    # module is auto-detected from the range's own start address:
    python tools/containment_check.py eur --range 0x02001e5c 0x02001e84

    # Auto-resolve the range (and module) from delinks.txt by candidate
    # path (.c or .s, whichever extension delinks.txt currently shows):
    python tools/containment_check.py eur --candidate src/main/func_02001e5c.c

    # Auto-resolve the range (and module) from just a bare address:
    python tools/containment_check.py eur --addr 0x02001e5c

    # An OVERLAY candidate — module auto-detected as ov005, so the default
    # --built/--extract now correctly point at ov005's own binaries, not
    # main's (the brief 525 bug this round fixed):
    python tools/containment_check.py eur --addr 0x021abcc4 --module ov005

    # Overlay addresses are frequently AMBIGUOUS (this game's overlay RAM
    # windows are reused by overlays that never coexist in memory), so
    # --addr alone may report multiple candidates and ask for --module:
    python tools/containment_check.py eur --addr 0x021aa558
    #   -> ERROR: address 0x021aa558 is AMBIGUOUS -- 9 different TUs ...
    #        --module ov002 -> [0x021aa558, 0x021ab864) ...
    python tools/containment_check.py eur --addr 0x021aa558 --module ov002

Options:
    --json          Machine-readable JSON output
    --built PATH    Override the built binary path (default: module-aware,
                     see above)
    --extract PATH  Override the baseline binary path (default: module-aware,
                     see above)
    --max-owner-lookups N   How many out-of-range runs to resolve an
                     "owner" TU for (default 5; owner lookup scans all
                     delinks.txt files, so it's capped to stay cheap on a
                     massive avalanche with 100k+ runs)
    --module MODULE Declares/disambiguates which module ("main",
                     "ov002"/"overlay002"/"2" all accepted) the candidate
                     belongs to. Required when --addr or --range is
                     ambiguous or not found in any delinks.txt yet.

Exit codes:
    0   CONTAINED — every differing byte run is inside the candidate range
        AND the full built/baseline lengths match exactly
    1   AVALANCHE — a run spilled outside the range, or the built/baseline
        lengths differ at all (checked on the FULL, untruncated lengths —
        brief 534)
    2   Infrastructure error (region unknown, files missing, bad range,
        candidate not found in any delinks.txt, etc.)

See `tests/test_containment_check.py` for the regression suite, including
the brief-534 case this fix targets: an overlay candidate whose module-
default main-binary pair is IDENTICAL (would falsely read CONTAINED under
the old hardcoded-to-main defaults) while its real, module-correct overlay
binary pair has a genuine diff.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
_KNOWN_REGIONS = ("eur", "usa", "jpn")

# ARM9 load address: every ARM9 virtual address in this game is
# `0x02000000 + <offset into the uncompressed arm9.bin>`. Confirmed against
# brief-514-forensics.md's own worked examples (offset 0x8f8 <-> VA
# 0x020008f8, etc.) and against tools/configure.py's own use of
# `--base-va 0x02000000` for `patch_module_literals.py`.
ARM9_BASE_VA = 0x02000000

# Matches a TU declaration header in delinks.txt — same shape as
# patch_section_align.py's `_DELINKS_TU_HEADER_RE` / configure.py's
# `_DELINKS_TU_HEADER_RE`. Kept as an independent copy (this tool's own
# concern: resolving a candidate's range and, for diagnostics, the owner of
# an out-of-range VA) rather than importing either — same "tools stay
# decoupled at the module level" rationale used throughout this codebase.
_DELINKS_TU_HEADER_RE = re.compile(
    r"^(?P<path>[^\s:#][^\s:]*\.[csS](?:pp)?):\s*$", re.MULTILINE,
)
_DELINKS_TEXT_RANGE_RE = re.compile(
    r"^[ \t]+\.text[ \t]+start:0x(?P<start>[0-9a-fA-F]+)[ \t]+"
    r"end:0x(?P<end>[0-9a-fA-F]+)[ \t]*$",
)


# ---------------------------------------------------------------------------
# delinks.txt lookups
# ---------------------------------------------------------------------------

def _normalize_module(module: str) -> str | None:
    """"ov002" / "overlay002" / "002" / "2" -> "ov002"; "main"/"arm9" ->
    "main". Returns None if it doesn't look like either shape (caller
    should then treat the module as unrecognized rather than silently
    matching nothing)."""
    m = module.strip().lower()
    if m in ("main", "arm9"):
        return "main"
    m = re.sub(r"^(overlay|ov)", "", m)
    if m.isdigit():
        return f"ov{int(m):03d}"
    return None


def _iter_delinks_files(region: str, module: str | None = None):
    """Yield delinks.txt paths for a region. If `module` is given (e.g.
    "main", "ov002", "overlay002"), scope to just that module's own
    delinks.txt instead of every module in the region — needed because
    this game's overlay RAM windows are reused across overlays that never
    coexist in memory (see CLAUDE.md's `dsd init` note and
    docs/research/retriage/kb-retriage-rounds' "same address across
    overlays is usually coincidental" gotcha), so an unscoped scan can
    return several unrelated TUs for the same address.
    """
    config_arm9 = ROOT / "config" / region / "arm9"
    if not config_arm9.is_dir():
        return
    if module is None:
        yield from sorted(config_arm9.rglob("delinks.txt"))
        return
    norm = _normalize_module(module)
    if norm == "main":
        main_delinks = config_arm9 / "delinks.txt"
        if main_delinks.is_file():
            yield main_delinks
        return
    if norm is not None:
        ov_dir = config_arm9 / "overlays" / norm
        if ov_dir.is_dir():
            yield from sorted(ov_dir.rglob("delinks.txt"))


def _module_from_delinks_path(delinks_path: Path, region: str) -> str | None:
    """Derive a module name ('main', 'itcm', 'dtcm', 'ovNNN') from a
    delinks.txt file's own location, e.g.
    `config/eur/arm9/overlays/ov005/delinks.txt` -> `'ov005'`,
    `config/eur/arm9/itcm/delinks.txt` -> `'itcm'`,
    `config/eur/arm9/delinks.txt` -> `'main'`.

    This is the module-awareness this tool was missing (brief 534):
    every downstream binary-path / VA-base decision keys off this, not
    a single hardcoded "main" assumption.
    """
    try:
        rel = delinks_path.resolve().relative_to(
            (ROOT / "config" / region / "arm9").resolve()
        )
    except ValueError:
        return None
    parts = rel.parts
    if len(parts) == 1:
        return "main"
    if parts[0] == "overlays" and len(parts) >= 2:
        return parts[1]
    if parts[0] in ("itcm", "dtcm"):
        return parts[0]
    return None


def _module_delinks_path(region: str, module: str) -> Path | None:
    """Inverse of `_module_from_delinks_path`: a module name -> its own
    delinks.txt path."""
    if module == "main":
        return ROOT / "config" / region / "arm9" / "delinks.txt"
    if module in ("itcm", "dtcm"):
        return ROOT / "config" / region / "arm9" / module / "delinks.txt"
    if module.startswith("ov"):
        return ROOT / "config" / region / "arm9" / "overlays" / module / "delinks.txt"
    return None


def _module_va_base(region: str, module: str) -> int | None:
    """A module's `.text` load VA, read from its own delinks.txt's first
    `.text start:` line. Mirrors `tools/predict_walls.py`'s
    `_module_text_base` — same idea, same source of truth, kept as an
    independent copy per this codebase's "tools stay decoupled" norm.

    This REPLACES the old hardcoded `ARM9_BASE_VA = 0x02000000` for
    anything that isn't `main`: an overlay's own RAM window starts at
    whatever address its own delinks.txt says, not at the ARM9 base —
    treating an overlay candidate's file offsets as if they were
    `0x02000000`-based (the pre-fix behavior) computes VAs that can
    never land inside the candidate's real (overlay-space) range,
    which is a *different* bug shape than the one brief 534 named but
    the same root cause: this tool never actually looked at which
    module a candidate belonged to.
    """
    path = _module_delinks_path(region, module)
    if path is None or not path.is_file():
        return None
    text = path.read_text(encoding="utf-8", errors="replace")
    m = re.search(r"\.text[ \t]+start:0x([0-9a-fA-F]+)", text)
    return int(m.group(1), 16) if m else None


def _module_default_paths(region: str, module: str) -> tuple[Path, Path]:
    """(built_path, extract_path) defaults for a module.

    This is THE fix for brief 525's false-CONTAINED verdicts: the old
    code always defaulted to `build/<region>/build/arm9.bin` /
    `extract/<region>/arm9/arm9.bin` (main's binaries) regardless of
    which module the candidate actually belonged to. An overlay
    candidate's compiled bytes never land in the main ARM9 image at
    all (overlays are separate loadable binaries) — so a caller
    checking an overlay candidate who forgot to manually pass
    `--built`/`--extract` was silently diffing main's (untouched,
    always-clean) binaries and getting a rubber-stamp CONTAINED that
    said nothing about the actual overlay candidate. Verified against
    the real repo tree (brief 534): overlay baselines live at
    `extract/<region>/arm9_overlays/<module>.bin` (no `arm9_` prefix
    on the filename — the prefix is only on the *built* side,
    `build/<region>/build/arm9_<module>.bin`); itcm/dtcm keep the same
    bare name on both sides, alongside arm9.bin's own directory on the
    extract side.
    """
    if module == "main":
        built = ROOT / "build" / region / "build" / "arm9.bin"
        extract = ROOT / "extract" / region / "arm9" / "arm9.bin"
    elif module in ("itcm", "dtcm"):
        built = ROOT / "build" / region / "build" / f"{module}.bin"
        extract = ROOT / "extract" / region / "arm9" / f"{module}.bin"
    else:
        built = ROOT / "build" / region / "build" / f"arm9_{module}.bin"
        extract = ROOT / "extract" / region / "arm9_overlays" / f"{module}.bin"
    return built, extract


def _lookup_candidate_range(
    candidate: str, region: str,
) -> tuple[int, int, str | None] | None:
    """Resolve a candidate's [start, end) VA range (and owning module)
    from delinks.txt.

    Tries the given path as-is, then (if it looks like a .c file) its .s
    sibling and vice versa — delinks.txt may show either extension
    depending on whether the candidate has already been applied.
    """
    cand_path = Path(candidate)
    if not cand_path.is_absolute():
        cand_rel = str(cand_path).replace("\\", "/")
    else:
        cand_rel = str(cand_path.relative_to(ROOT)).replace("\\", "/")

    tries = [cand_rel]
    for suffix in (".c", ".s"):
        if cand_rel.endswith(suffix):
            other = (".s" if suffix == ".c" else ".c")
            tries.append(cand_rel[: -len(suffix)] + other)
            break

    for delinks_path in _iter_delinks_files(region):
        try:
            text = delinks_path.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        lines = text.splitlines()
        for i, line in enumerate(lines):
            m = _DELINKS_TU_HEADER_RE.match(line)
            if not m or m.group("path") not in tries:
                continue
            # Next non-blank line(s): find the `.text start:.. end:..` line
            # before the next TU header.
            for j in range(i + 1, len(lines)):
                if _DELINKS_TU_HEADER_RE.match(lines[j]):
                    break
                rm = _DELINKS_TEXT_RANGE_RE.match(lines[j])
                if rm:
                    module = _module_from_delinks_path(delinks_path, region)
                    return int(rm.group("start"), 16), int(rm.group("end"), 16), module
    return None


def _lookup_ranges_by_addr(
    addr: int, region: str, module: str | None = None,
) -> list[tuple[int, int, str, str | None]]:
    """Resolve the delinked [start, end) TU range(s) that CONTAIN a bare
    address, by scanning delinks.txt range(s) in the region.

    Unlike `_lookup_candidate_range` (which matches a TU by file *path*,
    so the caller must already know or guess the exact filename), this
    matches by address containment — for the common case where an agent
    has only an address (e.g. from a worklist row or a retriage doc
    header) and no reason to know whether delinks.txt currently shows the
    `.c` or `.s` extension for that TU, or its exact source subdirectory.

    Returns a list because, without a `module` hint, a bare address can
    genuinely be AMBIGUOUS: this game's overlay RAM windows are reused by
    overlays that never coexist in memory, so the same VA can fall inside
    several different overlays' own delinked ranges simultaneously (e.g.
    0x021aa558 lands inside NINE different overlays' TUs in EUR — verified
    against the real repo while building this). Callers MUST check
    `len(result)`: 0 = not found, 1 = unambiguous, >1 = ambiguous (caller
    should ask for `module` to disambiguate, not guess).
    """
    return [
        (start, end, path, owning_module)
        for start, end, path, owning_module in _build_range_index(region, module=module)
        if start <= addr < end
    ]


def _build_range_index(
    region: str, module: str | None = None,
) -> list[tuple[int, int, str, str | None]]:
    """All (start_va, end_va, source_path, module) TU ranges across
    delinks.txt in the region (optionally scoped to one `module`), for
    best-effort "owner of this VA" lookups on out-of-range diff runs.
    Built once per run."""
    index: list[tuple[int, int, str, str | None]] = []
    for delinks_path in _iter_delinks_files(region, module=module):
        owning_module = _module_from_delinks_path(delinks_path, region)
        try:
            text = delinks_path.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        lines = text.splitlines()
        pending_path: str | None = None
        for line in lines:
            m = _DELINKS_TU_HEADER_RE.match(line)
            if m:
                pending_path = m.group("path")
                continue
            rm = _DELINKS_TEXT_RANGE_RE.match(line)
            if rm and pending_path:
                index.append((
                    int(rm.group("start"), 16),
                    int(rm.group("end"), 16),
                    pending_path,
                    owning_module,
                ))
                pending_path = None
    return index


def _owner_of(va: int, range_index: list[tuple[int, int, str, str | None]]) -> str | None:
    for start, end, path, _module in range_index:
        if start <= va < end:
            return path
    return None


# ---------------------------------------------------------------------------
# Byte diff
# ---------------------------------------------------------------------------

def _size_mismatch(built: bytes, orig: bytes) -> int:
    """`len(built) - len(orig)`, as its own testable unit.

    Brief 534: this is the FULL-length check that must run independently
    of `_find_diff_runs`'s truncated byte walk — a candidate that grows or
    shrinks the linked artifact is an AVALANCHE regardless of whether the
    byte-level walk below (which only ever compares the common prefix)
    happens to find anything in range.
    """
    return len(built) - len(orig)


def _find_diff_runs(a: bytes, b: bytes, block_size: int = 4096) -> list[tuple[int, int]]:
    """Contiguous runs of differing bytes between a and b, over their
    common prefix (a[:n] vs b[:n], n = min(len(a), len(b))).

    Returns a list of (start_offset, end_offset_exclusive) tuples.

    Compares in `block_size` chunks first (bytes `==` is a fast C-level
    comparison) and only walks byte-by-byte inside blocks that actually
    differ — large files with few, localized diffs stay fast; only
    mismatched regions pay the per-byte cost.
    """
    n = min(len(a), len(b))
    runs: list[tuple[int, int]] = []
    run_start: int | None = None
    i = 0
    while i < n:
        end = min(i + block_size, n)
        if a[i:end] == b[i:end]:
            if run_start is not None:
                runs.append((run_start, i))
                run_start = None
            i = end
            continue
        for j in range(i, end):
            if a[j] != b[j]:
                if run_start is None:
                    run_start = j
            else:
                if run_start is not None:
                    runs.append((run_start, j))
                    run_start = None
        i = end
    if run_start is not None:
        runs.append((run_start, n))
    return runs


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Classify a candidate's built-vs-baseline ARM9 diff as "
            "CONTAINED (reshapeable) or AVALANCHE (park it). See brief 514 "
            "(docs/research/brief-514-forensics.md)."
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="Exit: 0=CONTAINED, 1=AVALANCHE, 2=infra error",
    )
    ap.add_argument("region", choices=list(_KNOWN_REGIONS))
    range_group = ap.add_mutually_exclusive_group(required=True)
    range_group.add_argument(
        "--range", nargs=2, metavar=("START", "END"),
        help="Candidate's delinked [start, end) VA range, e.g. --range 0x02001e5c 0x02001e84",
    )
    range_group.add_argument(
        "--candidate", metavar="PATH",
        help="Candidate .c or .s path; range is resolved from delinks.txt",
    )
    range_group.add_argument(
        "--addr", metavar="ADDR",
        help="Bare candidate address, e.g. --addr 0x02001e5c; range is "
             "auto-derived by scanning delinks.txt for the TU whose "
             "[start, end) contains this address — no filename needed",
    )
    ap.add_argument(
        "--module", metavar="MODULE", default=None,
        help="Scope/declare which module (\"main\", \"ov002\", "
             "\"overlay002\" all work) the candidate belongs to. Required "
             "to disambiguate a bare --addr when it falls inside more than "
             "one overlay's reused RAM window (the tool errors out and "
             "lists the candidates if you omit it and it's ambiguous). "
             "Also accepted with --range, where it skips auto-detection — "
             "useful if the range doesn't (yet) appear in any delinks.txt. "
             "Whichever way the module is known, it picks the default "
             "--built/--extract binaries and VA base (main's ARM9 image vs "
             "the right overlay's own binary) — see brief 534.",
    )
    ap.add_argument("--built", type=Path, default=None,
                     help="Override built binary path (default: auto-selected "
                          "from the candidate's module — main's arm9.bin, or "
                          "the owning overlay's own arm9_<ovNNN>.bin, etc.)")
    ap.add_argument("--extract", type=Path, default=None,
                     help="Override baseline binary path (default: auto-selected "
                          "the same way as --built)")
    ap.add_argument("--max-owner-lookups", type=int, default=5,
                     help="Cap on out-of-range runs to resolve an owner TU for (default 5)")
    ap.add_argument("--json", action="store_true", help="Machine-readable JSON output")
    args = ap.parse_args(argv)

    # --- Resolve the candidate range (and, critically, its MODULE — brief
    # 534: every default binary path and VA base below keys off this) ---
    if args.module is not None and _normalize_module(args.module) is None:
        print(
            f"ERROR: --module {args.module!r} not recognized. Use "
            f"\"main\", or an overlay like \"ov002\"/\"overlay002\"/\"2\".",
            file=sys.stderr,
        )
        return 2
    module = _normalize_module(args.module) if args.module else None

    if args.range:
        try:
            cand_start = int(args.range[0], 16)
            cand_end = int(args.range[1], 16)
        except ValueError:
            print(f"ERROR: --range values must be hex addresses, got {args.range}", file=sys.stderr)
            return 2
        if module is not None:
            range_source = f"explicit (--module {module})"
        else:
            # Auto-detect the module the same way --addr does, rather than
            # silently assuming "main" — an explicit range for an overlay
            # candidate used to fall through to main's binaries below.
            addr_hits = _lookup_ranges_by_addr(cand_start, args.region)
            if len(addr_hits) == 1:
                module = addr_hits[0][3]
                range_source = f"explicit (module auto-detected: {module or 'unknown'})"
            elif len(addr_hits) > 1:
                print(
                    f"ERROR: --range start 0x{cand_start:08x} is AMBIGUOUS — "
                    f"it falls inside {len(addr_hits)} different TUs' "
                    f"delinked ranges simultaneously (reused overlay RAM "
                    f"windows). Re-run with --module to pick one:",
                    file=sys.stderr,
                )
                for start, end, path, mod_guess in addr_hits:
                    print(
                        f"    --module {mod_guess or 'main':<10s} -> [0x{start:08x}, 0x{end:08x})  {path}",
                        file=sys.stderr,
                    )
                return 2
            else:
                print(
                    f"WARNING: could not auto-detect a module for --range "
                    f"0x{cand_start:08x}; this range isn't (yet) any TU's "
                    f"exact delinked span in delinks.txt. Defaulting to "
                    f"'main' binaries — pass --module explicitly if this "
                    f"range actually belongs to an overlay, or the built-"
                    f"vs-baseline comparison below will be checking the "
                    f"WRONG binary pair.",
                    file=sys.stderr,
                )
                module = "main"
                range_source = "explicit (module defaulted to main — unresolved)"
    elif args.candidate:
        resolved = _lookup_candidate_range(args.candidate, args.region)
        if resolved is None:
            print(
                f"ERROR: could not resolve a delinked range for candidate "
                f"'{args.candidate}' in region '{args.region}'.\n"
                f"  Checked config/{args.region}/arm9/**/delinks.txt for a "
                f"TU header matching this path (or its .c/.s sibling).",
                file=sys.stderr,
            )
            return 2
        cand_start, cand_end, module = resolved
        range_source = f"resolved from delinks.txt ({args.candidate})"
    else:
        try:
            addr = int(args.addr, 16)
        except ValueError:
            print(f"ERROR: --addr must be a hex address, got {args.addr!r}", file=sys.stderr)
            return 2
        addr_hits = _lookup_ranges_by_addr(addr, args.region, module=module)
        if not addr_hits:
            scope = f"module '{module}'" if module else f"region '{args.region}'"
            print(
                f"ERROR: address 0x{addr:08x} is not contained in any "
                f"delinks.txt TU range for {scope}.\n"
                f"  Checked config/{args.region}/arm9/"
                f"{'delinks.txt' if module == 'main' else '**/delinks.txt'}"
                f". This usually means the address is wrong, belongs to a "
                f"different region, or falls in a gap delinks.txt doesn't "
                f"cover (e.g. padding/alignment bytes between TUs) — use "
                f"--range to supply the span explicitly if you already "
                f"know it from another source (a dossier, a worklist "
                f"entry's own size field, etc).",
                file=sys.stderr,
            )
            return 2
        if len(addr_hits) > 1:
            print(
                f"ERROR: address 0x{addr:08x} is AMBIGUOUS — it falls "
                f"inside {len(addr_hits)} different TUs' delinked ranges "
                f"simultaneously (this game's overlay RAM windows are "
                f"reused by overlays that never coexist in memory, so "
                f"this is common, not a bug). Re-run with --module to "
                f"pick one:",
                file=sys.stderr,
            )
            for start, end, path, mod_guess in addr_hits:
                print(
                    f"    --module {mod_guess or 'main':<10s} -> [0x{start:08x}, 0x{end:08x})  {path}",
                    file=sys.stderr,
                )
            return 2
        cand_start, cand_end, owning_path, module = addr_hits[0]
        range_source = f"resolved from delinks.txt (addr 0x{addr:08x} -> {owning_path})"

    if cand_end <= cand_start:
        print(f"ERROR: candidate range end (0x{cand_end:x}) must be > start (0x{cand_start:x})", file=sys.stderr)
        return 2

    if module is None:
        print(
            "WARNING: could not determine which module this candidate "
            "belongs to; defaulting to 'main' binaries. If this is an "
            "overlay candidate, pass --module explicitly — otherwise the "
            "comparison below silently checks the WRONG (main) binary "
            "pair, which is exactly brief 525's false-CONTAINED bug.",
            file=sys.stderr,
        )
        module = "main"

    # --- Resolve binary paths (module-aware — brief 534) ---
    default_built, default_extract = _module_default_paths(args.region, module)
    built_path = args.built or default_built
    extract_path = args.extract or default_extract

    if not built_path.is_file():
        print(
            f"ERROR: built ARM9 binary not found: {built_path}\n"
            f"  Run `python tools/configure.py {args.region}` and `ninja rom` "
            f"(or at least the arm9 link chain) first.",
            file=sys.stderr,
        )
        return 2
    if not extract_path.is_file():
        print(
            f"ERROR: baseline ARM9 binary not found: {extract_path}\n"
            f"  Run `ninja extract/{args.region}/arm9/config.yaml` (or a "
            f"full `ninja`) first — `dsd rom extract` produces this once "
            f"per region.",
            file=sys.stderr,
        )
        return 2

    built = built_path.read_bytes()
    orig = extract_path.read_bytes()

    # --- Size check FIRST, on the FULL lengths (brief 534) ---
    # This is the headline fix: `_find_diff_runs` below only ever walks the
    # common prefix (min of the two lengths) for performance, so it is
    # incapable of noticing bytes that exist only in the longer file. Any
    # size mismatch is decided right here, off the untruncated `len()` of
    # both files, before that truncated walk even runs — so a truncation
    # bug in the byte-level walk can never again hide a size regression
    # from the verdict.
    size_delta = _size_mismatch(built, orig)
    runs = _find_diff_runs(built, orig)
    common_len = min(len(built), len(orig))
    unpaired_tail_bytes = max(len(built), len(orig)) - common_len

    total_diff_bytes = sum(end - start for start, end in runs)

    va_base = _module_va_base(args.region, module)
    if va_base is None:
        print(
            f"WARNING: could not read a VA base for module '{module}' from "
            f"its own delinks.txt; falling back to the main ARM9 base "
            f"(0x{ARM9_BASE_VA:08x}). Out-of-range diagnostics below may be "
            f"wrong for an overlay candidate — this should only happen "
            f"against a synthetic/incomplete config tree.",
            file=sys.stderr,
        )
        va_base = ARM9_BASE_VA

    out_of_range_runs = []
    for start, end in runs:
        va_start = va_base + start
        va_end = va_base + end
        if not (cand_start <= va_start and va_end <= cand_end):
            out_of_range_runs.append((va_start, va_end))

    verdict_avalanche = (size_delta != 0) or bool(out_of_range_runs)

    # --- Owner lookups for the first few out-of-range runs (diagnostic) ---
    owners: list[dict] = []
    if out_of_range_runs and args.max_owner_lookups > 0:
        range_index = _build_range_index(args.region)
        for va_start, va_end in out_of_range_runs[: args.max_owner_lookups]:
            owner = _owner_of(va_start, range_index)
            owners.append({
                "va_start": f"0x{va_start:08x}",
                "va_end": f"0x{va_end:08x}",
                "owner": owner or "(unknown — not covered by any delinks.txt TU)",
            })

    report = {
        "region": args.region,
        "module": module,
        "candidate_range": {
            "start": f"0x{cand_start:08x}",
            "end": f"0x{cand_end:08x}",
            "source": range_source,
        },
        "va_base": f"0x{va_base:08x}",
        "built_path": str(built_path.relative_to(ROOT)) if built_path.is_relative_to(ROOT) else str(built_path),
        "extract_path": str(extract_path.relative_to(ROOT)) if extract_path.is_relative_to(ROOT) else str(extract_path),
        "built_size": len(built),
        "extract_size": len(orig),
        "size_delta": size_delta,
        "unpaired_tail_bytes": unpaired_tail_bytes,
        "diff_run_count": len(runs),
        "diff_byte_count": total_diff_bytes,
        "out_of_range_run_count": len(out_of_range_runs),
        "first_out_of_range_runs": owners,
        "verdict": "AVALANCHE" if verdict_avalanche else "CONTAINED",
    }

    if args.json:
        print(json.dumps(report, indent=2))
    else:
        print(f"containment_check: {args.region}  module={module}  candidate=[0x{cand_start:08x}, 0x{cand_end:08x})  ({range_source})")
        print(f"  built:   {report['built_path']}  ({len(built)} bytes)")
        print(f"  extract: {report['extract_path']}  ({len(orig)} bytes)")
        if size_delta:
            print(f"  SIZE MISMATCH: {size_delta:+d} bytes (full-length compare, not truncated) — this alone forces AVALANCHE")
            print(f"    {unpaired_tail_bytes} byte(s) exist only in the longer file and were NOT walked below —")
            print(f"    a size mismatch means everything past the common prefix is structurally shifted,")
            print(f"    not meaningfully comparable byte-for-byte; the diff below covers only the common prefix.")
        print(f"  diff: {total_diff_bytes} byte(s) across {len(runs)} run(s) (over the {common_len}-byte common prefix)")
        if out_of_range_runs:
            print(f"  {len(out_of_range_runs)} run(s) OUTSIDE the candidate range:")
            for o in owners:
                print(f"    {o['va_start']}-{o['va_end']}  owner: {o['owner']}")
            if len(out_of_range_runs) > len(owners):
                print(f"    ... and {len(out_of_range_runs) - len(owners)} more (raise --max-owner-lookups to see more)")
        print()
        print(report["verdict"])

    return 1 if verdict_avalanche else 0


if __name__ == "__main__":
    sys.exit(main())
