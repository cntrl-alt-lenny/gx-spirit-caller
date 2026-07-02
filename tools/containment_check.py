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

This tool automates brief 514's manual recipe: diff `build/<region>/build/
arm9.bin` (freshly built, uncompressed) against `extract/<region>/arm9/
arm9.bin` (the original, uncompressed baseline), map every differing byte
run to a virtual address via `VA = 0x02000000 + offset` (the ARM9 load
address baked into this game's linker script — see brief 514), and check
whether every run's VA range is fully contained in the candidate's own
delinked range.

Prerequisites:
  - `python tools/configure.py <region>` has been run
  - The candidate is currently applied (its delinks.txt entry is the `.c`
    under test) and `ninja rom` (or at least the arm9-link chain) has been
    rebuilt, so `build/<region>/build/arm9.bin` reflects the candidate
  - `extract/<region>/arm9/arm9.bin` exists (produced by `dsd rom extract`,
    which `ninja` runs once per region as part of the normal build graph)

Usage:
    # Explicit range (already known, e.g. from delinks.txt or a dossier):
    python tools/containment_check.py eur --range 0x02001e5c 0x02001e84

    # Auto-resolve the range from delinks.txt by candidate path (.c or .s,
    # whichever extension delinks.txt currently shows for this TU):
    python tools/containment_check.py eur --candidate src/main/func_02001e5c.c

Options:
    --json          Machine-readable JSON output
    --built PATH    Override the built ARM9 binary path (default:
                     build/<region>/build/arm9.bin)
    --extract PATH  Override the baseline ARM9 binary path (default:
                     extract/<region>/arm9/arm9.bin)
    --max-owner-lookups N   How many out-of-range runs to resolve an
                     "owner" TU for (default 5; owner lookup scans all
                     delinks.txt files, so it's capped to stay cheap on a
                     massive avalanche with 100k+ runs)

Exit codes:
    0   CONTAINED — every differing byte run is inside the candidate range
    1   AVALANCHE — a run spilled outside the range, or the ARM9 image
        changed size
    2   Infrastructure error (region unknown, files missing, bad range,
        candidate not found in any delinks.txt, etc.)

Validation for the brain (build-free from this session — no `build/` or
`extract/` directories exist in this worktree, so none of this has actually
been run; the logic below WAS validated build-free wherever real on-disk
data made that possible — see "What's already verified"):

Brief 514's own dataset (docs/research/brief-514-forensics.md) gives one
clean CONTAINED case and one clean AVALANCHE case to sanity-check this tool
against, once a region is configured and built:

    python tools/configure.py eur
    ninja rom          # or at minimum the arm9 link chain; produces
                        # build/eur/build/arm9.bin

    # CONTAINED case: 0200a454 — brief 514 measured a 5-byte ARM9 diff,
    # entirely inside [0x0200a454, 0x0200a488). Apply that candidate's .c
    # (or reuse whatever the brief 512/514 worktree already had applied),
    # then:
    python tools/containment_check.py eur --range 0x0200a454 0x0200a488
    # Expected: verdict CONTAINED, exit 0, diff_byte_count small (~5),
    # out_of_range_run_count 0.

    # AVALANCHE case: 02001e5c — brief 514 measured a 604,225-byte ARM9
    # diff starting at offset 0x8f8 (owner src/main/Entry.c), far outside
    # the candidate's own [0x02001e5c, 0x02001e84) range:
    python tools/containment_check.py eur --range 0x02001e5c 0x02001e84
    # Expected: verdict AVALANCHE, exit 1, out_of_range_run_count > 0,
    # first_out_of_range_runs[0].owner == "src/main/Entry.c" (this repo's
    # delinks.txt already names Entry.c at that exact VA — confirmed
    # build-free by _owner_of(0x020008f8, ...) during this tool's
    # development, see below).

    # Also worth one AVALANCHE + SIZE GROWTH case (a third failure shape
    # brief 514 documents): 02006524, 0200c23c, or 0200fbd4 all grew the
    # linked ARM9 image by 0x20 bytes on brief 514's retry:
    python tools/containment_check.py eur --range 0x02006524 0x020065a8
    # Expected: verdict AVALANCHE, exit 1, size_delta == 32 (if the
    # worktree's current C draft still reproduces brief 514's retry
    # exactly — the size delta is what forces the verdict regardless of
    # where the byte runs land, per this tool's design).

What's already verified (build-free, this session, against the REAL repo —
not synthetic data):
  - `_lookup_candidate_range('src/main/func_02001e5c.c', 'eur')` returns
    exactly `(0x02001e5c, 0x02001e84)` — matches brief 514's documented
    range for this candidate verbatim. Also verified the `.c`/`.s`
    extension-fallback resolves the identical range.
  - `_owner_of(0x020008f8, _build_range_index('eur'))` returns exactly
    `'src/main/Entry.c'` — matches brief 514's documented "owner
    src/main/Entry.c" finding for this exact VA verbatim.
  - `_find_diff_runs` unit-tested against synthetic byte buffers: no-diff,
    single run, a run deliberately straddling a block boundary (validates
    the chunked-comparison fast path doesn't create false boundaries), and
    multiple disjoint runs — all exact-matched expected output.
  - Full CLI exercised end-to-end (via `--built`/`--extract` overrides
    pointed at synthetic files standing in for a built/baseline ARM9
    image) against all three brief-514 failure shapes — contained,
    avalanche-by-spill, avalanche-by-size-growth — each produced the
    correct verdict and exit code. Also verified `--json` output shape,
    `--candidate` auto-resolve (chained through the real delinks.txt
    lookup above), and error handling for a missing built/extract file, an
    unresolvable candidate, and an inverted range.
  - What COULDN'T be verified build-free: the actual `build/<region>/
    build/arm9.bin` vs `extract/<region>/arm9/arm9.bin` diff on a real
    built candidate — that's exactly what the three commands above are
    for.
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

def _iter_delinks_files(region: str):
    config_arm9 = ROOT / "config" / region / "arm9"
    if not config_arm9.is_dir():
        return
    yield from sorted(config_arm9.rglob("delinks.txt"))


def _lookup_candidate_range(candidate: str, region: str) -> tuple[int, int] | None:
    """Resolve a candidate's [start, end) VA range from delinks.txt.

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
                    return int(rm.group("start"), 16), int(rm.group("end"), 16)
    return None


def _build_range_index(region: str) -> list[tuple[int, int, str]]:
    """All (start_va, end_va, source_path) TU ranges across every
    delinks.txt in the region, for best-effort "owner of this VA" lookups
    on out-of-range diff runs. Built once per run."""
    index: list[tuple[int, int, str]] = []
    for delinks_path in _iter_delinks_files(region):
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
                ))
                pending_path = None
    return index


def _owner_of(va: int, range_index: list[tuple[int, int, str]]) -> str | None:
    for start, end, path in range_index:
        if start <= va < end:
            return path
    return None


# ---------------------------------------------------------------------------
# Byte diff
# ---------------------------------------------------------------------------

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
    ap.add_argument("--built", type=Path, default=None,
                     help="Override built ARM9 binary path")
    ap.add_argument("--extract", type=Path, default=None,
                     help="Override baseline ARM9 binary path")
    ap.add_argument("--max-owner-lookups", type=int, default=5,
                     help="Cap on out-of-range runs to resolve an owner TU for (default 5)")
    ap.add_argument("--json", action="store_true", help="Machine-readable JSON output")
    args = ap.parse_args(argv)

    # --- Resolve the candidate range ---
    if args.range:
        try:
            cand_start = int(args.range[0], 16)
            cand_end = int(args.range[1], 16)
        except ValueError:
            print(f"ERROR: --range values must be hex addresses, got {args.range}", file=sys.stderr)
            return 2
        range_source = "explicit"
    else:
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
        cand_start, cand_end = resolved
        range_source = f"resolved from delinks.txt ({args.candidate})"

    if cand_end <= cand_start:
        print(f"ERROR: candidate range end (0x{cand_end:x}) must be > start (0x{cand_start:x})", file=sys.stderr)
        return 2

    # --- Resolve binary paths ---
    built_path = args.built or (ROOT / "build" / args.region / "build" / "arm9.bin")
    extract_path = args.extract or (ROOT / "extract" / args.region / "arm9" / "arm9.bin")

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

    size_delta = len(built) - len(orig)
    runs = _find_diff_runs(built, orig)

    total_diff_bytes = sum(end - start for start, end in runs)

    out_of_range_runs = []
    for start, end in runs:
        va_start = ARM9_BASE_VA + start
        va_end = ARM9_BASE_VA + end
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
        "candidate_range": {
            "start": f"0x{cand_start:08x}",
            "end": f"0x{cand_end:08x}",
            "source": range_source,
        },
        "built_path": str(built_path.relative_to(ROOT)) if built_path.is_relative_to(ROOT) else str(built_path),
        "extract_path": str(extract_path.relative_to(ROOT)) if extract_path.is_relative_to(ROOT) else str(extract_path),
        "built_size": len(built),
        "extract_size": len(orig),
        "size_delta": size_delta,
        "diff_run_count": len(runs),
        "diff_byte_count": total_diff_bytes,
        "out_of_range_run_count": len(out_of_range_runs),
        "first_out_of_range_runs": owners,
        "verdict": "AVALANCHE" if verdict_avalanche else "CONTAINED",
    }

    if args.json:
        print(json.dumps(report, indent=2))
    else:
        print(f"containment_check: {args.region}  candidate=[0x{cand_start:08x}, 0x{cand_end:08x})  ({range_source})")
        print(f"  built:   {report['built_path']}  ({len(built)} bytes)")
        print(f"  extract: {report['extract_path']}  ({len(orig)} bytes)")
        if size_delta:
            print(f"  SIZE DELTA: {size_delta:+d} bytes — linked layout changed, this alone forces AVALANCHE")
        print(f"  diff: {total_diff_bytes} byte(s) across {len(runs)} run(s)")
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
