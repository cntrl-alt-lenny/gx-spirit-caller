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


_SECTION_LINE_RE = re.compile(
    r"\.(\w+)\s+start:0x([0-9a-f]+)\s+end:0x([0-9a-f]+)",
)
_TU_HEADER_RE = re.compile(r"^(\S+):\s*$")
_TU_RANGE_RE = re.compile(
    r"\.(\w+)\s+start:0x([0-9a-f]+)\s+end:0x([0-9a-f]+)",
)


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
    out = DelinksMap()
    if not path.is_file():
        return out
    text = path.read_text(encoding="utf-8")
    lines = text.splitlines()

    # Phase 1: section-map stanza (consecutive indented lines at
    # the file's head, before any TU header).
    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        if not stripped:
            i += 1
            continue
        if not line.startswith(" ") and not line.startswith("\t"):
            break  # first un-indented line ends the section stanza
        m = _SECTION_LINE_RE.match(stripped)
        if m is not None:
            out.sections["." + m.group(1)] = (
                int(m.group(2), 16),
                int(m.group(3), 16),
            )
        i += 1

    # Phase 2: per-TU stanzas. Format:
    #   src/path/to/file.c:
    #       complete
    #       .data start:0xADDR end:0xADDR
    #       ...
    current_tu: str | None = None
    for j in range(i, len(lines)):
        line = lines[j]
        stripped = line.strip()
        if not stripped:
            current_tu = None
            continue
        if not line.startswith(" ") and not line.startswith("\t"):
            m = _TU_HEADER_RE.match(line)
            if m is not None:
                current_tu = m.group(1)
                out.tu_paths.add(current_tu)
            continue
        # Indented line under a TU header — either `complete` or a
        # range line.
        if current_tu is None:
            continue
        rm = _TU_RANGE_RE.match(stripped)
        if rm is None:
            continue
        out.claims.append(ClaimedRange(
            section="." + rm.group(1),
            start=int(rm.group(2), 16),
            end=int(rm.group(3), 16),
        ))
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


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog="cross_region_cluster_apply.py",
        description=(
            "Per-region claim regenerator for cluster B + D-3 "
            "cross-region application (brief 170 — generalises "
            "brief 169's cluster A approach)."
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
