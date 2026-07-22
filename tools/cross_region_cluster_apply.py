#!/usr/bin/env python3

"""
cross_region_cluster_apply.py — per-region claim regenerator for
cluster B + D-3 cross-region application (brief 170).

Brief 169 (PR #605) shipped 3,164 cluster A `.bss` claims across
USA + JPN by **regenerating from each region's own `symbols.txt`
+ `delinks.txt` section bounds** — NOT mechanically porting EUR's
address-shifted files. This sidesteps per-overlay offset
arithmetic (which varies: main −0xe0, ov007 −0x100, etc.) and
avoids fragile EUR↔USA/JPN address mapping.

Brief 169's generator was implicit / ad-hoc (the cluster A bss
shape is trivial: `.space N` zero-fill per symbol). Brief 170
turns the approach into a reusable tool that handles the more
varied cluster B + D-3 shapes:

  - **Cluster B true scalars**: 4-byte integer constants in
    `.data`. Recipe: `int data_<addr> = 0xVALUE;` per
    [`docs/research/cluster-b-recipe.md`](../docs/research/cluster-b-recipe.md).
  - **Cluster B pointers**: 4-byte pointer slots that resolve via
    `kind:load` relocs to data or function targets. Recipe:
    `extern char <pointee>; void *data_<addr> = &<pointee>;` per
    [`docs/research/cluster-b-pointer-pool.md`](../docs/research/cluster-b-pointer-pool.md)
    (brief 148).
  - **Cluster D-3 chunks**: residual `.rodata` not covered by
    cluster C Pattern 1 / 2. Recipe: drive `cluster_c_pattern3_gen.py`
    per chunk per region (`docs/research/cluster-d-recipe.md`).

Approach — regenerate, don't port
---------------------------------

For each `(region, module)` pair the tool:

1. Reads the region's `symbols.txt` + `delinks.txt` to enumerate
   candidate data symbols + section bounds + already-claimed
   ranges.
2. Reads the region's extracted module binary
   (`extract/<region>/<arm9 or arm9_overlays>/<file>.bin`) for
   raw bytes at each candidate address.
3. Reads the region's `relocs.txt` to identify `kind:load` reloc
   targets (= pointer slots) vs. raw scalars.
4. Classifies each candidate into a sub-pool (true scalar /
   pointer-to-data / pointer-to-function) by the byte content +
   reloc presence.
5. Emits the appropriate recipe per sub-pool.
6. Writes claim files to `src/<region>/<module>/data/data_<addr>.c`
   (or `.s` for D-3) and appends `delinks.txt` stanzas.

No EUR-to-region symbol mapping is required: each region's
`symbols.txt` already encodes the correct region-specific
addresses, and the orig bytes at those addresses are the
authoritative source. The "manifest" is the region's own
unclaimed `.data` / `.rodata` pool — the tool enumerates it
directly.

Out-of-scope sub-pools (decomper brief 172+ handles manually)
-------------------------------------------------------------

- **Cluster B size-1/2 scalars** require the brief 152 bundle
  recipe (group with a non-zero neighbour to avoid the LCF
  `ALIGNALL(2)` cascade). Bundling is content-sensitive and
  needs decomper judgement.
- **Cluster B value=0 scalars** require the brief 155 bundle
  recipe (group with a non-zero neighbour to avoid mwcc routing
  the section to `.bss`). Same content-sensitivity.
- **Cluster C / D-1 / D-2 cross-region** — separate brief
  (cluster C has more region-specific content per brief 122).

These sub-pools are deliberately deferred to keep this tool
predictable + minimise the false-positive risk from automated
content classification.

Usage
-----

  # Enumerate + apply cluster B true scalars in USA main:
  python tools/cross_region_cluster_apply.py b-scalars \\
      --region usa --module main

  # Same for JPN, all modules (main + ov000..ov023):
  python tools/cross_region_cluster_apply.py b-scalars \\
      --region jpn

  # Cluster B pointers (data + function), USA main:
  python tools/cross_region_cluster_apply.py b-pointers \\
      --region usa --module main

  # Cluster D-3 chunks, USA main (drives cluster_c_pattern3_gen.py):
  python tools/cross_region_cluster_apply.py d3-chunks \\
      --region usa --module main

  # Dry run — print what would be emitted without writing:
  python tools/cross_region_cluster_apply.py b-scalars \\
      --region usa --module main --dry-run

Brief 170 deliverable. After this brief lands, decomper brief
172+ can run additional cross-region waves (cluster C, D-1, D-2)
by extending this tool's subcommand vocabulary.
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# Reuse the symbol / reloc parsers from analyze_symbols.py to
# keep the schema canonical (single source of truth for the
# symbols.txt + relocs.txt grammars).
sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    Reloc,
    Symbol,
    parse_relocs_file,
    parse_symbols_file,
)
from parsers import parse_delinks_file  # noqa: E402

# Brief 184: brief 177's extent adjuster + brief 125's Pattern 3
# emitter are the building blocks for the cluster C / D-1 / D-2
# cross-region subcommands. Per the brief 184 audit (research note
# `docs/research/chunk-extent-generalisation.md`), the extent
# adjuster's 3-phase algorithm is already cluster-agnostic — the
# new subcommands just call it with per-cluster `require_nonzero`
# rules and route the output to per-cluster emitters.
#
# `cross_region_chunk_extent` imports `RegionPaths` + `parse_delinks`
# back from this module for its own CLI (`cmd_adjust`), so a
# top-level import here would cycle. Brief 184 keeps that import
# lazy inside `apply_chunk_candidate` to break the cycle.
from cluster_c_pattern3_gen import generate_chunk as generate_pattern3_chunk  # noqa: E402
from analyze_symbols import load_all  # noqa: E402


# --------------------------------------------------------------------------- #
# Region + module path resolution
# --------------------------------------------------------------------------- #


VALID_REGIONS = ("usa", "jpn", "eur")


def module_id_to_overlay_num(module: str) -> int | None:
    """`'main' -> None`, `'ov007' -> 7`, `'overlay007' -> 7`."""
    if module == "main":
        return None
    m = re.fullmatch(r"(?:ov|overlay)(\d{3})", module)
    if m is None:
        raise ValueError(
            f"unrecognised module id {module!r} "
            f"(expected 'main' or 'ovNNN' / 'overlayNNN')"
        )
    return int(m.group(1))


def overlay_num_to_module_id(n: int | None) -> str:
    return "main" if n is None else f"ov{n:03d}"


def src_subdir_for_module(n: int | None) -> str:
    """Sub-tree under `src/<region>/` for the given module.
    Main → `main`; overlay 7 → `overlay007`. Mirrors EUR's
    layout convention so per-region trees share the path shape."""
    return "main" if n is None else f"overlay{n:03d}"


@dataclass
class RegionPaths:
    """Path bundle for one (region, module) — derived once and
    reused across symbol / reloc / binary loads."""

    region: str
    module: str
    overlay_num: int | None
    config_dir: Path             # config/<region>/arm9 OR overlays/ovNNN
    symbols_txt: Path
    relocs_txt: Path
    delinks_txt: Path
    binary_bin: Path             # extract/<region>/<...>/<module>.bin
    src_data_dir: Path           # src/<region>/<module>/data

    @classmethod
    def make(cls, region: str, module: str) -> RegionPaths:
        if region not in VALID_REGIONS:
            raise ValueError(
                f"region must be one of {VALID_REGIONS!r}, got {region!r}"
            )
        n = module_id_to_overlay_num(module)
        if n is None:
            config_dir = ROOT / f"config/{region}/arm9"
            binary_bin = ROOT / f"extract/{region}/arm9/arm9.bin"
        else:
            config_dir = ROOT / f"config/{region}/arm9/overlays/ov{n:03d}"
            binary_bin = ROOT / f"extract/{region}/arm9_overlays/ov{n:03d}.bin"
        src_root = ROOT / "src" / region / src_subdir_for_module(n)
        return cls(
            region=region,
            module=module,
            overlay_num=n,
            config_dir=config_dir,
            symbols_txt=config_dir / "symbols.txt",
            relocs_txt=config_dir / "relocs.txt",
            delinks_txt=config_dir / "delinks.txt",
            binary_bin=binary_bin,
            src_data_dir=src_root / "data",
        )


# --------------------------------------------------------------------------- #
# delinks.txt parsing — section map + per-TU claimed ranges
# --------------------------------------------------------------------------- #


@dataclass
class ClaimedRange:
    """One (section, start_va, end_va) range that's already
    claimed by an existing source TU in delinks.txt."""

    section: str
    start: int
    end: int


@dataclass
class DelinksMap:
    """Parsed `delinks.txt`: section bounds (the file's leading
    stanza) + every TU's per-section claimed ranges."""

    sections: dict[str, tuple[int, int]] = field(default_factory=dict)
    claims: list[ClaimedRange] = field(default_factory=list)
    tu_paths: set[str] = field(default_factory=set)


def parse_delinks(path: Path) -> DelinksMap:
    sections, tus = parse_delinks_file(path)
    out = DelinksMap(
        sections={name: (start, end) for name, start, end in sections},
        tu_paths={tu["source"] for tu in tus},
        claims=[
            ClaimedRange(section, start, end)
            for tu in tus
            for section, start, end in tu.get("sections", [])
        ],
    )
    return out


def is_addr_claimed(delinks: DelinksMap, section: str, addr: int) -> bool:
    """True iff `addr` falls inside any existing claim's range
    in `section`. O(claims) — fine at our scale (≪ 1k TUs per
    module)."""
    for c in delinks.claims:
        if c.section == section and c.start <= addr < c.end:
            return True
    return False


# --------------------------------------------------------------------------- #
# Region context — bundles everything per `(region, module)`
# --------------------------------------------------------------------------- #


@dataclass
class RegionContext:
    paths: RegionPaths
    symbols: list[Symbol]        # sorted by addr
    relocs: list[Reloc]
    delinks: DelinksMap
    binary: bytes

    @classmethod
    def load(cls, region: str, module: str) -> RegionContext:
        paths = RegionPaths.make(region, module)
        for p in (paths.symbols_txt, paths.delinks_txt, paths.binary_bin):
            if not p.is_file():
                raise FileNotFoundError(
                    f"{p} not found — has the region been extracted? "
                    f"(`tools/configure.py {region}` + `ninja extract/{region}/config.yaml`)"
                )
        # Symbol module key matches the dsd convention: 'main' or
        # 'ovNNN'.
        syms = parse_symbols_file(
            paths.symbols_txt,
            overlay_num_to_module_id(paths.overlay_num),
        )
        syms.sort(key=lambda s: s.addr)
        relocs = (
            parse_relocs_file(
                paths.relocs_txt,
                overlay_num_to_module_id(paths.overlay_num),
            )
            if paths.relocs_txt.is_file() else []
        )
        delinks = parse_delinks(paths.delinks_txt)
        binary = paths.binary_bin.read_bytes()
        return cls(
            paths=paths,
            symbols=syms,
            relocs=relocs,
            delinks=delinks,
            binary=binary,
        )

    def file_offset_for(self, va: int) -> int | None:
        """Return the file offset of `va` inside `binary`. Returns
        None if `va` isn't within any section recorded in
        delinks.txt — caller should skip such symbols."""
        if not self.delinks.sections:
            return None
        # The binary's file offset 0 corresponds to the first
        # section's start VA (the module's load VA). For arm9
        # main this is `.text` start; for overlays it's also
        # the first section.
        base_va = min(s for s, _ in self.delinks.sections.values())
        if va < base_va or va >= base_va + len(self.binary):
            return None
        return va - base_va

    def read_u32_le(self, va: int) -> int | None:
        fo = self.file_offset_for(va)
        if fo is None or fo + 4 > len(self.binary):
            return None
        return int.from_bytes(self.binary[fo:fo + 4], "little")


# --------------------------------------------------------------------------- #
# Symbol-size inference (deltas between consecutive addrs)
# --------------------------------------------------------------------------- #


def infer_symbol_sizes(
    syms: list[Symbol],
    sections: dict[str, tuple[int, int]],
) -> dict[int, int]:
    """Return `{addr: size_bytes}` for every symbol in `syms`,
    deriving size from address deltas to the next symbol — falling
    back to the symbol's containing section's end for the last
    symbol in each section. Matches brief 169's bss-size derivation.

    Symbols with an explicit `size=0xN` attribute in symbols.txt
    (i.e. `s.size != 0`) keep their declared size; only `size=0`
    symbols get the delta-derived value."""
    out: dict[int, int] = {}
    # Sort once.
    sorted_syms = sorted(syms, key=lambda s: s.addr)
    for i, s in enumerate(sorted_syms):
        if s.size:
            out[s.addr] = s.size
            continue
        # Find the next symbol's addr; cap at the containing
        # section's end.
        section_end = None
        for sec_start, sec_end in sections.values():
            if sec_start <= s.addr < sec_end:
                section_end = sec_end
                break
        if section_end is None:
            # Symbol isn't in any known section — skip.
            continue
        # Next addr in this section (binary-search adjacent sorted
        # entry; cap at section_end).
        next_addr = section_end
        # The list is small enough that linear-from-i+1 is fine;
        # the `addrs_sorted` parallel is just for the cap calc.
        for nxt in sorted_syms[i + 1:]:
            if nxt.addr >= section_end:
                break
            next_addr = nxt.addr
            break
        out[s.addr] = next_addr - s.addr
    return out


# --------------------------------------------------------------------------- #
# Cluster B sub-pool enumeration
# --------------------------------------------------------------------------- #


@dataclass
class ScalarCandidate:
    addr: int
    name: str           # `data_<addr>` (or `data_ov<NN>_<addr>` for overlays)
    value: int          # 4 bytes little-endian


@dataclass
class PointerCandidate:
    addr: int
    name: str
    pointee_va: int
    pointee_name: str
    pointee_is_function: bool
    pointee_is_thumb: bool


def enumerate_b_true_scalars(ctx: RegionContext) -> list[ScalarCandidate]:
    """Filter to size:4 data symbols whose 4 bytes are NEITHER
    all-zero NOR a `kind:load` reloc target. Per brief 117's
    recipe these compile as `int data_<addr> = 0xVALUE;` and
    mwcc routes them to `.data` automatically.

    Excludes:
      - Symbols already claimed in delinks.txt (idempotent).
      - Symbols outside `.data` (only `.data` cluster B scope).
      - Symbols with a `kind:load` reloc whose `from` is at the
        symbol's address — those are pointer slots (covered by
        `enumerate_b_pointers`).
      - Symbols whose 4-byte value is zero (covered by the brief
        155 bundle recipe; not in this tool's scope).
      - Symbols whose size != 4 (size-1/2 needs brief 152 bundle;
        not in this tool's scope).
    """
    data_section = ctx.delinks.sections.get(".data")
    if data_section is None:
        return []
    data_lo, data_hi = data_section

    # Pre-index load relocs whose `from` (source slot address) is
    # in `.data`: those slots are pointers, not scalars.
    pointer_slot_addrs: set[int] = {
        r.src_addr for r in ctx.relocs
        if r.kind == "load" and data_lo <= r.src_addr < data_hi
    }

    sizes = infer_symbol_sizes(ctx.symbols, ctx.delinks.sections)

    out: list[ScalarCandidate] = []
    for sym in ctx.symbols:
        if sym.type != "data":
            continue
        if not (data_lo <= sym.addr < data_hi):
            continue
        if sym.name.startswith("_dsd_gap"):
            continue
        if not sym.is_named is False and not sym.name.startswith("data_"):
            # Hand-named symbols (e.g. `BuildInfo`) — already
            # decoded; skip.
            continue
        if not sym.name.startswith("data_"):
            continue
        size = sizes.get(sym.addr, 0)
        if size != 4:
            continue
        if sym.addr in pointer_slot_addrs:
            continue
        if is_addr_claimed(ctx.delinks, ".data", sym.addr):
            continue
        value = ctx.read_u32_le(sym.addr)
        if value is None:
            continue
        if value == 0:
            continue  # value=0 needs bundle recipe (brief 155)
        out.append(ScalarCandidate(
            addr=sym.addr, name=sym.name, value=value,
        ))
    return out


def enumerate_b_pointers(ctx: RegionContext) -> list[PointerCandidate]:
    """Filter to size:4 data symbols whose slot has a `kind:load`
    reloc — these are pointers whose target VA is in the reloc's
    `to` field.

    Per brief 148 the recipe is:

        extern char <pointee>;
        void *data_<addr> = &<pointee>;

    For thumb-mode function pointees the recipe adds `+1`:

        extern char func_<addr>;
        void *data_<addr> = (void *) ((char *) &func_<addr> + 1);

    Excludes:
      - Symbols already claimed in delinks.txt (idempotent).
      - Slots outside `.data`.
      - Slots whose pointee VA doesn't resolve to a known symbol
        in any region module (these are cross-overlay / SDK refs
        whose port needs case-specific care; decomper brief
        172+ handles).
    """
    data_section = ctx.delinks.sections.get(".data")
    if data_section is None:
        return []
    data_lo, data_hi = data_section

    # Build (src_addr -> Reloc) for load relocs in .data.
    relocs_by_src: dict[int, Reloc] = {}
    for r in ctx.relocs:
        if r.kind == "load" and data_lo <= r.src_addr < data_hi:
            relocs_by_src.setdefault(r.src_addr, r)

    # Resolve pointee VAs to symbols WITHIN this region's module
    # (cross-module pointees need the full multi-module index;
    # for the MVP we resolve only same-module).
    sym_by_addr = {s.addr: s for s in ctx.symbols}

    sizes = infer_symbol_sizes(ctx.symbols, ctx.delinks.sections)

    out: list[PointerCandidate] = []
    for sym in ctx.symbols:
        if sym.type != "data":
            continue
        if not (data_lo <= sym.addr < data_hi):
            continue
        if not sym.name.startswith("data_"):
            continue
        if sizes.get(sym.addr, 0) != 4:
            continue
        if sym.addr not in relocs_by_src:
            continue
        if is_addr_claimed(ctx.delinks, ".data", sym.addr):
            continue
        reloc = relocs_by_src[sym.addr]
        # Same-module pointee resolution only (MVP).
        if reloc.dest_module != overlay_num_to_module_id(
            ctx.paths.overlay_num,
        ):
            continue
        pointee = sym_by_addr.get(reloc.dest_addr)
        # Function pointers also resolve to function-region
        # symbols; thumb bit may be set on the stored value
        # (target VA stored = func_addr | 1 for thumb funcs).
        is_thumb = False
        if pointee is None:
            # Try odd-aligned (thumb +1 convention).
            pointee = sym_by_addr.get(reloc.dest_addr & ~1)
            if pointee is not None and (reloc.dest_addr & 1):
                is_thumb = True
        if pointee is None:
            continue
        out.append(PointerCandidate(
            addr=sym.addr,
            name=sym.name,
            pointee_va=reloc.dest_addr,
            pointee_name=pointee.name,
            pointee_is_function=pointee.is_function,
            pointee_is_thumb=is_thumb or (
                pointee.is_function and pointee.mode == "thumb"
            ),
        ))
    return out


# --------------------------------------------------------------------------- #
# Cluster C / D-1 / D-2 candidate enumeration (brief 184)
# --------------------------------------------------------------------------- #
#
# Per the brief 184 research note `docs/research/chunk-extent-
# generalisation.md`, these three subcommands share a common shape:
#
#   1. Enumerate unclaimed candidate symbols in the relevant section
#      using cluster-specific predicates (string / dispatch-table /
#      mixed-array).
#   2. For each candidate, ask `cross_region_chunk_extent.
#      adjust_chunk_extent` to compute a clean `[start, end)` that
#      satisfies the 4-aligned + named-boundary constraints
#      (Phase A / B / C in the brief 177 algorithm). The adjuster is
#      cluster-agnostic — the only per-cluster knob is
#      `require_nonzero`, auto-detected from the section name
#      (`.data` → True, `.rodata` → False).
#   3. Emit the chunk source through the per-cluster emitter (Pattern
#      3 `.s` for C and D-2; C-source `void *[]` array for D-1) and
#      queue the delinks stanza.
#
# Brief 184 ships these as enumeration + emission only. Decomper's
# brief 185+ owns the apply waves that drain the resulting pools.


@dataclass
class ChunkCandidate:
    """A candidate `[addr, addr + size)` chunk that's a viable input
    to `adjust_chunk_extent`. The adjuster may extend `[start, end)`
    via its Phase A / B passes before the chunk emitter runs."""

    addr: int            # target_start
    size: int            # target_end - target_start (inferred)
    section: str         # ".rodata" or ".data"
    shape: str           # "string" / "d1-table" / "d2-array"
    # D-1 only: per-slot reloc info for the C-source emitter.
    table_entries: tuple[tuple[str, bool], ...] = ()
    # (pointee_name, is_thumb) per 4-byte slot, in slot order.


def _is_data_named(sym: Symbol) -> bool:
    """Common filter for `data_` symbols in the dsd convention.
    Hand-named symbols (e.g. `BuildInfo`) are excluded — they're
    already decoded by upstream work and don't need cross-region
    apply."""
    return (
        sym.type == "data"
        and sym.name.startswith("data_")
        and not sym.name.startswith("_dsd_gap")
    )


def enumerate_c_strings(ctx: RegionContext) -> list[ChunkCandidate]:
    """Cluster C Pattern 1: single-symbol `.rodata` byte arrays
    (strings, const tables, etc.) that haven't been claimed yet.

    Filter:
      - Symbol in `.rodata` section.
      - Not already claimed in delinks.txt (idempotent).
      - Size inferred from the next-symbol delta is ≥ 1 byte.
      - Byte content is NOT all-zero (avoids matching uninitialised
        ranges that mwcc would emit to `.bss`).
      - Excludes symbols whose first byte is at a non-4-aligned VA
        AND whose size is < 4 — those need brief 152 / 155 bundle
        recipes (out of scope here; bundle work stays in the
        `b-scalars` / `b-pointers` lane).

    `adjust_chunk_extent` handles the 4-aligned end + named-symbol
    boundary downstream; this enumeration only proposes target
    ranges. The adjuster may extend the range to absorb neighbours
    via its Phase A / B passes.
    """
    rodata = ctx.delinks.sections.get(".rodata")
    if rodata is None:
        return []
    ro_lo, ro_hi = rodata
    sizes = infer_symbol_sizes(ctx.symbols, ctx.delinks.sections)
    out: list[ChunkCandidate] = []
    for sym in ctx.symbols:
        if not _is_data_named(sym):
            continue
        if not (ro_lo <= sym.addr < ro_hi):
            continue
        if is_addr_claimed(ctx.delinks, ".rodata", sym.addr):
            continue
        size = sizes.get(sym.addr, 0)
        if size < 1:
            continue
        # Skip bundle-territory symbols (size < 4 + non-4-aligned
        # addr). brief 152's recipe owns those — separate lane.
        if size < 4 and sym.addr % 4 != 0:
            continue
        fo = ctx.file_offset_for(sym.addr)
        if fo is None or fo + size > len(ctx.binary):
            continue
        content = ctx.binary[fo:fo + size]
        if not any(b for b in content):
            # All-zero `.rodata` is unusual but possible (empty
            # initialiser tables). Skip rather than risk mwcc
            # mis-routing to `.bss`. Decomper can hand-claim if
            # any matter.
            continue
        out.append(ChunkCandidate(
            addr=sym.addr, size=size,
            section=".rodata", shape="string",
        ))
    return out


def enumerate_d1_tables(ctx: RegionContext) -> list[ChunkCandidate]:
    """Cluster D-1: `.data` dispatch / pointer tables.

    Filter:
      - Symbol in `.data` section.
      - Not already claimed.
      - Size inferred ≥ 8 bytes AND 4-aligned (= ≥ 2 pointer slots
        of 4 bytes each; smaller slots are cluster B's pointer
        territory).
      - EVERY 4-byte slot inside `[addr, addr + size)` is a
        `kind:load` reloc source — the dispatch-table shape per
        brief 121.
      - All pointee VAs resolve to known symbols in this region's
        module index (same-module resolution per brief 148's
        precedent; cross-module pointees defer to decomper).

    `table_entries` carries `(pointee_name, is_thumb)` per slot in
    slot order for the C-source emitter.
    """
    data = ctx.delinks.sections.get(".data")
    if data is None:
        return []
    da_lo, da_hi = data
    sizes = infer_symbol_sizes(ctx.symbols, ctx.delinks.sections)

    # Index load relocs by src_addr (slot address) → Reloc.
    relocs_by_src: dict[int, Reloc] = {}
    for r in ctx.relocs:
        if r.kind == "load" and da_lo <= r.src_addr < da_hi:
            relocs_by_src.setdefault(r.src_addr, r)

    sym_by_addr = {s.addr: s for s in ctx.symbols}
    out: list[ChunkCandidate] = []
    for sym in ctx.symbols:
        if not _is_data_named(sym):
            continue
        if not (da_lo <= sym.addr < da_hi):
            continue
        if is_addr_claimed(ctx.delinks, ".data", sym.addr):
            continue
        size = sizes.get(sym.addr, 0)
        if size < 8 or size % 4 != 0:
            continue
        # Single-slot pointers belong to the b-pointers lane —
        # skip them here so the recipes don't overlap.
        if size == 4:
            continue
        n_slots = size // 4
        entries: list[tuple[str, bool]] = []
        all_slots_have_reloc = True
        for i in range(n_slots):
            slot_va = sym.addr + i * 4
            reloc = relocs_by_src.get(slot_va)
            if reloc is None:
                all_slots_have_reloc = False
                break
            # Same-module resolution (MVP per b-pointers).
            if reloc.dest_module != overlay_num_to_module_id(
                ctx.paths.overlay_num,
            ):
                all_slots_have_reloc = False
                break
            pointee = sym_by_addr.get(reloc.dest_addr)
            is_thumb = False
            if pointee is None:
                pointee = sym_by_addr.get(reloc.dest_addr & ~1)
                if pointee is not None and (reloc.dest_addr & 1):
                    is_thumb = True
            if pointee is None:
                all_slots_have_reloc = False
                break
            entries.append((
                pointee.name,
                is_thumb or (
                    pointee.is_function and pointee.mode == "thumb"
                ),
            ))
        if not all_slots_have_reloc:
            continue
        out.append(ChunkCandidate(
            addr=sym.addr, size=size,
            section=".data", shape="d1-table",
            table_entries=tuple(entries),
        ))
    return out


def enumerate_d2_arrays(ctx: RegionContext) -> list[ChunkCandidate]:
    """Cluster D-2: `.data` mixed byte/short/int arrays without
    relocs.

    Filter:
      - Symbol in `.data` section.
      - Not already claimed.
      - Size inferred ≥ 8 bytes AND 4-aligned.
      - NO `kind:load` reloc covers any 4-byte slot inside
        `[addr, addr + size)` — pure-content arrays, no pointer
        slots (those are D-1 territory; the b-pointers lane owns
        single-slot pointers).
      - Byte content is NOT all-zero.

    Reloc-target resolution timing (research note § 6 clarification):
    D-2 arrays by definition have NO relocs in scope, so there are
    no pointer-target dependencies to resolve. The Pattern 3
    emitter (`cluster_c_pattern3_gen.generate_chunk`) inspects each
    4-byte slot and if it happens to MATCH a known symbol VA from
    `modules.values()` it emits `.word <name>` + a corresponding
    `.extern <name>` declaration (brief 144). When no such match
    exists the slot lands as raw `.byte` / `.word` literal bytes.
    Either way the resolution happens AT EMIT TIME inside
    `generate_chunk` (not at apply time in this enumerator), and
    relies on the EUR-or-region symbol table that `load_all` reads
    from `config/<region>/`. No additional plumbing required —
    same path D-3 used in brief 178.
    """
    data = ctx.delinks.sections.get(".data")
    if data is None:
        return []
    da_lo, da_hi = data
    sizes = infer_symbol_sizes(ctx.symbols, ctx.delinks.sections)

    # Pre-index slot addresses that have any load reloc — any
    # match means the symbol is D-1 territory.
    reloc_src_addrs: set[int] = {
        r.src_addr for r in ctx.relocs
        if r.kind == "load" and da_lo <= r.src_addr < da_hi
    }

    out: list[ChunkCandidate] = []
    for sym in ctx.symbols:
        if not _is_data_named(sym):
            continue
        if not (da_lo <= sym.addr < da_hi):
            continue
        if is_addr_claimed(ctx.delinks, ".data", sym.addr):
            continue
        size = sizes.get(sym.addr, 0)
        if size < 8 or size % 4 != 0:
            continue
        # Skip any symbol whose slots overlap a load reloc — D-1.
        if any(
            (sym.addr + i * 4) in reloc_src_addrs
            for i in range(size // 4)
        ):
            continue
        fo = ctx.file_offset_for(sym.addr)
        if fo is None or fo + size > len(ctx.binary):
            continue
        if not any(b for b in ctx.binary[fo:fo + size]):
            continue
        out.append(ChunkCandidate(
            addr=sym.addr, size=size,
            section=".data", shape="d2-array",
        ))
    return out


# --------------------------------------------------------------------------- #
# Recipe emission
# --------------------------------------------------------------------------- #


def render_b_true_scalar(c: ScalarCandidate) -> str:
    return (
        f"/* Brief 170 cross-region cluster B true scalar.\n"
        f" *\n"
        f" * Generated by tools/cross_region_cluster_apply.py from\n"
        f" * the region's own symbols.txt + orig bytes. Recipe per\n"
        f" * brief 117: mwcc routes `int X = N;` to `.data`\n"
        f" * automatically; no `__attribute__((section))` needed.\n"
        f" */\n"
        f"\n"
        f"int {c.name} = 0x{c.value:x};\n"
    )


def render_b_pointer(c: PointerCandidate) -> str:
    body = (
        f"/* Brief 170 cross-region cluster B pointer slot.\n"
        f" *\n"
        f" * Generated by tools/cross_region_cluster_apply.py from\n"
        f" * the region's own symbols.txt + relocs.txt. The slot's\n"
        f" * `kind:load` reloc resolves to {c.pointee_name}\n"
        f" * (VA 0x{c.pointee_va:08x}). Recipe per brief 148:\n"
        f" * opaque `extern char` declaration of the pointee +\n"
        f" * `void *` slot initialised with `&pointee`. mwldarm\n"
        f" * emits the reloc that resolves the pointee at link\n"
        f" * time.\n"
        f" */\n"
        f"\n"
        f"extern char {c.pointee_name};\n"
        f"\n"
    )
    if c.pointee_is_thumb:
        # Thumb target — add the `+1` convention per brief 121.
        body += (
            f"void *{c.name} = (void *) "
            f"((char *) &{c.pointee_name} + 1);\n"
        )
    else:
        body += f"void *{c.name} = &{c.pointee_name};\n"
    return body


def render_d1_table(
    *,
    anchor_name: str,
    entries: tuple[tuple[str, bool], ...],
) -> str:
    """Brief 184 cluster D-1 dispatch-table emitter. Produces a C
    source that declares `extern char <pointee>;` for every unique
    target plus a `void *<anchor>[N] = { &t0, &t1, ... }` array.
    Thumb targets use the `+1` convention (brief 121).

    Pure C output — mwldarm emits the load relocs at link time the
    same way it does for the b-pointers single-slot recipe.
    """
    if not entries:
        raise ValueError("d1-table must have at least one entry")
    # Deduplicate externs in first-occurrence order so the diff is
    # stable across re-runs.
    seen: set[str] = set()
    extern_decls: list[str] = []
    for pointee_name, _ in entries:
        if pointee_name in seen:
            continue
        seen.add(pointee_name)
        extern_decls.append(f"extern char {pointee_name};")

    body_lines = [
        "/* Brief 184 cross-region cluster D-1 dispatch table.",
        " *",
        " * Generated by tools/cross_region_cluster_apply.py from the",
        " * region's own symbols.txt + relocs.txt. Each 4-byte slot",
        " * carries a `kind:load` reloc whose `to:` VA resolves to",
        " * one of the externs declared below; mwldarm emits the",
        " * actual address bytes at link time. Recipe per brief 124",
        " * cluster D-1 + brief 148's thumb `+1` convention.",
        " */",
        "",
    ]
    body_lines.extend(extern_decls)
    body_lines.append("")
    body_lines.append(f"void *{anchor_name}[{len(entries)}] = {{")
    for pointee_name, is_thumb in entries:
        if is_thumb:
            body_lines.append(
                f"    (void *) ((char *) &{pointee_name} + 1),"
            )
        else:
            body_lines.append(f"    &{pointee_name},")
    body_lines.append("};")
    return "\n".join(body_lines) + "\n"


# --------------------------------------------------------------------------- #
# Chunk-emission glue — brief 184 routes c-strings + d2-arrays
# through brief 125's Pattern 3 generator, while d1-tables uses the
# bespoke C-source emitter above (cleaner for pointer arrays than
# the `.s` per-byte form).
# --------------------------------------------------------------------------- #


@dataclass
class ChunkApplyResult:
    """One per-candidate outcome — either an emitted claim or a
    'needs hand-tuning' skip with the offending error.

    `adjusted` is typed loosely as `object | None` to avoid a top-
    level import of `cross_region_chunk_extent.AdjustedExtent`
    (which would cycle back to this module's `RegionPaths`); the
    field carries an `AdjustedExtent` at runtime when set.
    """

    candidate: ChunkCandidate
    adjusted: object | None
    status: str  # "applied" / "needs_hand_tuning" / "skipped_overlap"
    error: str | None = None
    output_path: Path | None = None
    delinks_stanza: str | None = None


def _asm_claim_file_path(ctx: RegionContext, addr: int) -> Path:
    """`.s` variant of `claim_file_path`. Pattern 3 chunks use `.s`
    so the assembler can emit the right `.byte` / `.ascii` / `.word`
    mix per brief 125's algorithm."""
    if ctx.paths.overlay_num is None:
        name = f"data_{addr:08x}.s"
    else:
        name = f"data_ov{ctx.paths.overlay_num:03d}_{addr:08x}.s"
    return ctx.paths.src_data_dir / name


def _src_relpath_asm(ctx: RegionContext, addr: int) -> str:
    return str(_asm_claim_file_path(ctx, addr).relative_to(ROOT))


def apply_chunk_candidate(
    ctx: RegionContext,
    cand: ChunkCandidate,
    *,
    dry_run: bool,
    applied_ranges: list[tuple[str, int, int]] | None = None,
    modules: dict | None = None,
) -> ChunkApplyResult:
    """Run extent adjuster → emitter → file writer for one
    candidate. Returns the per-candidate result so the caller can
    aggregate JSON / stderr reports.

    `applied_ranges` is an optional list of `(section, start, end)`
    tuples for chunks already applied earlier in this same run. The
    adjuster might extend a candidate's range to overlap an
    earlier chunk; we detect that here and skip the second one
    rather than emit a delinks conflict. (`is_addr_claimed` only
    sees delinks.txt as-loaded, not in-flight applies.)

    `modules` is the optional pre-loaded `load_all` symbol graph.
    Passed through to `generate_pattern3_chunk` so multi-candidate
    runs avoid re-parsing the region's full config tree per chunk.
    """
    # Lazy import — breaks the cycle with `cross_region_chunk_extent`
    # (which imports `RegionPaths` + `parse_delinks` from this
    # module for its own CLI).
    from cross_region_chunk_extent import (  # noqa: PLC0415
        ChunkExtentError,
        adjust_chunk_extent,
    )
    target_end = cand.addr + cand.size
    try:
        adj = adjust_chunk_extent(
            cand.addr, target_end,
            ctx.symbols, ctx.delinks.sections,
            ctx.binary,
            min(s for s, _ in ctx.delinks.sections.values()),
            section_name=cand.section,
        )
    except ChunkExtentError as e:
        return ChunkApplyResult(
            candidate=cand, adjusted=None,
            status="needs_hand_tuning", error=str(e),
        )

    # In-flight overlap check.
    if applied_ranges is not None:
        for sec, lo, hi in applied_ranges:
            if sec != adj.section:
                continue
            if adj.start < hi and adj.end > lo:
                return ChunkApplyResult(
                    candidate=cand, adjusted=adj,
                    status="skipped_overlap",
                    error=(
                        f"adjusted range overlaps in-flight "
                        f"chunk [{lo:#x}, {hi:#x})"
                    ),
                )

    if cand.shape == "d1-table":
        body = render_d1_table(
            anchor_name=f"data_{adj.start:08x}" if ctx.paths.overlay_num is None
            else f"data_ov{ctx.paths.overlay_num:03d}_{adj.start:08x}",
            entries=cand.table_entries,
        )
        file_path, stanza = write_claim(
            ctx, adj.start, body, adj.section,
            adj.size_bytes, dry_run=dry_run,
        )
    else:
        # c-strings / d2-arrays — route through Pattern 3 generator
        # (the universal `.s` emitter from brief 125 + brief 144's
        # extern handling + brief 166's `kind:label(*)` raw-hex
        # fallback). Section flag matches the candidate (`.rodata`
        # for cluster C, `.data` for D-2).
        chunk = generate_pattern3_chunk(
            version=ctx.paths.region,
            module=overlay_num_to_module_id(ctx.paths.overlay_num),
            start=adj.start,
            end=adj.end,
            section=adj.section.lstrip("."),
            modules=modules,
            bytes_source=ctx.binary,
        )
        # Override the generator's hard-coded EUR-shape output path
        # with the region's per-region path.
        file_path = _asm_claim_file_path(ctx, adj.start)
        rel_asm = _src_relpath_asm(ctx, adj.start)
        if not dry_run:
            file_path.parent.mkdir(parents=True, exist_ok=True)
            file_path.write_text(chunk.asm_source, encoding="utf-8")
        stanza = (
            f"\n{rel_asm}:\n"
            f"    complete\n"
            f"    {adj.section} start:0x{adj.start:08x} "
            f"end:0x{adj.end:08x}\n"
        )

    if applied_ranges is not None:
        applied_ranges.append((adj.section, adj.start, adj.end))

    return ChunkApplyResult(
        candidate=cand, adjusted=adj, status="applied",
        output_path=file_path, delinks_stanza=stanza,
    )


# --------------------------------------------------------------------------- #
# File + delinks emission
# --------------------------------------------------------------------------- #


def claim_file_path(ctx: RegionContext, addr: int) -> Path:
    """`src/<region>/<module>/data/data_<addr>.c` for main module
    or `src/<region>/<module>/data/data_ov<NN>_<addr>.c` for
    overlays — mirrors EUR's existing naming convention."""
    if ctx.paths.overlay_num is None:
        name = f"data_{addr:08x}.c"
    else:
        name = f"data_ov{ctx.paths.overlay_num:03d}_{addr:08x}.c"
    return ctx.paths.src_data_dir / name


def src_relpath_for_claim(ctx: RegionContext, addr: int) -> str:
    """Path relative to repo root — what goes in delinks.txt."""
    return str(claim_file_path(ctx, addr).relative_to(ROOT))


def delinks_stanza_for(rel_src: str, section: str, start: int, end: int) -> str:
    return (
        f"\n{rel_src}:\n"
        f"    complete\n"
        f"    {section} start:0x{start:08x} end:0x{end:08x}\n"
    )


def write_claim(
    ctx: RegionContext,
    addr: int,
    body: str,
    section: str,
    size_bytes: int,
    *,
    dry_run: bool,
) -> tuple[Path, str]:
    """Write the claim file + return (path, delinks_stanza).
    Caller appends the stanza after all claims are written so the
    delinks file is mutated once per run."""
    file_path = claim_file_path(ctx, addr)
    if not dry_run:
        file_path.parent.mkdir(parents=True, exist_ok=True)
        file_path.write_text(body, encoding="utf-8")
    rel = src_relpath_for_claim(ctx, addr)
    stanza = delinks_stanza_for(rel, section, addr, addr + size_bytes)
    return file_path, stanza


def append_delinks_stanzas(path: Path, stanzas: list[str]) -> None:
    """Append the new TU stanzas to delinks.txt without
    rewriting existing content (preserves diff readability)."""
    if not stanzas:
        return
    body = "".join(stanzas)
    # Ensure file ends with newline before our append.
    existing = path.read_text(encoding="utf-8")
    if existing and not existing.endswith("\n"):
        existing += "\n"
    path.write_text(existing + body, encoding="utf-8")


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #


def cmd_b_scalars(args: argparse.Namespace) -> int:
    ctx = RegionContext.load(args.region, args.module)
    cands = enumerate_b_true_scalars(ctx)
    if args.json:
        import json
        print(json.dumps([
            {"addr": f"0x{c.addr:08x}", "name": c.name,
             "value": f"0x{c.value:x}"} for c in cands
        ], indent=2))
        return 0
    if not cands:
        print(
            f"{args.region}/{args.module}: 0 cluster B true scalar candidates",
            file=sys.stderr,
        )
        return 0
    stanzas: list[str] = []
    for c in cands:
        body = render_b_true_scalar(c)
        _path, stanza = write_claim(
            ctx, c.addr, body, ".data", 4, dry_run=args.dry_run,
        )
        stanzas.append(stanza)
    if not args.dry_run:
        append_delinks_stanzas(ctx.paths.delinks_txt, stanzas)
    print(
        f"{args.region}/{args.module}: "
        f"{'(dry-run) ' if args.dry_run else ''}"
        f"emitted {len(cands)} cluster B true scalar claims",
        file=sys.stderr,
    )
    return 0


def cmd_b_pointers(args: argparse.Namespace) -> int:
    ctx = RegionContext.load(args.region, args.module)
    cands = enumerate_b_pointers(ctx)
    if args.json:
        import json
        print(json.dumps([
            {"addr": f"0x{c.addr:08x}", "name": c.name,
             "pointee": c.pointee_name,
             "pointee_va": f"0x{c.pointee_va:08x}",
             "is_function": c.pointee_is_function,
             "is_thumb": c.pointee_is_thumb}
            for c in cands
        ], indent=2))
        return 0
    if not cands:
        print(
            f"{args.region}/{args.module}: 0 cluster B pointer candidates",
            file=sys.stderr,
        )
        return 0
    stanzas: list[str] = []
    for c in cands:
        body = render_b_pointer(c)
        _path, stanza = write_claim(
            ctx, c.addr, body, ".data", 4, dry_run=args.dry_run,
        )
        stanzas.append(stanza)
    if not args.dry_run:
        append_delinks_stanzas(ctx.paths.delinks_txt, stanzas)
    print(
        f"{args.region}/{args.module}: "
        f"{'(dry-run) ' if args.dry_run else ''}"
        f"emitted {len(cands)} cluster B pointer claims",
        file=sys.stderr,
    )
    return 0


def cmd_d3_chunks(args: argparse.Namespace) -> int:
    # Cluster D-3 cross-region apply is deferred to a follow-up:
    # the existing `cluster_c_pattern3_gen.py` tool handles single
    # chunk emission per-region but the per-region chunk
    # enumeration (which `.rodata` ranges to claim) is the hard
    # part. Brief 170 ships the cluster B path; D-3 lands once
    # the chunk-discovery heuristic is settled (brief 172+).
    print(
        "d3-chunks: not yet implemented — see module docstring "
        "for the deferral rationale + follow-up brief.",
        file=sys.stderr,
    )
    return 2


# --------------------------------------------------------------------------- #
# Brief 184: cluster C / D-1 / D-2 subcommand handlers
# --------------------------------------------------------------------------- #
#
# Each cmd_* function follows the same shape as `cmd_b_scalars`
# (load context → enumerate → emit per candidate → append delinks
# stanzas). The only per-cluster knob is the enumerator + the
# emitter route inside `apply_chunk_candidate`. Per the brief 184
# research note, no changes to `cross_region_chunk_extent.py` are
# needed — its 3-phase algorithm is already cluster-agnostic.


def _run_chunk_subcommand(
    args: argparse.Namespace,
    *,
    label: str,
    enumerate_fn,
) -> int:
    """Shared body for c-strings / d1-tables / d2-tables.

    `enumerate_fn(ctx) -> list[ChunkCandidate]` is the per-cluster
    enumerator; everything else is identical across the three
    subcommands.
    """
    ctx = RegionContext.load(args.region, args.module)
    cands = enumerate_fn(ctx)
    if args.json:
        # JSON preview — list candidates, no apply.
        import json
        print(json.dumps([
            {
                "addr": f"0x{c.addr:08x}",
                "size_bytes": c.size,
                "section": c.section,
                "shape": c.shape,
                "table_entries": [
                    {"pointee": p, "is_thumb": t}
                    for p, t in c.table_entries
                ] if c.table_entries else [],
            }
            for c in cands
        ], indent=2))
        return 0
    if not cands:
        print(
            f"{args.region}/{args.module}: 0 {label} candidates",
            file=sys.stderr,
        )
        return 0

    applied_ranges: list[tuple[str, int, int]] = []
    stanzas: list[str] = []
    applied = 0
    skipped: list[ChunkApplyResult] = []
    # Pre-load the region's full config tree once. Pattern 3
    # generator's cross-symbol resolution needs this for
    # `.word <name>` + `.extern` emission (brief 144). Passing
    # the cached dict avoids re-parsing per candidate.
    modules = load_all(ROOT / "config" / args.region)
    for c in cands:
        result = apply_chunk_candidate(
            ctx, c,
            dry_run=args.dry_run,
            applied_ranges=applied_ranges,
            modules=modules,
        )
        if result.status == "applied":
            assert result.delinks_stanza is not None
            stanzas.append(result.delinks_stanza)
            applied += 1
        else:
            skipped.append(result)
    if not args.dry_run:
        append_delinks_stanzas(ctx.paths.delinks_txt, stanzas)
    prefix = "(dry-run) " if args.dry_run else ""
    print(
        f"{args.region}/{args.module}: "
        f"{prefix}emitted {applied} {label} claim(s) "
        f"({len(skipped)} skipped — needs hand-tuning or "
        f"in-flight overlap)",
        file=sys.stderr,
    )
    if skipped:
        for r in skipped[:5]:
            print(
                f"  skip @ 0x{r.candidate.addr:08x} "
                f"size={r.candidate.size}: {r.status} — {r.error}",
                file=sys.stderr,
            )
        if len(skipped) > 5:
            print(
                f"  ... and {len(skipped) - 5} more skips",
                file=sys.stderr,
            )
    return 0


def cmd_c_strings(args: argparse.Namespace) -> int:
    """Cluster C `.rodata` strings + byte-array constants.
    Emits Pattern 3 `.s` chunks via brief 125's generator.

    Per the brief 184 research note § 3.1: cluster C content is
    region-specific (USA strings differ from JPN strings differ
    from EUR per brief 122), so this command reads the REGION's
    own `.bin` for bytes — no EUR-to-region porting.
    """
    return _run_chunk_subcommand(
        args, label="cluster C string", enumerate_fn=enumerate_c_strings,
    )


def cmd_d1_tables(args: argparse.Namespace) -> int:
    """Cluster D-1 `.data` dispatch / pointer tables.
    Emits a C-source `void *<anchor>[N] = { &t0, &t1, ... }` array
    plus `extern char <t>;` declarations per pointee (brief 124 +
    brief 148 thumb `+1` convention).

    Same-module pointee resolution only (MVP, mirrors b-pointers);
    cross-module pointees defer to decomper hand-claim.
    """
    return _run_chunk_subcommand(
        args, label="cluster D-1 dispatch-table",
        enumerate_fn=enumerate_d1_tables,
    )


def cmd_d2_tables(args: argparse.Namespace) -> int:
    """Cluster D-2 `.data` mixed byte / short / int arrays without
    relocs. Emits Pattern 3 `.s` chunks via brief 125's generator
    with `.data` section.

    Per the brief 184 research note § 3.3: reloc-target resolution
    happens AT EMIT TIME inside `generate_chunk` (not at apply
    time in the enumerator). D-2 arrays by definition have no
    relocs in scope, so the generator's slot-VA → known-symbol
    matching emits `.word <name>` + `.extern` only when a content
    word happens to coincide with a symbol VA. No additional
    plumbing needed — same path D-3 (brief 178) used.
    """
    return _run_chunk_subcommand(
        args, label="cluster D-2 array",
        enumerate_fn=enumerate_d2_arrays,
    )


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog="cross_region_cluster_apply.py",
        description=(
            "Per-region claim regenerator for cluster B / C / D-1 "
            "/ D-2 / D-3 cross-region application. Brief 170 shipped "
            "cluster B (`b-scalars` / `b-pointers`). Brief 184 added "
            "cluster C / D-1 / D-2 (`c-strings` / `d1-tables` / "
            "`d2-tables`) via brief 177's extent adjuster + brief "
            "125's Pattern 3 generator. D-3 stays a stub here; "
            "brief 178 drove D-3 chunks via `cluster_c_pattern3_gen.py` "
            "directly."
        ),
    )
    sub = p.add_subparsers(dest="cmd", required=True)

    def _common(s: argparse.ArgumentParser) -> None:
        s.add_argument(
            "--region", required=True, choices=VALID_REGIONS,
            help="Target region. EUR is supported for symmetry "
                 "but normal use is USA / JPN.",
        )
        s.add_argument(
            "--module", required=True,
            help="Module id: 'main' or 'ovNNN' (e.g. 'ov007').",
        )
        s.add_argument(
            "--dry-run", action="store_true",
            help="Print what would be emitted without writing "
                 "any files or touching delinks.txt.",
        )
        s.add_argument(
            "--json", action="store_true",
            help="Print the enumerated candidates as JSON to "
                 "stdout instead of emitting files. Useful for "
                 "previewing scope before a wave.",
        )

    s = sub.add_parser(
        "b-scalars",
        help="Enumerate + emit cluster B true scalars "
             "(4-byte non-zero, no reloc).",
    )
    _common(s)
    s.set_defaults(func=cmd_b_scalars)

    s = sub.add_parser(
        "b-pointers",
        help="Enumerate + emit cluster B pointers "
             "(4-byte slot with kind:load reloc).",
    )
    _common(s)
    s.set_defaults(func=cmd_b_pointers)

    s = sub.add_parser(
        "d3-chunks",
        help="Cluster D-3 chunks — deferred to brief 172+ "
             "(stub for CLI surface parity).",
    )
    _common(s)
    s.set_defaults(func=cmd_d3_chunks)

    # Brief 184 subcommands.
    s = sub.add_parser(
        "c-strings",
        help="Enumerate + emit cluster C .rodata strings / "
             "byte-array constants (brief 184; Pattern 3 .s).",
    )
    _common(s)
    s.set_defaults(func=cmd_c_strings)

    s = sub.add_parser(
        "d1-tables",
        help="Enumerate + emit cluster D-1 .data dispatch / "
             "pointer tables (brief 184; C-source void *[] array).",
    )
    _common(s)
    s.set_defaults(func=cmd_d1_tables)

    s = sub.add_parser(
        "d2-tables",
        help="Enumerate + emit cluster D-2 .data mixed byte / "
             "short / int arrays without relocs (brief 184; "
             "Pattern 3 .s with `.data` section).",
    )
    _common(s)
    s.set_defaults(func=cmd_d2_tables)

    return p


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    try:
        return args.func(args)
    except FileNotFoundError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
