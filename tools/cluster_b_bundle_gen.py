#!/usr/bin/env python3

"""
cluster_b_bundle_gen.py — automated bundle-extent selector +
`unsigned int[N]` source emitter for cluster B residue (brief
174).

Brief 172 (PR #611) attempted to mechanically apply brief
152/155's `unsigned int[N]` bundle recipe to USA + JPN cluster B
residue and FAILED in 4 different ways. Root cause per the
brief 172 research note (`docs/research/cluster-b-cross-region-bundle.md`):

> Brief 152/155 bundle extents were **hand-tuned** per
> candidate. Mechanical apply has no such context — it picks an
> extent algorithmically and hits dsd `section-membership`
> rejection / bss-routing / over-absorption.

Brief 174 audited the worked-example bundles (brief 152's
`data_021020b4`, brief 155's `data_020c6a9c` / `data_020ff908` /
`data_020ff920` / etc.) and identified the heuristic that DOES
work:

**Heuristic** (see Part 1 docstring on `compute_bundle_extent`)

For each named symbol AFTER the candidate, walking forward:

1. Skip symbols whose `vaddr % 4 != 0` (the bundle's end must
   be 4-aligned per mwldarm's `.data` `ALIGNALL(2)` cascade,
   and the bundle MUST terminate at the start of a named
   symbol so dsd's section-membership check passes).
2. Compute the candidate bundle: `[candidate.vaddr,
   next_vaddr)`.
3. Read those bytes from the region's extracted module
   binary.
4. If the bundle contains **at least one non-zero byte**, this
   is the bundle — return.
5. Otherwise advance to the next 4-aligned named symbol and
   retry.

The non-zero requirement avoids mwldarm's `.bss` routing (mwcc
emits all-zero `.data` arrays to `.bss` regardless of source-side
intent — the alignment cascade then breaks downstream symbol
placement, exactly what brief 155 + 172 ran into).

Verified against 4 worked-example bundles from brief 152 + 155:

| Candidate | EUR bundle size | Inner subsumed symbols |
|---|---:|---|
| `data_021020b4` (brief 152) | 64 B (16 words) | `data_021020b5` (odd-aligned size-1) |
| `data_020c6a9c` (brief 155) | 24 B (6 words) | `data_020c6aa0` (string `"card/CARD_5bg26.bin\\0"`) |
| `data_020ff908` (brief 155) | 12 B (3 words) | `data_020ff90c` (4-byte string `"GPCM"`) |
| `data_020ff920` (brief 155) | 64 B (16 words) | `data_020ff924`, `data_020ff928` (long string) |

The heuristic reproduces all 4 byte-for-byte (see
`tests/test_cluster_b_bundle_gen.py`).

Tool surface
------------

  # Compute + emit a bundle for the EUR candidate at va 0x021020b4.
  # Writes src/<region>/<module>/data/<name>.c + appends to delinks.txt.
  python tools/cluster_b_bundle_gen.py \\
      --region eur --module main --address 0x021020b4

  # Dry-run preview (no file writes).
  python tools/cluster_b_bundle_gen.py \\
      --region usa --module main --address 0x021011d8 --dry-run

  # JSON output for tool chaining.
  python tools/cluster_b_bundle_gen.py \\
      --region jpn --module main --address 0x021011d8 --json

Out-of-scope
------------

- **Size-1/2 subsumed inner symbols at non-4-aligned offsets**
  (brief 153 `.s`-bundle path): the existing
  `tools/cluster_b_bundle.py` library handles `.s` rendering;
  this tool emits ONLY `.c` `unsigned int[N]` bundles where every
  subsumed symbol lands on a 4-byte boundary (allowing them to
  be exported as bundle aliases at word offsets, if needed
  later). For size-1/2 cases use `cluster_b_bundle.py`
  directly + this tool's extent for the bundle bounds.
- **Bundle-alias emission** (`.global <subsumed>` labels): brief
  152's worked example didn't expose subsumed placeholders as
  globals — `patch_module_literals.py` resolves the residual
  `kind:load` relocs post-link. This tool follows that pattern
  (no alias emission). Brief 158's alias-bundle case is handled
  by `cluster_b_bundle.py`'s `render_bundle_s`.

Brief 174 deliverable. Brief 176+ (decomper) re-runs cross-region
cluster B residue with this tool.
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# Reuse the symbol parser from analyze_symbols.py to keep the
# schema canonical with the rest of the tooling.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import Symbol, parse_symbols_file  # noqa: E402

# Reuse cross_region_cluster_apply.py's region/module path
# resolution so this tool sees the same per-region paths.
from cross_region_cluster_apply import (  # noqa: E402
    RegionPaths,
    parse_delinks,
)


WORD_SIZE = 4


# --------------------------------------------------------------------------- #
# Bundle-extent heuristic — the core deliverable
# --------------------------------------------------------------------------- #


@dataclass(frozen=True)
class Bundle:
    """The output of `compute_bundle_extent`. All fields derived
    from the region's `symbols.txt` + `delinks.txt` + extracted
    binary; the caller emits the TU source from these."""

    anchor_name: str            # the candidate symbol's name
    anchor_vaddr: int           # the candidate's vaddr (== bundle start)
    end_vaddr: int              # exclusive — the next-named symbol's vaddr
    section: str                # e.g. ".data" — the containing section
    bytes_le: bytes             # raw chunk bytes (LE) from anchor → end
    inner_symbols: tuple[tuple[str, int], ...]
        # subsumed-placeholder names + offsets-within-bundle for
        # ALL named symbols strictly inside (anchor_vaddr,
        # end_vaddr). Each entry: (name, offset_bytes).

    @property
    def size_bytes(self) -> int:
        return self.end_vaddr - self.anchor_vaddr

    @property
    def words(self) -> tuple[int, ...]:
        """Return the bundle's bytes as a tuple of 32-bit
        little-endian unsigned ints (one per 4-byte slot)."""
        assert self.size_bytes % WORD_SIZE == 0, (
            f"bundle size {self.size_bytes} not a multiple of {WORD_SIZE}"
        )
        return tuple(
            int.from_bytes(
                self.bytes_le[i:i + WORD_SIZE], "little",
            )
            for i in range(0, self.size_bytes, WORD_SIZE)
        )


class BundleExtentError(Exception):
    """Raised when no valid bundle extent exists for the
    candidate (e.g. section reached without a non-zero byte;
    candidate not 4-aligned; candidate not in a `.data`
    section)."""


def compute_bundle_extent(
    candidate_vaddr: int,
    symbols: list[Symbol],
    sections: dict[str, tuple[int, int]],
    binary: bytes,
    binary_base_vaddr: int,
    *,
    max_bundle_bytes: int = 1024,
) -> Bundle:
    """**The brief 174 heuristic.** Walk forward through named
    symbols from `candidate_vaddr`; return the bundle terminating
    at the FIRST 4-aligned named symbol such that the bundle
    contains at least one non-zero byte.

    Inputs
    ------

    - `candidate_vaddr`: VA of the candidate symbol. Must be
      4-aligned (the bundle's `unsigned int[N]` requires the
      start to be 4-aligned).
    - `symbols`: parsed symbols.txt entries (full module), used
      for the named-symbol enumeration.
    - `sections`: parsed delinks.txt section map. The candidate's
      containing section is auto-detected.
    - `binary`: the region's extracted module binary (raw bytes).
    - `binary_base_vaddr`: VA of `binary[0]` (typically the
      module's `.text` start).
    - `max_bundle_bytes`: safety cap. The audit of brief
      152/155 showed bundles up to 64 bytes; the cap is
      deliberately generous so future cases with larger gap
      chains still terminate, but raises a clear error if
      something pathological is happening (e.g. an entire
      `.data` section is all zero).

    Returns a `Bundle` describing the selected extent + the
    bytes inside it + the subsumed inner symbols.

    Raises `BundleExtentError` if:

    - `candidate_vaddr` isn't 4-aligned.
    - `candidate_vaddr` isn't inside any section in
      `sections`.
    - No named symbol exists after the candidate inside the
      same section.
    - All candidate bundles up to `max_bundle_bytes` are
      all-zero (would route to `.bss`).
    """
    if candidate_vaddr % WORD_SIZE != 0:
        raise BundleExtentError(
            f"candidate vaddr 0x{candidate_vaddr:08x} is not "
            f"4-aligned — bundle's `unsigned int[N]` recipe "
            f"requires a 4-aligned anchor (use the existing "
            f"`cluster_b_bundle.py` .s renderer for size-1/2 "
            f"candidates at odd offsets)"
        )

    # Identify the candidate's containing section. Order matters
    # — sections must be disjoint, but pick the smallest matching
    # for predictability.
    section = None
    sec_lo = sec_hi = 0
    for name, (lo, hi) in sections.items():
        if lo <= candidate_vaddr < hi:
            section = name
            sec_lo, sec_hi = lo, hi
            break
    if section is None:
        raise BundleExtentError(
            f"candidate vaddr 0x{candidate_vaddr:08x} is not "
            f"inside any section in delinks.txt's section map "
            f"({sorted(sections.keys())})"
        )

    # Find the candidate symbol by addr (and verify it exists).
    candidate_sym = next(
        (s for s in symbols if s.addr == candidate_vaddr), None,
    )
    if candidate_sym is None:
        raise BundleExtentError(
            f"no symbol at vaddr 0x{candidate_vaddr:08x} in "
            f"symbols.txt"
        )

    # Enumerate named symbols AFTER the candidate, in the same
    # section, sorted by addr ascending. (`symbols` may already
    # be sorted; we re-sort here defensively.)
    section_after: list[Symbol] = sorted(
        [
            s for s in symbols
            if candidate_vaddr < s.addr < sec_hi
        ],
        key=lambda s: s.addr,
    )
    if not section_after:
        raise BundleExtentError(
            f"no named symbol exists after vaddr "
            f"0x{candidate_vaddr:08x} within section {section} "
            f"(bounds [0x{sec_lo:08x}, 0x{sec_hi:08x})) — "
            f"bundle would need to extend to section end, "
            f"which the heuristic doesn't support (no clean "
            f"terminating named-symbol boundary)"
        )

    # Walk the candidate next-named symbols. For each: is the
    # vaddr 4-aligned? Does the bundle [candidate, next) contain
    # a non-zero byte? Stop at the first hit.
    for next_sym in section_after:
        next_vaddr = next_sym.addr
        if next_vaddr % WORD_SIZE != 0:
            # Bundle end must be 4-aligned per ALIGNALL(2)
            # cascade (brief 152 finding W6).
            continue
        size = next_vaddr - candidate_vaddr
        if size > max_bundle_bytes:
            raise BundleExtentError(
                f"candidate at 0x{candidate_vaddr:08x}: walked "
                f"to next 4-aligned named symbol "
                f"{next_sym.name}@0x{next_vaddr:08x} but bundle "
                f"size {size} exceeds the safety cap "
                f"{max_bundle_bytes}. Either raise the cap or "
                f"investigate — a > 1 KB bundle is unusual."
            )
        fo = candidate_vaddr - binary_base_vaddr
        if fo < 0 or fo + size > len(binary):
            raise BundleExtentError(
                f"candidate at 0x{candidate_vaddr:08x}: bundle "
                f"would read past the binary (fo={fo}, "
                f"size={size}, binary={len(binary)})"
            )
        chunk = bytes(binary[fo:fo + size])
        if any(b != 0 for b in chunk):
            inner = tuple(
                (s.name, s.addr - candidate_vaddr)
                for s in section_after
                if candidate_vaddr < s.addr < next_vaddr
            )
            return Bundle(
                anchor_name=candidate_sym.name,
                anchor_vaddr=candidate_vaddr,
                end_vaddr=next_vaddr,
                section=section,
                bytes_le=chunk,
                inner_symbols=inner,
            )

    raise BundleExtentError(
        f"candidate at 0x{candidate_vaddr:08x}: walked through "
        f"all {len(section_after)} subsequent named symbols in "
        f"section {section} without finding a 4-aligned boundary "
        f"+ non-zero bundle. The `.data` tail after the "
        f"candidate may be all-zero (would route to `.bss`); "
        f"investigate by hand."
    )


# --------------------------------------------------------------------------- #
# `.c` emission — `unsigned int[N]` shape per brief 152 / 155 recipe
# --------------------------------------------------------------------------- #


def render_bundle_c(
    bundle: Bundle,
    *,
    candidate_value_hint: bool = True,
    extra_comment_lines: list[str] | None = None,
) -> str:
    """Render the brief 152 / 155 `.c` source for a bundle.
    Format:

        /* Brief 174 ... */

        unsigned int <anchor>[<N>] = {
            0xVALUE0,
            ...
        };

    The first word's comment annotates "candidate value" so a
    reviewer can see at a glance where the candidate scalar's
    bytes live. Subsequent words get inline comments for any
    subsumed-placeholder names that land at this word's offset.

    `candidate_value_hint`: if True, prefix the first word with a
    `/* candidate value */` comment when it's non-zero — matches
    brief 152's worked example. Set False for fully-zero
    candidates where the first word is just pad.
    """
    words = bundle.words
    n = len(words)
    inner_by_offset = dict(bundle.inner_symbols)

    lines: list[str] = []
    lines.append("/* Brief 174 bundle-extent generator output.")
    lines.append(" *")
    lines.append(
        f" * Anchor: {bundle.anchor_name} "
        f"@ 0x{bundle.anchor_vaddr:08x}, size {bundle.size_bytes} "
        f"bytes ({n} words). Bundle terminates at the next"
    )
    lines.append(
        f" * 4-aligned named symbol "
        f"(0x{bundle.end_vaddr:08x})."
    )
    if bundle.inner_symbols:
        lines.append(" *")
        lines.append(
            " * Subsumed placeholder symbols (load relocs to these "
            "addresses resolve via"
        )
        lines.append(
            " * patch_module_literals.py post-link — brief 152 "
            "workaround #3 mechanism):"
        )
        for name, offset in bundle.inner_symbols:
            lines.append(
                f" *   - {name} @ +0x{offset:x} "
                f"(VA 0x{bundle.anchor_vaddr + offset:08x})"
            )
    lines.append(" *")
    lines.append(
        " * Bundle extent chosen by tools/cluster_b_bundle_gen.py "
        "(brief 174):"
    )
    lines.append(
        " * walk forward through named symbols, pick the first 4-aligned"
    )
    lines.append(
        " * named symbol such that the bundle contains at least 1 "
        "non-zero byte"
    )
    lines.append(
        " * (so mwcc emits to .data, not .bss). Reproduces brief "
        "152/155 hand-tuned bundles byte-for-byte."
    )
    if extra_comment_lines:
        lines.append(" *")
        for cl in extra_comment_lines:
            lines.append(f" * {cl}" if cl else " *")
    lines.append(" */")
    lines.append("")
    lines.append(
        f"unsigned int {bundle.anchor_name}[{n}] = {{"
    )
    for i, w in enumerate(words):
        offset = i * WORD_SIZE
        inner_name = inner_by_offset.get(offset)
        comment_bits: list[str] = []
        if i == 0 and candidate_value_hint and w != 0:
            comment_bits.append("candidate value")
        if inner_name is not None:
            comment_bits.append(f"subsumed: {inner_name}")
        comment_str = (
            f"  /* {' — '.join(comment_bits)} */"
            if comment_bits else ""
        )
        lines.append(f"    0x{w:08x},{comment_str}")
    lines.append("};")
    return "\n".join(lines) + "\n"


# --------------------------------------------------------------------------- #
# File + delinks emission (matches cross_region_cluster_apply.py's
# convention so the two tools play nicely together).
# --------------------------------------------------------------------------- #


def _src_data_dir_for(paths: RegionPaths) -> Path:
    """EUR baseline lives at `src/main/` / `src/overlay002/`
    (no region prefix per CLAUDE.md + brief 064). USA + JPN
    use `src/usa/` / `src/jpn/` prefixes. `RegionPaths` from
    brief 170 always prefixes, which is wrong for EUR — patch
    here."""
    if paths.region == "eur":
        subdir = (
            "main" if paths.overlay_num is None
            else f"overlay{paths.overlay_num:03d}"
        )
        return ROOT / "src" / subdir / "data"
    return paths.src_data_dir


def claim_file_path(paths: RegionPaths, anchor_vaddr: int) -> Path:
    """`src/<module>/data/data_<addr>.c` for EUR main or
    `src/<region>/<module>/data/data_<addr>.c` for USA/JPN
    (or overlay variants for both). Mirrors the per-region
    layout convention from CLAUDE.md + brief 064."""
    if paths.overlay_num is None:
        name = f"data_{anchor_vaddr:08x}.c"
    else:
        name = f"data_ov{paths.overlay_num:03d}_{anchor_vaddr:08x}.c"
    return _src_data_dir_for(paths) / name


def src_relpath_for_claim(paths: RegionPaths, anchor_vaddr: int) -> str:
    return str(claim_file_path(paths, anchor_vaddr).relative_to(ROOT))


def delinks_stanza_for(
    rel_src: str, section: str, start: int, end: int,
) -> str:
    return (
        f"\n{rel_src}:\n"
        f"    complete\n"
        f"    {section} start:0x{start:08x} end:0x{end:08x}\n"
    )


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #


def _parse_address(s: str) -> int:
    s = s.strip()
    if s.lower().startswith("0x"):
        return int(s, 16)
    return int(s, 0)


def cmd_generate(args: argparse.Namespace) -> int:
    paths = RegionPaths.make(args.region, args.module)
    for p in (paths.symbols_txt, paths.delinks_txt, paths.binary_bin):
        if not p.is_file():
            print(f"error: required file missing: {p}", file=sys.stderr)
            return 1
    symbols = parse_symbols_file(
        paths.symbols_txt,
        "main" if paths.overlay_num is None else f"ov{paths.overlay_num:03d}",
    )
    delinks = parse_delinks(paths.delinks_txt)
    binary = paths.binary_bin.read_bytes()
    if not delinks.sections:
        print(
            f"error: no section map in {paths.delinks_txt}",
            file=sys.stderr,
        )
        return 1
    binary_base = min(s for s, _ in delinks.sections.values())

    try:
        bundle = compute_bundle_extent(
            args.address, symbols, delinks.sections,
            binary, binary_base,
        )
    except BundleExtentError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    if args.json:
        import json
        print(json.dumps({
            "anchor": bundle.anchor_name,
            "anchor_vaddr": f"0x{bundle.anchor_vaddr:08x}",
            "end_vaddr": f"0x{bundle.end_vaddr:08x}",
            "section": bundle.section,
            "size_bytes": bundle.size_bytes,
            "words": [f"0x{w:08x}" for w in bundle.words],
            "inner_symbols": [
                {"name": n, "offset": f"0x{o:x}"}
                for n, o in bundle.inner_symbols
            ],
        }, indent=2))
        return 0

    source = render_bundle_c(bundle)
    rel = src_relpath_for_claim(paths, bundle.anchor_vaddr)
    stanza = delinks_stanza_for(
        rel, bundle.section, bundle.anchor_vaddr, bundle.end_vaddr,
    )

    if args.dry_run:
        print(f"=== {rel} ===")
        print(source)
        print(f"=== delinks.txt stanza (append to {paths.delinks_txt}) ===")
        print(stanza)
        return 0

    file_path = claim_file_path(paths, bundle.anchor_vaddr)
    file_path.parent.mkdir(parents=True, exist_ok=True)
    file_path.write_text(source, encoding="utf-8")

    existing = paths.delinks_txt.read_text(encoding="utf-8")
    if existing and not existing.endswith("\n"):
        existing += "\n"
    paths.delinks_txt.write_text(existing + stanza, encoding="utf-8")

    print(
        f"{args.region}/{args.module}: emitted "
        f"{bundle.anchor_name} bundle "
        f"({bundle.size_bytes} bytes, "
        f"{len(bundle.inner_symbols)} subsumed)",
        file=sys.stderr,
    )
    return 0


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog="cluster_b_bundle_gen.py",
        description=(
            "Compute + emit a cluster B bundle "
            "(`unsigned int[N]` shape per brief 152 / 155 recipe) "
            "for a candidate symbol. Brief 174."
        ),
    )
    p.add_argument(
        "--region", required=True, choices=("eur", "usa", "jpn"),
    )
    p.add_argument(
        "--module", required=True,
        help="'main' or 'ovNNN' (e.g. 'ov007').",
    )
    p.add_argument(
        "--address", required=True, type=_parse_address,
        help="Candidate symbol VA (4-aligned). Bundle is emitted "
             "for this anchor.",
    )
    p.add_argument(
        "--dry-run", action="store_true",
        help="Print the rendered TU + delinks stanza instead "
             "of writing files.",
    )
    p.add_argument(
        "--json", action="store_true",
        help="Print bundle metadata as JSON to stdout (mutually "
             "exclusive with file write — for tool chaining).",
    )
    p.set_defaults(func=cmd_generate)
    return p


def main(argv: list[str] | None = None) -> int:
    p = build_parser()
    args = p.parse_args(argv)
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
