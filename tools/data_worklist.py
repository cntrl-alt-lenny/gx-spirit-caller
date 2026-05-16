#!/usr/bin/env python3

"""
data_worklist.py — rank unmatched data symbols by reference density.

The data tier is still 0% matched (per `progress.py`). Unlike
functions, which `next_targets.py` / `analyze_symbols.py` already
tier and queue, data symbols don't have a clear ordering. Decomping
`data_020b4320` nets nothing if it's referenced from one leaf; the
same byte count on a widely-referenced table unblocks a whole
cluster of callers that read it.

This tool closes that gap:

  1. Loads every `config/<ver>/**/symbols.txt` via `analyze_symbols`.
  2. Builds the load-edge graph (reader function → data symbol).
  3. For each data symbol still in placeholder form (`data_*`):
     - `in_degree_load`: how many distinct reader functions touch it
     - `reader_modules`: how many distinct modules contain readers
       (cross-module density = SDK-like data worth naming first)
     - `size` (deduced from next-symbol address gap if unknown)
     - `section` (`.bss` / `.data` / `.rodata` / module-specific)
     - `shape` (scalar / array / string / fnptr_table / jump_table /
       struct / bss — heuristic via byte-pattern inspection)
     - `matched`: whether the enclosing TU is already `complete`
  4. Ranks unmatched entries by
     (cross-module readers desc, total readers desc, size desc).
  5. Emits a Markdown worklist + stdout summary.

The "cross-module" signal matters: data touched by 5+ overlays is
almost certainly a fundamental SDK table (TEGs, heap state,
framebuffer pointers, …). Names for those generally come from the
NitroSDK headers, so the decomper can batch-rename a wide cluster
in one pass.

Brief 113 (data-tier scoping) identified 5 clusters; the --cluster
flag is shorthand for the appropriate section/size/shape filter
per the brief's taxonomy:

  A  → `.bss` symbol placement (no bytes to match)
  B  → `.data` scalar constants (size ≤ 8)
  C  → `.rodata` strings + const arrays
  D  → `.data` struct arrays + dispatch tables (size ≥ 0x40)
  E  → DTCM/ITCM specials

Usage:

  python tools/data_worklist.py --version eur
  python tools/data_worklist.py --version eur --module main --top 20
  python tools/data_worklist.py --version eur --min-readers 5 --out worklist.md
  python tools/data_worklist.py --version eur --cluster A --top 100
  python tools/data_worklist.py --version eur --section rodata --shape string

Pairs with `tools/nitro_suggest_renames.py` (which suggests names
for function symbols) — this is the data-side companion.
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    CallGraph,
    ModuleData,
    ROOT,
    Symbol,
    build_call_graph,
    load_all,
)
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)


# Placeholder prefix for unnamed data symbols. dsd emits two shapes:
#   data_020b4320         (main / itcm / dtcm)
#   data_ov005_021cabcd   (overlays)
# Both start with `data_`; one `startswith` covers both.
DATA_PLACEHOLDER_PREFIX = "data_"


# --------------------------------------------------------------------------- #
# Section detection — derived from delinks.txt module-section headers.
# --------------------------------------------------------------------------- #

# Canonical section names recognised by the cluster filter. We
# normalise dsd's section names to short tokens so callers can write
# `--section bss` instead of `--section .bss`. The trailing dot is
# stripped at parse time.
SECTION_NORMALIZE = {
    ".text": "text",
    ".init": "text",      # init segments group with code for filtering
    ".rodata": "rodata",
    ".ctor": "rodata",    # ctor tables are read-only
    ".dtor": "rodata",
    ".data": "data",
    ".bss": "bss",
}

# Per-module section tier. ITCM / DTCM map to "itcm" / "dtcm" via
# the module name, since the underlying sections still use the same
# normalized names (.data / .bss) but the cluster taxonomy treats
# them as their own tier.
TCM_MODULE_OVERRIDE = {"itcm", "dtcm"}


@dataclass(frozen=True)
class SectionRange:
    """One section's [start, end) byte range within a module."""
    name: str           # normalized: "text", "rodata", "data", "bss"
    start: int
    end: int

    def contains(self, addr: int) -> bool:
        return self.start <= addr < self.end


@dataclass
class ModuleSections:
    """Section map + binary bytes for one module.

    `binary` is None when the build hasn't run yet (no .bin file on
    disk); shape heuristics fall back to size-only classification.
    `load_addr` is the first section's start, used to translate
    memory addresses to file offsets when reading bytes.
    """
    module: str
    sections: list[SectionRange] = field(default_factory=list)
    binary: bytes | None = None
    load_addr: int = 0

    def section_of(self, addr: int) -> SectionRange | None:
        """Linear scan — module section counts are small (≤5)."""
        for s in self.sections:
            if s.contains(addr):
                return s
        return None

    def bytes_at(self, addr: int, size: int) -> bytes | None:
        """Read `size` bytes starting at memory address `addr`. None
        if the address falls outside the binary's loaded extent
        (e.g., .bss reads — no bytes on disk)."""
        if self.binary is None:
            return None
        offset = addr - self.load_addr
        if offset < 0 or offset + size > len(self.binary):
            return None
        return self.binary[offset:offset + size]


def _module_bin_path(version: str, module: str) -> Path:
    """Where dsd's build step writes the per-module .bin."""
    build_root = ROOT / "build" / version / "build"
    if module == "main":
        return build_root / "arm9.bin"
    if module in ("itcm", "dtcm"):
        return build_root / f"{module}.bin"
    if module.startswith("ov"):
        return build_root / f"arm9_{module}.bin"
    return build_root / f"{module}.bin"


def _parse_section_header(delinks_path: Path) -> list[SectionRange]:
    """Read the leading section map from a delinks.txt file.

    Format (per dsd):
        .text       start:0x... end:0x... kind:code align:32
        .rodata     start:0x...
        ...
        <blank line>
        src/.../foo.c:
            ...

    Stops at the first TU header (`some/path.c:` or `_dsd_gap@...:`)
    or first blank line followed by a non-section line. Returns an
    empty list if the file has no header (compiles but unusual)."""
    if not delinks_path.is_file():
        return []
    sections: list[SectionRange] = []
    with delinks_path.open() as f:
        for raw in f:
            line = raw.strip()
            if not line:
                # Header is followed by a blank line before TUs.
                # Continue past blanks; the next non-section line
                # bails us out.
                continue
            if line.endswith(":") and not line.startswith("."):
                # Hit a TU header — header section is done.
                break
            if not line.startswith("."):
                # Some other non-section content — bail.
                break
            parts = line.split()
            section_name = parts[0]
            try:
                start_tok = next(p for p in parts if p.startswith("start:0x"))
                end_tok   = next(p for p in parts if p.startswith("end:0x"))
                start = int(start_tok.split(":0x", 1)[1], 16)
                end = int(end_tok.split(":0x", 1)[1], 16)
            except (StopIteration, ValueError):
                continue
            normalized = SECTION_NORMALIZE.get(section_name, section_name.lstrip("."))
            sections.append(SectionRange(
                name=normalized, start=start, end=end,
            ))
    return sections


def load_module_sections(
    config_root: Path,
    version: str,
    *,
    load_binaries: bool = True,
) -> dict[str, ModuleSections]:
    """For each module under `config_root`, parse delinks.txt header
    + optionally load the corresponding .bin into memory for shape
    heuristics. `load_binaries=False` skips disk I/O (useful for
    unit tests that only need section ranges)."""
    out: dict[str, ModuleSections] = {}
    delinks_files = list(config_root.rglob("delinks.txt"))
    for delinks_path in delinks_files:
        rel = delinks_path.parent.relative_to(config_root)
        rel_str = str(rel)
        if rel_str == "arm9":
            module = "main"
        elif rel_str.startswith("arm9/overlays/"):
            module = rel_str.split("/", 2)[-1]
        elif rel_str.startswith("arm9/"):
            module = rel_str.split("/", 1)[-1]
        else:
            module = rel_str
        sections = _parse_section_header(delinks_path)
        load_addr = sections[0].start if sections else 0
        binary: bytes | None = None
        if load_binaries:
            bin_path = _module_bin_path(version, module)
            if bin_path.is_file():
                try:
                    binary = bin_path.read_bytes()
                except OSError:
                    binary = None
        out[module] = ModuleSections(
            module=module,
            sections=sections,
            binary=binary,
            load_addr=load_addr,
        )
    return out


def section_for_symbol(
    modsecs_map: dict[str, ModuleSections],
    sym: Symbol,
) -> str:
    """Return the canonical section tier for a data symbol.

    Returns the section name ("bss", "data", "rodata", "text") OR
    "dtcm" / "itcm" for symbols in those special modules (regardless
    of the underlying section). Falls back to "unknown" when no
    section map is available."""
    if sym.module in TCM_MODULE_OVERRIDE:
        return sym.module
    msec = modsecs_map.get(sym.module)
    if msec is None:
        return "unknown"
    rng = msec.section_of(sym.addr)
    if rng is None:
        return "unknown"
    return rng.name


# --------------------------------------------------------------------------- #
# Size deduction — close the 0-size gap for `data(any)` entries.
# --------------------------------------------------------------------------- #

def build_size_table(
    modules: dict[str, ModuleData],
    modsecs_map: dict[str, ModuleSections],
) -> dict[tuple[str, int], int]:
    """Compute (module, addr) → effective size for every data symbol.

    Rules:
      1. If the symbol declares a non-zero size, keep it.
      2. Otherwise, deduce size = next-symbol-addr - this-addr, but
         only if the next symbol is in the same section.
      3. If the symbol is the last in its section, size = section_end
         - this-addr.
      4. If no section info is available, size = 0 (caller decides
         whether to filter)."""
    out: dict[tuple[str, int], int] = {}
    for mod_name, md in modules.items():
        modsecs = modsecs_map.get(mod_name)
        # Sort all symbols (functions + data) by address so the "next
        # symbol" computation is straightforward.
        sorted_syms = sorted(md.symbols, key=lambda s: s.addr)
        for i, sym in enumerate(sorted_syms):
            if sym.type not in ("data", "bss"):
                continue
            if sym.size > 0:
                out[(mod_name, sym.addr)] = sym.size
                continue
            # Deduce from next symbol.
            next_addr = None
            for j in range(i + 1, len(sorted_syms)):
                if sorted_syms[j].addr > sym.addr:
                    next_addr = sorted_syms[j].addr
                    break
            section = modsecs.section_of(sym.addr) if modsecs else None
            if section is None:
                out[(mod_name, sym.addr)] = 0
                continue
            if next_addr is not None and section.contains(next_addr - 1):
                out[(mod_name, sym.addr)] = next_addr - sym.addr
            else:
                # Last in section — size to section end.
                out[(mod_name, sym.addr)] = section.end - sym.addr
    return out


# --------------------------------------------------------------------------- #
# Shape heuristics — classify by byte pattern.
# --------------------------------------------------------------------------- #

# Recognised shape tokens for the --shape filter.
SHAPE_BSS = "bss"
SHAPE_SCALAR = "scalar"
SHAPE_STRING = "string"
SHAPE_FNPTR = "fnptr_table"
SHAPE_JUMP = "jump_table"
SHAPE_ARRAY = "array"
SHAPE_STRUCT = "struct"
SHAPE_UNKNOWN = "unknown"

ALL_SHAPES = (
    SHAPE_BSS, SHAPE_SCALAR, SHAPE_STRING, SHAPE_FNPTR, SHAPE_JUMP,
    SHAPE_ARRAY, SHAPE_STRUCT, SHAPE_UNKNOWN,
)


def _is_printable_string(b: bytes) -> bool:
    """Heuristic: bytes look like a null-terminated ASCII string.

    Requires:
      - at least 4 bytes
      - last byte is null
      - all bytes before the first null are printable ASCII (0x20-0x7e
        plus newline/tab)
      - the printable prefix is at least 50% of the buffer (so we
        don't false-positive on `\\0\\0\\0\\0` blocks)"""
    if len(b) < 4 or b[-1] != 0:
        return False
    printable = 0
    for byte in b:
        if byte == 0:
            break
        if byte == 0x09 or byte == 0x0a or 0x20 <= byte <= 0x7e:
            printable += 1
        else:
            return False
    # Don't allow all-zero pattern to qualify as a string.
    return printable >= max(3, len(b) // 2)


def _is_code_address(addr: int) -> bool:
    """ARM9 game code lives in the 0x02000000-0x02400000 range AND
    the ITCM 0x01ff8000-0x01ff8800 region. DTCM (0x027e0000+) and
    EWRAM/IO ranges are explicitly excluded — DTCM is data-only so
    no function pointer should ever resolve there.

    Function-pointer table heuristic just checks the range; relocs
    cross-checking is left to a future refinement."""
    if 0x01ff8000 <= addr < 0x01ff8800:        # ITCM
        return True
    if 0x027e0000 <= addr < 0x027e8000:        # DTCM — data only
        return False
    return 0x02000000 <= addr < 0x02400000     # ARM9 main + overlays


def _looks_like_fnptr_table(b: bytes, min_entries: int = 4) -> bool:
    """Every 4-byte word is a code address. Requires at least
    `min_entries` aligned words; otherwise too small to distinguish
    from random data."""
    if len(b) < min_entries * 4 or len(b) % 4 != 0:
        return False
    for i in range(0, len(b), 4):
        word = int.from_bytes(b[i:i + 4], "little")
        if not _is_code_address(word):
            return False
    return True


def _looks_like_array(b: bytes, min_size: int = 16) -> bool:
    """Repeating element pattern. Heuristic: pick a stride (2, 4, 8,
    12, 16) and check that the byte sequence repeats at that stride
    with low variance. Returns True if at least one stride matches."""
    if len(b) < min_size:
        return False
    # Quick check: if all bytes are the same, it's a fill array.
    if len(set(b)) == 1:
        return True
    # Stride-based: for each candidate stride, check that bytes at
    # the same offset within each element have low variance.
    for stride in (2, 4, 8, 12, 16, 20, 24):
        if len(b) < stride * 3:  # need ≥3 elements to detect repetition
            continue
        n_elements = len(b) // stride
        # Sample byte at offset 0 across each element. If most are the
        # same, that's the marker of a struct-array (the leading byte
        # is often a fixed type tag or a stable low-bit pattern).
        markers = [b[i * stride] for i in range(n_elements)]
        # If 60%+ of markers are the same byte, looks array-like.
        from collections import Counter
        counts = Counter(markers)
        dominant = counts.most_common(1)[0][1]
        if dominant >= 0.6 * n_elements and n_elements >= 3:
            return True
    return False


def classify_shape(
    sym: Symbol,
    section: str,
    size: int,
    modsecs: ModuleSections | None,
) -> str:
    """Classify a data symbol's shape via byte-pattern heuristics.

    Order of checks:
      1. .bss / unknown section → SHAPE_BSS (no bytes to inspect)
      2. size 0 → SHAPE_UNKNOWN (can't classify without extent)
      3. size 1/2/4 → SHAPE_SCALAR
      4. printable + null-term → SHAPE_STRING
      5. code-pointer pattern → SHAPE_FNPTR (size ≥ 16) or SHAPE_JUMP
         (size 8-15, 2-3 entries)
      6. repeating-element pattern → SHAPE_ARRAY
      7. otherwise → SHAPE_STRUCT (opaque catch-all for >4 byte data)
    """
    if section in ("bss",):
        return SHAPE_BSS
    if size == 0:
        return SHAPE_UNKNOWN
    if size in (1, 2, 4):
        return SHAPE_SCALAR
    if modsecs is None:
        return SHAPE_UNKNOWN
    b = modsecs.bytes_at(sym.addr, size)
    if b is None:
        # No bytes on disk (e.g., .bss but classified to a non-bss
        # section due to header gap) — treat as bss for filtering.
        return SHAPE_BSS
    if _is_printable_string(b):
        return SHAPE_STRING
    if _looks_like_fnptr_table(b, min_entries=4):
        return SHAPE_FNPTR
    # Jump tables: 2-3 code-pointer entries are too small for fnptr
    # but distinctive — same all-code-address check, smaller min.
    if 8 <= size <= 12 and _looks_like_fnptr_table(b, min_entries=2):
        return SHAPE_JUMP
    if _looks_like_array(b):
        return SHAPE_ARRAY
    return SHAPE_STRUCT


# --------------------------------------------------------------------------- #
# Cluster shorthand — brief 113 taxonomy.
# --------------------------------------------------------------------------- #

@dataclass(frozen=True)
class ClusterFilter:
    """Resolved filter parameters for one of brief 113's clusters."""
    sections: frozenset[str]
    shapes: frozenset[str] | None  # None means no shape filter
    size_min: int
    size_max: int | None           # None means no upper bound


# Brief 113's cluster taxonomy resolved into concrete filters.
CLUSTER_FILTERS: dict[str, ClusterFilter] = {
    "A": ClusterFilter(
        sections=frozenset({"bss"}),
        shapes=None,
        size_min=0,
        size_max=None,
    ),
    "B": ClusterFilter(
        sections=frozenset({"data"}),
        shapes=frozenset({SHAPE_SCALAR}),
        size_min=0,
        size_max=8,
    ),
    "C": ClusterFilter(
        sections=frozenset({"rodata"}),
        shapes=None,
        size_min=0,
        size_max=None,
    ),
    "D": ClusterFilter(
        sections=frozenset({"data"}),
        shapes=frozenset({SHAPE_STRUCT, SHAPE_ARRAY, SHAPE_FNPTR, SHAPE_JUMP}),
        size_min=0x40,
        size_max=None,
    ),
    "E": ClusterFilter(
        sections=frozenset({"dtcm", "itcm"}),
        shapes=None,
        size_min=0,
        size_max=None,
    ),
}


def resolve_cluster(cluster: str) -> ClusterFilter:
    """Look up a cluster letter; raises KeyError on unknown."""
    return CLUSTER_FILTERS[cluster.upper()]


# --------------------------------------------------------------------------- #
# Ranking
# --------------------------------------------------------------------------- #

@dataclass
class DataEntry:
    """One ranked data symbol."""

    symbol: Symbol
    reader_count: int                       # distinct reader functions
    reader_modules: frozenset[str]          # distinct reader modules
    matched: bool                           # enclosing TU is `complete`
    section: str = "unknown"                # bss / data / rodata / dtcm / itcm
    effective_size: int = 0                 # deduced if symbol.size is 0
    shape: str = SHAPE_UNKNOWN              # scalar / string / etc.

    @property
    def cross_module_readers(self) -> int:
        return len(self.reader_modules)

    @property
    def sort_key(self) -> tuple[int, int, int]:
        # Primary sort: cross-module density (higher = more fundamental).
        # Secondary: raw reader count. Tertiary: size (prefer knowable
        # extents over 0-size `data(any)`). All descending → negate.
        # Quaternary tiebreak: address (ascending) for determinism.
        return (
            -self.cross_module_readers,
            -self.reader_count,
            -self.effective_size,
        )


def _load_readers_index(
    graph: CallGraph,
) -> dict[tuple[str, int], set[tuple[str, int]]]:
    """Invert `graph.edges_load` to `data_key -> set of reader_keys`.

    `edges_load` stores reader → {data} forward edges; for ranking
    by data-side popularity we need the reverse direction once, so
    this builds and returns a lookup table."""
    by_datum: dict[tuple[str, int], set[tuple[str, int]]] = {}
    for reader, data_keys in graph.edges_load.items():
        for datum in data_keys:
            by_datum.setdefault(datum, set()).add(reader)
    return by_datum


def rank_data_symbols(
    modules: dict[str, ModuleData],
    graph: CallGraph,
    matched: dict[str, list[tuple[int, int]]],
    *,
    include_named: bool = False,
    min_readers: int = 1,
    module_filter: str | None = None,
    modsecs_map: dict[str, ModuleSections] | None = None,
    size_table: dict[tuple[str, int], int] | None = None,
    section_filter: frozenset[str] | None = None,
    shape_filter: frozenset[str] | None = None,
    size_min: int = 0,
    size_max: int | None = None,
) -> list[DataEntry]:
    """Build the ranked DataEntry list.

    By default surfaces only placeholder-named, unmatched data
    symbols with at least `min_readers` reader functions. Pass
    `include_named=True` to also show already-renamed data (useful
    for auditing coverage). `module_filter` restricts to one module.

    v2 (brief 114) additions:
      * `modsecs_map`: per-module section + binary tables. Required
        for section/shape filtering. Skip for tests that only exercise
        the ranking layer.
      * `size_table`: pre-computed (module, addr) → effective_size
        map. If None, size enrichment is skipped (size = symbol.size).
      * `section_filter`: keep only entries whose section is in this
        set. Section names: "bss" / "data" / "rodata" / "text" /
        "dtcm" / "itcm" / "unknown".
      * `shape_filter`: keep only entries whose shape is in this set.
        Shape names are the SHAPE_* constants.
      * `size_min` / `size_max`: byte range filter on effective_size.
    """
    readers_of = _load_readers_index(graph)
    out: list[DataEntry] = []
    for mod_name, md in modules.items():
        if module_filter is not None and mod_name != module_filter:
            continue
        modsecs = modsecs_map.get(mod_name) if modsecs_map else None
        for sym in md.symbols:
            if sym.type not in ("data", "bss"):
                continue
            if not include_named and not sym.name.startswith(
                DATA_PLACEHOLDER_PREFIX,
            ):
                continue
            is_matched = is_addr_matched(matched, sym.module, sym.addr)
            if is_matched:
                # Skip matched unless caller opts in via include_named
                # (which doubles as "show everything"). Matched data
                # isn't in the worklist — it's done.
                continue
            readers = readers_of.get((sym.module, sym.addr), set())
            if len(readers) < min_readers:
                continue
            reader_mods = frozenset(r[0] for r in readers)

            # v2 enrichment.
            section = "unknown"
            effective_size = sym.size
            shape = SHAPE_UNKNOWN
            if modsecs_map is not None:
                section = section_for_symbol(modsecs_map, sym)
            if size_table is not None:
                effective_size = size_table.get(
                    (sym.module, sym.addr), sym.size,
                )
            if modsecs_map is not None:
                shape = classify_shape(sym, section, effective_size, modsecs)

            # v2 filtering.
            if section_filter is not None and section not in section_filter:
                continue
            if shape_filter is not None and shape not in shape_filter:
                continue
            if effective_size < size_min:
                continue
            if size_max is not None and effective_size > size_max:
                continue

            out.append(DataEntry(
                symbol=sym,
                reader_count=len(readers),
                reader_modules=reader_mods,
                matched=is_matched,
                section=section,
                effective_size=effective_size,
                shape=shape,
            ))
    # Sort + secondary tiebreak by address for determinism.
    out.sort(key=lambda e: (e.sort_key, e.symbol.module, e.symbol.addr))
    return out


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def render_markdown(
    entries: list[DataEntry],
    *,
    version: str,
    total_data_symbols: int,
    matched_data_count: int,
    top_n: int | None = None,
    module_filter: str | None = None,
    min_readers: int = 1,
    section_filter: frozenset[str] | None = None,
    shape_filter: frozenset[str] | None = None,
    size_min: int = 0,
    size_max: int | None = None,
    cluster: str | None = None,
) -> str:
    """Render the Markdown worklist. Caller decides the output path."""
    shown = entries if top_n is None else entries[:top_n]

    lines: list[str] = []
    lines.append(f"# Data-symbol worklist — `{version}`")
    lines.append("")
    lines.append(
        "_Ranked by cross-module reader density (higher = more "
        "fundamental; good first-rename candidates). Re-run after "
        "any data-symbol rename or new `dsd apply`._",
    )
    lines.append("")
    filters = []
    if cluster is not None:
        filters.append(f"cluster=`{cluster}`")
    if module_filter is not None:
        filters.append(f"module=`{module_filter}`")
    if section_filter is not None:
        filters.append(f"section=`{','.join(sorted(section_filter))}`")
    if shape_filter is not None:
        filters.append(f"shape=`{','.join(sorted(shape_filter))}`")
    if size_min > 0:
        filters.append(f"size_min={size_min}")
    if size_max is not None:
        filters.append(f"size_max={size_max}")
    filters.append(f"min_readers={min_readers}")
    if top_n is not None:
        filters.append(f"top={top_n}")
    lines.append("**Filters applied:** " + ", ".join(filters))
    lines.append("")
    lines.append(
        f"**Corpus:** {total_data_symbols} total data symbols, of which "
        f"**{matched_data_count} matched** "
        f"({100.0 * matched_data_count / max(total_data_symbols, 1):.2f}%). "
        f"Worklist below shows **{len(entries)} unmatched** "
        f"placeholder-named data symbols with ≥{min_readers} reader(s) "
        f"after filters.",
    )
    lines.append("")

    if not shown:
        lines.append(
            "_No entries match the current filters. Try "
            "`--min-readers 1` or drop `--section` / `--shape`._",
        )
        lines.append("")
        return "\n".join(lines)

    # Cross-module density histogram — handy for estimating how
    # much leverage the top slice actually carries.
    density_bins: dict[int, int] = {}
    for e in entries:
        density_bins[e.cross_module_readers] = (
            density_bins.get(e.cross_module_readers, 0) + 1
        )
    lines.append("## Cross-module reader distribution")
    lines.append("")
    lines.append("| Modules referencing | # data symbols |")
    lines.append("|--------------------:|---------------:|")
    for bucket in sorted(density_bins.keys(), reverse=True):
        lines.append(f"| {bucket} | {density_bins[bucket]} |")
    lines.append("")

    # Section / shape distribution — quick orientation for cluster
    # picking.
    section_bins: dict[str, int] = {}
    shape_bins: dict[str, int] = {}
    total_bytes = 0
    for e in entries:
        section_bins[e.section] = section_bins.get(e.section, 0) + 1
        shape_bins[e.shape] = shape_bins.get(e.shape, 0) + 1
        total_bytes += e.effective_size
    lines.append("## Section + shape distribution")
    lines.append("")
    lines.append("| Section | # symbols | | Shape | # symbols |")
    lines.append("|---------|----------:|---|-------|----------:|")
    sec_rows = sorted(section_bins.items(), key=lambda x: -x[1])
    shape_rows = sorted(shape_bins.items(), key=lambda x: -x[1])
    for i in range(max(len(sec_rows), len(shape_rows))):
        sec = f"`{sec_rows[i][0]}`" if i < len(sec_rows) else ""
        sec_n = str(sec_rows[i][1]) if i < len(sec_rows) else ""
        shp = f"`{shape_rows[i][0]}`" if i < len(shape_rows) else ""
        shp_n = str(shape_rows[i][1]) if i < len(shape_rows) else ""
        lines.append(f"| {sec} | {sec_n} | | {shp} | {shp_n} |")
    lines.append("")
    lines.append(f"**Total bytes in worklist:** {total_bytes:,}")
    lines.append("")

    # The ranked worklist.
    lines.append(
        "## Ranked worklist"
        + (f" (top {top_n})" if top_n is not None and top_n < len(entries)
           else ""),
    )
    lines.append("")
    lines.append(
        "| # | Module | Name | Addr | Section | Size | Shape | "
        "Readers | Cross-mod | Reader modules |"
    )
    lines.append(
        "|--:|--------|------|------|---------|-----:|-------|"
        "--------:|----------:|----------------|"
    )
    for i, e in enumerate(shown, start=1):
        sym = e.symbol
        size_str = f"0x{e.effective_size:x}" if e.effective_size else "_any_"
        # Cap displayed reader modules at 6 to keep rows readable;
        # the count column already carries the full cardinality.
        mods = sorted(e.reader_modules)
        if len(mods) > 6:
            mods_str = ", ".join(mods[:6]) + f", …(+{len(mods) - 6})"
        else:
            mods_str = ", ".join(mods)
        lines.append(
            f"| {i} | `{sym.module}` | `{sym.name}` | "
            f"`0x{sym.addr:08x}` | `{e.section}` | {size_str} | "
            f"`{e.shape}` | {e.reader_count} | "
            f"{e.cross_module_readers} | {mods_str} |",
        )
    lines.append("")

    lines.append(
        "<sub>Rename hint: `python tools/rename_symbol.py <module> "
        "<addr> <NewName>`. Cluster shorthand: `--cluster A` (.bss) "
        "/ `--cluster B` (.data scalars) / `--cluster C` (.rodata) "
        "/ `--cluster D` (.data structs) / `--cluster E` (DTCM/ITCM) "
        "— see [`docs/research/data-tier-scoping.md`](../../docs/research/data-tier-scoping.md).</sub>",
    )
    lines.append("")
    return "\n".join(lines)


def render_stdout_summary(
    entries: list[DataEntry],
    *,
    total_data_symbols: int,
    matched_data_count: int,
    top_n: int,
) -> None:
    matched_pct = 100.0 * matched_data_count / max(total_data_symbols, 1)
    print(
        f"Data symbols: {total_data_symbols} total, "
        f"{matched_data_count} matched ({matched_pct:.2f}%), "
        f"{len(entries)} unmatched w/ readers in worklist.",
    )
    total_bytes = sum(e.effective_size for e in entries)
    print(f"Total worklist bytes: {total_bytes:,}")
    print(f"Top {min(top_n, len(entries))} by cross-module density:")
    for i, e in enumerate(entries[:top_n], start=1):
        sym = e.symbol
        size_str = f"0x{e.effective_size:x}" if e.effective_size else "?"
        print(
            f"  {i:>3}. {sym.module:6s} {sym.name:30s} "
            f"@ 0x{sym.addr:08x}  sec={e.section:7s} size={size_str:>6}  "
            f"shape={e.shape:11s} readers={e.reader_count:3d}  "
            f"xmod={e.cross_module_readers}",
        )


# --------------------------------------------------------------------------- #
# CLI helpers
# --------------------------------------------------------------------------- #

def _parse_csv_filter(raw: str | None, allowed: tuple[str, ...]) -> frozenset[str] | None:
    """Parse a comma-separated filter value. Returns None for "all"
    or None input; otherwise a frozenset of allowed tokens. Raises
    ValueError on unknown tokens (caller surfaces to stderr)."""
    if raw is None or raw == "all":
        return None
    tokens = [t.strip() for t in raw.split(",") if t.strip()]
    if not tokens:
        return None
    invalid = [t for t in tokens if t not in allowed]
    if invalid:
        raise ValueError(
            f"unknown filter value(s): {invalid}. "
            f"Allowed: {', '.join(allowed)}",
        )
    return frozenset(tokens)


SECTION_TOKENS = ("bss", "data", "rodata", "text", "dtcm", "itcm", "unknown")


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Rank unmatched data symbols by reference density.",
    )
    ap.add_argument(
        "--version", default="eur",
        help="Config subdirectory (default: eur).",
    )
    ap.add_argument(
        "--module", default=None,
        help="Restrict to a single module (e.g. main, ov005).",
    )
    ap.add_argument(
        "--min-readers", type=int, default=1,
        help="Skip data symbols with fewer than this many distinct "
             "reader functions (default 1). 1-reader data is usually "
             "a module-local table; cross-module data has at least 2.",
    )
    ap.add_argument(
        "--top", type=int, default=25,
        help="Limit stdout + Markdown to top N entries (default 25). "
             "Pass 0 for no limit.",
    )
    ap.add_argument(
        "--include-named", action="store_true",
        help="Include already-renamed data symbols too. Useful for "
             "auditing data-tier coverage; default is placeholder-"
             "only.",
    )
    ap.add_argument(
        "--out", type=Path, default=None,
        help="Write the Markdown report to this file (default: "
             "build/<ver>/analysis/data_worklist.md).",
    )
    ap.add_argument(
        "--no-outputs", action="store_true",
        help="Skip the Markdown file; stdout summary only.",
    )
    # v2 (brief 114) filters
    ap.add_argument(
        "--section", default=None,
        help="Restrict to sections (csv). One or more of: "
             + ", ".join(SECTION_TOKENS) + ". Default: all sections.",
    )
    ap.add_argument(
        "--shape", default=None,
        help="Restrict to shapes (csv). One or more of: "
             + ", ".join(ALL_SHAPES) + ". Default: all shapes.",
    )
    ap.add_argument(
        "--size-min", type=lambda x: int(x, 0), default=0,
        help="Minimum effective size in bytes (accepts 0x prefix). "
             "Default 0.",
    )
    ap.add_argument(
        "--size-max", type=lambda x: int(x, 0), default=None,
        help="Maximum effective size in bytes (accepts 0x prefix). "
             "Default unlimited.",
    )
    ap.add_argument(
        "--cluster", default=None, choices=list(CLUSTER_FILTERS.keys()),
        help="Brief 113 cluster shorthand. A=.bss / B=.data scalars / "
             "C=.rodata / D=.data structs / E=DTCM+ITCM. Combines "
             "with --section / --shape / --size-min / --size-max but "
             "values from --cluster take precedence on conflict.",
    )
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2

    modules = load_all(config_dir)
    graph = build_call_graph(modules)
    matched = collect_matched_ranges(config_dir)
    modsecs_map = load_module_sections(config_dir, args.version)
    size_table = build_size_table(modules, modsecs_map)

    # Resolve filters — cluster overrides individual flags.
    try:
        section_filter = _parse_csv_filter(args.section, SECTION_TOKENS)
        shape_filter = _parse_csv_filter(args.shape, ALL_SHAPES)
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 2
    size_min = args.size_min
    size_max = args.size_max
    if args.cluster is not None:
        cf = resolve_cluster(args.cluster)
        section_filter = cf.sections
        shape_filter = cf.shapes
        size_min = max(size_min, cf.size_min)
        size_max = cf.size_max if cf.size_max is not None else size_max

    # Global totals for the "N of M matched" header — independent
    # of whatever filters the caller passed. Counts placeholder +
    # named alike so the percentage is honest.
    total_data = 0
    matched_data = 0
    for md in modules.values():
        for sym in md.symbols:
            if sym.type not in ("data", "bss"):
                continue
            total_data += 1
            if is_addr_matched(matched, sym.module, sym.addr):
                matched_data += 1

    entries = rank_data_symbols(
        modules, graph, matched,
        include_named=args.include_named,
        min_readers=args.min_readers,
        module_filter=args.module,
        modsecs_map=modsecs_map,
        size_table=size_table,
        section_filter=section_filter,
        shape_filter=shape_filter,
        size_min=size_min,
        size_max=size_max,
    )

    top_n = None if args.top == 0 else args.top
    render_stdout_summary(
        entries,
        total_data_symbols=total_data,
        matched_data_count=matched_data,
        top_n=args.top if args.top > 0 else max(len(entries), 1),
    )

    if args.no_outputs:
        return 0

    out_path = args.out
    if out_path is None:
        out_dir = ROOT / "build" / args.version / "analysis"
        out_dir.mkdir(parents=True, exist_ok=True)
        out_path = out_dir / "data_worklist.md"
    try:
        out_path.write_text(render_markdown(
            entries,
            version=args.version,
            total_data_symbols=total_data,
            matched_data_count=matched_data,
            top_n=top_n,
            module_filter=args.module,
            min_readers=args.min_readers,
            section_filter=section_filter,
            shape_filter=shape_filter,
            size_min=size_min,
            size_max=size_max,
            cluster=args.cluster,
        ), encoding="utf-8")
    except OSError as e:
        print(f"error: could not write {out_path}: {e}", file=sys.stderr)
        return 1
    print(f"\nWrote {out_path}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
