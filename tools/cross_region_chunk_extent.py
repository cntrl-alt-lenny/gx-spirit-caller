#!/usr/bin/env python3

"""
cross_region_chunk_extent.py — multi-symbol chunk-extent adjuster
for Pattern 3 / D-3 / cluster-C cross-region apply (brief 177).

Generalises brief 174's single-symbol bundle-extent heuristic to
arbitrary `[start, end)` chunk ranges. Brief 175 (PR #614)
showed that mechanically mapping EUR Pattern 3 chunks to USA/JPN
via per-overlay base shifts FAILS because the regions' gap-file
boundaries differ — chunks slice through inner gap-file symbols
whose gap-inferred extents reach past the chunk start.

Brief 174 → Brief 177 generalisation
------------------------------------

Brief 174 (`tools/cluster_b_bundle_gen.py`) computes a bundle
extent for a SINGLE anchor symbol. The heuristic walks forward
through named symbols and picks the first 4-aligned named vaddr
such that the bundle contains ≥ 1 non-zero byte.

Brief 177 extends this to MULTI-symbol chunks. Given a target
`[target_start, target_end)`:

1. **Phase A — adjust start LEFT** to the nearest named-symbol
   vaddr ≤ `target_start`. This absorbs any predecessor whose
   gap-inferred extent reaches into the chunk. The gap-file
   before the chunk now ends at a clean named-symbol boundary.

2. **Phase B — adjust end RIGHT** iteratively:
   a. Find every named symbol inside `[start, end)`.
   b. For each, compute its gap-inferred extent (= next-named
      vaddr).
   c. If any extent exceeds the current end, extend end to
      cover it. Repeat until stable.
   d. Round end UP to the nearest 4-aligned named-symbol vaddr
      (or section end).

3. **Phase C — validate**:
   a. Start + end are 4-aligned.
   b. Start is at a named-symbol vaddr or section start.
   c. End is at a named-symbol vaddr or section end.
   d. All inner named symbols' extents are ≤ end.
   e. For `.data` chunks: ≥ 1 non-zero byte (avoid mwcc → `.bss`
      routing; `.rodata` chunks are exempt).

When all 3 phases succeed, the adjusted `(start, end)` can be
fed directly to `cluster_c_pattern3_gen.py` (or a hand-written
chunk emitter) and dsd's section-membership check passes.

Worked example — brief 175's failing USA `ov006` chunk
------------------------------------------------------

  target: [0x021cca88, 0x021ccd08)
  Phase A: lower start to 0x021cca68 (absorbs data_ov006_021cca68
           whose extent reaches 0x021ccce8, past target_start)
  Phase B: data_ov006_021cca68 extent = 0x021ccce8 (fits)
           data_ov006_021ccce8 extent = 0x021ccf68 (does NOT fit
           → extend end to 0x021ccf68)
  Phase C: validate — start 4-aligned ✓, end 4-aligned ✓
  result: [0x021cca68, 0x021ccf68), 0x500 bytes (1280)

Out-of-scope (carries forward from brief 174)
---------------------------------------------

- **Bundle-alias emission** (`.global <subsumed>` labels at
  non-4-aligned offsets): the existing brief 161
  `tools/cluster_b_bundle.py` library handles `.s` rendering
  for size-1/2 subsumed symbols. This tool computes extents
  only; the caller drives the actual emitter
  (`cluster_c_pattern3_gen.py` for Pattern 3, hand-written .s
  for bundle-with-aliases).

- **Pattern 3 chunk emission** itself: the existing
  `cluster_c_pattern3_gen.py` (brief 125) emits the .s file
  given a 4-aligned `(start, end)`. This tool produces the
  adjusted extent; the caller pipes it through the generator.

Tool surface
------------

  # Adjust an EUR-to-USA chunk extent + print result:
  python tools/cross_region_chunk_extent.py \\
      --region usa --module ov006 \\
      --start 0x021cca88 --end 0x021ccd08

  # JSON for tool chaining:
  python tools/cross_region_chunk_extent.py \\
      --region jpn --module main \\
      --start 0x020b4720 --end 0x020b4740 --json

  # Strict mode — exit non-zero if extent couldn't be adjusted
  # cleanly (default just prints "needs hand-tuning" report):
  python tools/cross_region_chunk_extent.py \\
      --region usa --module ov006 \\
      --start 0x021cca88 --end 0x021ccd08 --strict

Brief 177 deliverable. Brief 178+ (decomper) re-runs cross-region
D-3 apply with this tool.
"""

from __future__ import annotations

import argparse
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import Symbol, parse_symbols_file  # noqa: E402
from cross_region_cluster_apply import (  # noqa: E402
    RegionPaths,
    parse_delinks,
)


WORD_SIZE = 4


# --------------------------------------------------------------------------- #
# Core: extent adjuster
# --------------------------------------------------------------------------- #


@dataclass(frozen=True)
class AdjustedExtent:
    """The output of `adjust_chunk_extent`. Reports the cleaned
    `(start, end)` plus diagnostic data."""

    start: int                          # adjusted, 4-aligned
    end: int                            # adjusted, 4-aligned
    section: str                        # e.g. '.data', '.rodata'
    target_start: int                   # caller's input
    target_end: int                     # caller's input
    inner_symbols: tuple[tuple[str, int], ...]
        # (name, vaddr) pairs for ALL named symbols inside
        # [start, end). Useful for the chunk emitter so it
        # knows which `.global` labels to emit.
    was_adjusted: bool                  # True if start or end changed

    @property
    def size_bytes(self) -> int:
        return self.end - self.start

    @property
    def start_delta(self) -> int:
        """How many bytes the start was lowered (always ≥ 0)."""
        return self.target_start - self.start

    @property
    def end_delta(self) -> int:
        """How many bytes the end was raised (always ≥ 0)."""
        return self.end - self.target_end


class ChunkExtentError(Exception):
    """Raised when no valid extent exists for the target range
    (e.g. start adjustment lands on non-4-aligned VA, all-zero
    `.data` chunk after adjustment, end exceeds section
    bounds)."""


def adjust_chunk_extent(
    target_start: int,
    target_end: int,
    symbols: list[Symbol],
    sections: dict[str, tuple[int, int]],
    binary: bytes,
    binary_base_vaddr: int,
    *,
    section_name: str | None = None,
    require_nonzero: bool | None = None,
    max_iters: int = 64,
) -> AdjustedExtent:
    """The brief 177 algorithm. See module docstring for the
    3-phase walkthrough.

    Inputs
    ------

    - `target_start`, `target_end`: the caller's desired range.
      `target_end` is exclusive.
    - `symbols`: parsed symbols.txt entries (full module).
    - `sections`: parsed delinks.txt section map. The chunk's
      section is auto-detected from `target_start` unless
      `section_name` is supplied.
    - `binary`: the region's extracted module binary.
    - `binary_base_vaddr`: VA of `binary[0]`.
    - `section_name`: optional explicit section (e.g. '.data').
    - `require_nonzero`: if None (default), True for `.data` and
      False for `.rodata`. The non-zero requirement avoids mwcc
      routing all-zero `.data` arrays to `.bss`; `.rodata`
      doesn't have that routing.
    - `max_iters`: safety cap on the Phase B iteration. Each
      iteration must enlarge end; if more than `max_iters`
      iterations occur the algorithm raises (something pathological
      in the symbol layout).

    Returns: `AdjustedExtent`.
    Raises: `ChunkExtentError` if no valid adjusted extent exists.
    """
    if target_end <= target_start:
        raise ChunkExtentError(
            f"target_end (0x{target_end:08x}) must be > "
            f"target_start (0x{target_start:08x})"
        )

    syms = sorted(symbols, key=lambda s: s.addr)

    # Detect section.
    if section_name is None:
        for name, (lo, hi) in sections.items():
            if lo <= target_start < hi:
                section_name = name
                break
        else:
            raise ChunkExtentError(
                f"target_start 0x{target_start:08x} not inside "
                f"any section in {sorted(sections.keys())}"
            )
    sec_lo, sec_hi = sections[section_name]
    if target_end > sec_hi:
        raise ChunkExtentError(
            f"target_end 0x{target_end:08x} exceeds section "
            f"{section_name} end 0x{sec_hi:08x}"
        )

    if require_nonzero is None:
        require_nonzero = (section_name == ".data")

    # ----- Phase A: adjust start LEFT to nearest named-symbol vaddr
    # (or section start). Absorbs any predecessor whose extent
    # reaches into the chunk.
    start = target_start
    # Find the immediately-preceding named symbol IN THIS SECTION.
    prev_in_sec = [s for s in syms if sec_lo <= s.addr < start]
    if prev_in_sec:
        latest = max(prev_in_sec, key=lambda s: s.addr)
        # Its extent = next-named-after-latest (anywhere in module).
        next_after = next(
            (s for s in syms if s.addr > latest.addr), None,
        )
        next_after_addr = next_after.addr if next_after else sec_hi
        if next_after_addr > start:
            # Conflict: latest's extent reaches into the chunk.
            # Lower start to latest.addr.
            if latest.addr % WORD_SIZE != 0:
                raise ChunkExtentError(
                    f"start-adjust would land at non-4-aligned "
                    f"0x{latest.addr:08x} ({latest.name}). "
                    f"Predecessor's extent reaches past target "
                    f"but lowering to its vaddr violates the "
                    f"4-aligned constraint. Manual handling "
                    f"needed."
                )
            start = latest.addr
    # If start is the section start, no predecessor to worry about
    # (gap-file before chunk is empty).
    if start % WORD_SIZE != 0:
        raise ChunkExtentError(
            f"adjusted start 0x{start:08x} not 4-aligned"
        )

    # ----- Phase B: extend end RIGHT to absorb all inner symbols'
    # extents + land on a 4-aligned named-symbol (or section-end)
    # boundary.
    end = max(target_end, start + WORD_SIZE)

    # Build candidate ends: every named-symbol vaddr > start + the
    # section end. End must equal one of these AND be 4-aligned.
    candidate_ends = sorted({
        s.addr for s in syms if start < s.addr <= sec_hi
    } | {sec_hi})

    for _iter in range(max_iters):
        # Inner = symbols strictly inside [start, end) (we don't
        # include a symbol AT end — it belongs to the next gap-file).
        inner = [s for s in syms if start <= s.addr < end]
        max_required_end = end
        for s in inner:
            after = next(
                (x for x in syms if x.addr > s.addr), None,
            )
            ext_end = after.addr if after is not None else sec_hi
            if ext_end > max_required_end:
                max_required_end = ext_end
        if max_required_end <= end:
            break
        # Need to extend end. Pick smallest valid candidate
        # >= max_required_end that's 4-aligned.
        new_end = None
        for ce in candidate_ends:
            if ce >= max_required_end and ce % WORD_SIZE == 0:
                new_end = ce
                break
        if new_end is None:
            raise ChunkExtentError(
                f"no valid 4-aligned end >= "
                f"0x{max_required_end:08x} in section "
                f"{section_name}"
            )
        if new_end == end:
            break
        end = new_end
    else:
        raise ChunkExtentError(
            f"Phase B iteration cap ({max_iters}) exhausted — "
            f"symbol layout may have pathological gap chain"
        )

    # If end isn't already a valid candidate (named vaddr or
    # section end) AND 4-aligned, raise it to the nearest one.
    if end != sec_hi and end not in candidate_ends:
        new_end = None
        for ce in candidate_ends:
            if ce >= end and ce % WORD_SIZE == 0:
                new_end = ce
                break
        if new_end is None:
            raise ChunkExtentError(
                f"no 4-aligned named-symbol or section-end "
                f"boundary >= 0x{end:08x} in section "
                f"{section_name}"
            )
        end = new_end
    if end % WORD_SIZE != 0:
        raise ChunkExtentError(
            f"end 0x{end:08x} not 4-aligned"
        )

    # ----- Phase C: validate
    # Re-check all inner symbols' extents fit.
    inner = [s for s in syms if start <= s.addr < end]
    for s in inner:
        after = next(
            (x for x in syms if x.addr > s.addr), None,
        )
        ext_end = after.addr if after is not None else sec_hi
        if ext_end > end:
            raise ChunkExtentError(
                f"inner symbol {s.name}@0x{s.addr:08x} extent "
                f"0x{ext_end:08x} exceeds adjusted end "
                f"0x{end:08x} (Phase B failed to converge)"
            )

    # Non-zero check (`.data` only by default).
    if require_nonzero:
        fo = start - binary_base_vaddr
        if fo < 0 or fo + (end - start) > len(binary):
            raise ChunkExtentError(
                f"chunk [{start:#x}, {end:#x}) extends past "
                f"binary bounds (fo={fo}, size={end - start}, "
                f"binary={len(binary)})"
            )
        chunk = bytes(binary[fo:fo + (end - start)])
        if not any(b != 0 for b in chunk):
            raise ChunkExtentError(
                f"chunk [{start:#x}, {end:#x}) all-zero in "
                f"{section_name} — would route to .bss"
            )

    was_adjusted = (start != target_start) or (end != target_end)
    return AdjustedExtent(
        start=start,
        end=end,
        section=section_name,
        target_start=target_start,
        target_end=target_end,
        inner_symbols=tuple((s.name, s.addr) for s in inner),
        was_adjusted=was_adjusted,
    )


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #


def _parse_address(s: str) -> int:
    s = s.strip()
    return int(s, 16 if s.lower().startswith("0x") else 0)


def cmd_adjust(args: argparse.Namespace) -> int:
    paths = RegionPaths.make(args.region, args.module)
    for p in (paths.symbols_txt, paths.delinks_txt, paths.binary_bin):
        if not p.is_file():
            print(f"error: required file missing: {p}", file=sys.stderr)
            return 1

    module_id = (
        "main" if paths.overlay_num is None
        else f"ov{paths.overlay_num:03d}"
    )
    symbols = parse_symbols_file(paths.symbols_txt, module_id)
    delinks = parse_delinks(paths.delinks_txt)
    binary = paths.binary_bin.read_bytes()
    if not delinks.sections:
        print(f"error: no section map in {paths.delinks_txt}", file=sys.stderr)
        return 1
    binary_base = min(s for s, _ in delinks.sections.values())

    try:
        adj = adjust_chunk_extent(
            args.start, args.end, symbols, delinks.sections,
            binary, binary_base,
            section_name=args.section,
            require_nonzero=args.require_nonzero,
        )
    except ChunkExtentError as e:
        if args.json:
            import json
            print(json.dumps({
                "status": "needs_hand_tuning",
                "error": str(e),
                "target_start": f"0x{args.start:08x}",
                "target_end": f"0x{args.end:08x}",
            }, indent=2))
        else:
            print(
                f"needs_hand_tuning: {e}",
                file=sys.stderr,
            )
        return 1 if args.strict else 0

    if args.json:
        import json
        print(json.dumps({
            "status": "ok",
            "start": f"0x{adj.start:08x}",
            "end": f"0x{adj.end:08x}",
            "section": adj.section,
            "target_start": f"0x{adj.target_start:08x}",
            "target_end": f"0x{adj.target_end:08x}",
            "size_bytes": adj.size_bytes,
            "start_delta": adj.start_delta,
            "end_delta": adj.end_delta,
            "was_adjusted": adj.was_adjusted,
            "inner_symbols": [
                {"name": n, "vaddr": f"0x{a:08x}"}
                for n, a in adj.inner_symbols
            ],
        }, indent=2))
    else:
        marker = " (adjusted)" if adj.was_adjusted else ""
        print(
            f"{args.region}/{args.module}{marker}: "
            f"[0x{adj.start:08x}, 0x{adj.end:08x}) "
            f"size={adj.size_bytes} section={adj.section}",
            file=sys.stderr,
        )
        if adj.was_adjusted:
            print(
                f"  start lowered by {adj.start_delta} bytes "
                f"(target 0x{adj.target_start:08x})",
                file=sys.stderr,
            )
            print(
                f"  end raised by {adj.end_delta} bytes "
                f"(target 0x{adj.target_end:08x})",
                file=sys.stderr,
            )
        print(
            f"  inner symbols ({len(adj.inner_symbols)}): "
            f"{[n for n, _ in adj.inner_symbols]}",
            file=sys.stderr,
        )
        # Print the adjusted extent on stdout (parseable).
        print(
            f"start=0x{adj.start:08x} end=0x{adj.end:08x} "
            f"section={adj.section}"
        )
    return 0


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog="cross_region_chunk_extent.py",
        description=(
            "Adjust a multi-symbol chunk's [start, end) to "
            "satisfy dsd's section-membership constraints + "
            "mwldarm's 4-byte alignment (brief 177)."
        ),
    )
    p.add_argument(
        "--region", required=True, choices=("eur", "usa", "jpn"),
    )
    p.add_argument(
        "--module", required=True,
        help="'main' or 'ovNNN' (e.g. 'ov006').",
    )
    p.add_argument(
        "--start", required=True, type=_parse_address,
        help="Target chunk start VA (will be lowered if a "
             "predecessor's extent reaches in).",
    )
    p.add_argument(
        "--end", required=True, type=_parse_address,
        help="Target chunk end VA (exclusive; will be raised "
             "if any inner symbol's extent exceeds).",
    )
    p.add_argument(
        "--section", default=None,
        help="Optional explicit section name (e.g. '.data', "
             "'.rodata'). Auto-detected from start otherwise.",
    )
    p.add_argument(
        "--require-nonzero", default=None,
        type=lambda v: None if v == "auto" else (
            v.lower() in ("true", "yes", "1")
        ),
        help="Force the ≥1 non-zero byte check. 'auto' (default) "
             "applies it to `.data` chunks only.",
    )
    p.add_argument(
        "--json", action="store_true",
        help="Emit a JSON report on stdout. Useful for tool "
             "chaining (e.g. piping into "
             "`cluster_c_pattern3_gen.py`).",
    )
    p.add_argument(
        "--strict", action="store_true",
        help="Exit non-zero if the target extent couldn't be "
             "cleanly adjusted (default exits 0 with a "
             "'needs_hand_tuning' report).",
    )
    p.set_defaults(func=cmd_adjust)
    return p


def main(argv: list[str] | None = None) -> int:
    p = build_parser()
    args = p.parse_args(argv)
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
