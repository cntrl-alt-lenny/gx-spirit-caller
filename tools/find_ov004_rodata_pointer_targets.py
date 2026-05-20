#!/usr/bin/env python3
"""
find_ov004_rodata_pointer_targets.py — enumerate ov002 references
into ov004's `.rodata` VA range (brief 159 part 2).

Background — brief 150 / 156 funnel
-----------------------------------

Cloud's brief 150 (PR #576) made the patcher tolerate any veneer
count `n ∈ [0, 86]`. Brief 156 (PR #587) spot-disassembled 8
ov004 `.rodata` MEDIUM candidates and found 6/8 (75%) showed
coherent ARM-code bytes — but with the critical caveat that
**byte coherence ≠ SHA1 safety**: dsd's `lcf` re-emission for
`function(arm, unknown)`-kinded symbols can shift downstream
bytes. The 1 in-cohort SHA1-fail (`0x021e2efc`) is the cohort-
wide warning.

That falsification motivates this tool's "orthogonal-to-byte-
coherence path 2" approach: instead of reclassifying-and-praying
(which path 1 attempted), enumerate the cross-overlay pointer
graph directly. ov002 + ov004 are mutually-exclusive overlays
sharing base VAs (brief 132 / 142 model). When ov002 code loads
a literal whose value falls in the VA range that overlaps
ov004's `.rodata` section, the linker (mwldarm) sees both
modules' definitions of that VA and decides whether to emit an
interwork veneer per brief 132's "(resolved VA, MEMORY-region
membership)" rule.

The ov004 `.rodata` slots that ov002 code references — even via
ov002-local resolves — are the **same VAs** mwldarm considers
for veneer emission. Source-claiming an ov004 slot at a
referenced VA is the empirical n<9 lever brief 141 / 147
observed (each suppressed veneer drops the count by 1).

What this tool reports
----------------------

For every reloc in `config/eur/arm9/overlays/ov002/relocs.txt`
whose target address falls in ov004's `.rodata` VA range
(`[0x021de638, 0x02209a5c)` per brief 154 survey), emit:

- ov002 load site (address + enclosing function from
  ov002/symbols.txt where derivable).
- ov002-resolved target address.
- Reloc kind (`load`, `arm_call`, `thumb_call`, etc.).
- ov004 `.rodata` symbol containing the target VA (nearest
  preceding symbol whose deduced range covers it, from
  ov004/symbols.txt).
- Offset of the load's target within the ov004 symbol.

Output: a sorted Markdown table at
`docs/research/ov004-rodata-pointer-targets.md` (default), or
plain text to stdout via `--format text`. Sort key: ov004 slot
address, then ov002 from address.

Brief 159 part 2 caveat
-----------------------

The brief's premise ("list of (ov002 load site, ov004 .rodata
slot) pairs where ov002 code loads a pointer-to-ov004-rodata")
is literally true only modulo the VA-overlap semantics — at
runtime, ov002 + ov004 are mutually exclusive, so an ov002 load
of `0x021df62c` resolves to ov002's content at that address, not
ov004's. But mwldarm's STATIC link-time analysis sees BOTH
modules' definitions for the shared VA, and that's the
veneer-emission gate.

Empirical question this enumeration answers: **which ov004
`.rodata` slots are statically referenced from ov002 code?**
Those slots are candidates for source-claiming (in ov004's
delinks) to drop the veneer count.

Verification path (not in this tool's scope — decomper brief)
-------------------------------------------------------------

Pick a single slot from this output, claim it as a Pattern 1
`.c` chunk in ov004's source tree, rebuild, observe whether the
ov004 patcher's `spliced N veneers` count drops by exactly 1.
If yes, the lookup correctly identifies veneer triggers and
brief 160+ scales the approach. If no, the brief 132 model
needs refinement (the cross-overlay pointer graph isn't the
right input).

Usage
-----

    # Default — write the canonical Markdown table to
    # docs/research/ov004-rodata-pointer-targets.md.
    python tools/find_ov004_rodata_pointer_targets.py

    # Stdout text instead.
    python tools/find_ov004_rodata_pointer_targets.py \\
        --format text

    # Restrict to a single reloc kind (e.g. only loads).
    python tools/find_ov004_rodata_pointer_targets.py --kind load

Brief 159 part 2 deliverable.
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# ov004's `.rodata` VA range per brief 154 survey + verified
# against `config/eur/arm9/overlays/ov004/delinks.txt`.
OV004_RODATA_START = 0x021DE638
OV004_RODATA_END = 0x02209A5C

# Path to the ov002 relocs table — the brief specifies parsing
# ov002's relocs.txt as the input source.
OV002_RELOCS_PATH = (
    ROOT / "config" / "eur" / "arm9" / "overlays" / "ov002" / "relocs.txt"
)
OV002_SYMBOLS_PATH = (
    ROOT / "config" / "eur" / "arm9" / "overlays" / "ov002" / "symbols.txt"
)
OV004_SYMBOLS_PATH = (
    ROOT / "config" / "eur" / "arm9" / "overlays" / "ov004" / "symbols.txt"
)

DEFAULT_OUTPUT = (
    ROOT / "docs" / "research" / "ov004-rodata-pointer-targets.md"
)


_RELOC_RE = re.compile(
    r"^from:0x([0-9a-fA-F]+)\s+kind:(\w+)\s+to:0x([0-9a-fA-F]+)\s+module:(\S+)"
)

# Match function entries with explicit size:
#   func_ov002_021aa4a0 kind:function(arm,size=0xb8) addr:0x021aa4a0
_FUNC_RE = re.compile(
    r"^(\S+)\s+kind:function\([^,]+,size=0x([0-9a-fA-F]+)[^)]*\)\s+addr:0x([0-9a-fA-F]+)"
)

# Match data / bss entries (no embedded size — size is deduced from
# the next symbol's address). Both shapes appear in the wild:
#   data_X kind:data(any) addr:0x...
#   data_X kind:bss       addr:0x...           (no parens)
# Hence the optional `(...)` clause.
_DATA_RE = re.compile(
    r"^(\S+)\s+kind:(?:data|bss)(?:\([^)]*\))?\s+addr:0x([0-9a-fA-F]+)"
)


@dataclass(frozen=True)
class FunctionSymbol:
    name: str
    addr: int
    size: int  # 0 if unknown

    @property
    def end(self) -> int:
        return self.addr + self.size

    def contains(self, va: int) -> bool:
        if self.size == 0:
            return False  # unknown-size functions can't be containment-checked
        return self.addr <= va < self.end


@dataclass(frozen=True)
class DataSymbol:
    name: str
    addr: int


@dataclass(frozen=True)
class Reloc:
    from_va: int
    kind: str
    to_va: int
    target_module: str


def _parse_relocs(path: Path) -> list[Reloc]:
    """Read every reloc entry in `path`. Skips comments and blanks
    silently (real-world relocs.txt has neither, but defensive)."""
    out: list[Reloc] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        m = _RELOC_RE.match(line.strip())
        if not m:
            continue
        out.append(Reloc(
            from_va=int(m.group(1), 16),
            kind=m.group(2),
            to_va=int(m.group(3), 16),
            target_module=m.group(4),
        ))
    return out


def _parse_functions(path: Path) -> list[FunctionSymbol]:
    """Read function-kind symbols with explicit size. Returns
    address-sorted list. Functions with unknown size (no
    `size=0x...` token) are skipped — they can't be used for
    contained-VA lookup."""
    out: list[FunctionSymbol] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        m = _FUNC_RE.match(line.strip())
        if not m:
            continue
        out.append(FunctionSymbol(
            name=m.group(1),
            addr=int(m.group(3), 16),
            size=int(m.group(2), 16),
        ))
    out.sort(key=lambda f: f.addr)
    return out


def _parse_data_symbols(
    path: Path,
    addr_lo: int,
    addr_hi: int,
) -> list[DataSymbol]:
    """Read data/bss symbols in the [addr_lo, addr_hi) range.
    Returns address-sorted list."""
    out: list[DataSymbol] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        m = _DATA_RE.match(line.strip())
        if not m:
            continue
        addr = int(m.group(2), 16)
        if addr_lo <= addr < addr_hi:
            out.append(DataSymbol(name=m.group(1), addr=addr))
    out.sort(key=lambda s: s.addr)
    return out


def find_enclosing_function(
    va: int,
    sorted_funcs: list[FunctionSymbol],
) -> FunctionSymbol | None:
    """Return the function whose [addr, addr+size) range contains
    `va`. Uses a linear scan (~few thousand functions; fast enough
    for one-shot CLI usage). Returns None if no function contains
    the VA (or all candidates have unknown size)."""
    # Binary-search-like: find the largest addr <= va, then verify.
    # Cheap linear scan is fine here.
    candidate: FunctionSymbol | None = None
    for f in sorted_funcs:
        if f.addr > va:
            break
        if f.contains(va):
            candidate = f
    return candidate


def find_containing_data_symbol(
    va: int,
    sorted_data: list[DataSymbol],
    range_end: int,
) -> tuple[DataSymbol, int] | None:
    """Return `(symbol, offset_into_symbol)` for the data symbol
    whose [addr, next_addr) range covers `va`. `range_end` is the
    upper bound of the section; the last symbol's range extends to
    `range_end`. Returns None if no symbol's range covers va (i.e.,
    va is before the first symbol)."""
    if not sorted_data or va < sorted_data[0].addr:
        return None
    for i, sym in enumerate(sorted_data):
        next_addr = (
            sorted_data[i + 1].addr if i + 1 < len(sorted_data) else range_end
        )
        if sym.addr <= va < next_addr:
            return (sym, va - sym.addr)
    return None


@dataclass(frozen=True)
class PointerTargetRow:
    from_va: int
    from_func: str           # "(none)" if not derivable
    kind: str
    to_va: int
    ov004_sym_name: str      # "(none)" if no covering data symbol
    ov004_sym_addr: int      # 0 if (none)
    offset_into_sym: int     # 0 if (none) or exact match

    @property
    def sort_key(self):
        # Group by ov004 slot, then ov002 caller.
        return (self.ov004_sym_addr, self.to_va, self.from_va)


def enumerate_pointer_targets(
    *,
    kind_filter: set[str] | None = None,
    relocs_path: Path = OV002_RELOCS_PATH,
    ov002_symbols_path: Path = OV002_SYMBOLS_PATH,
    ov004_symbols_path: Path = OV004_SYMBOLS_PATH,
    rodata_start: int = OV004_RODATA_START,
    rodata_end: int = OV004_RODATA_END,
) -> list[PointerTargetRow]:
    """The reverse-lookup core. Exposed (vs. baked into `main`) so
    tests can pin behaviour without re-parsing on-disk config every
    time."""
    relocs = _parse_relocs(relocs_path)
    funcs = _parse_functions(ov002_symbols_path)
    data_syms = _parse_data_symbols(
        ov004_symbols_path, rodata_start, rodata_end,
    )

    rows: list[PointerTargetRow] = []
    for r in relocs:
        if not (rodata_start <= r.to_va < rodata_end):
            continue
        if kind_filter is not None and r.kind not in kind_filter:
            continue
        enclosing = find_enclosing_function(r.from_va, funcs)
        covering = find_containing_data_symbol(
            r.to_va, data_syms, rodata_end,
        )
        if covering is None:
            sym_name, sym_addr, offset = "(none)", 0, 0
        else:
            sym, offset = covering
            sym_name, sym_addr = sym.name, sym.addr
        rows.append(PointerTargetRow(
            from_va=r.from_va,
            from_func=enclosing.name if enclosing else "(unknown)",
            kind=r.kind,
            to_va=r.to_va,
            ov004_sym_name=sym_name,
            ov004_sym_addr=sym_addr,
            offset_into_sym=offset,
        ))
    rows.sort(key=lambda r: r.sort_key)
    return rows


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def render_summary(rows: list[PointerTargetRow]) -> str:
    """Group + tally rows for the table preamble."""
    from collections import Counter

    by_kind = Counter(r.kind for r in rows)
    by_slot = Counter(r.ov004_sym_name for r in rows)
    distinct_slots = sum(
        1 for name in by_slot if name != "(none)"
    )
    none_count = by_slot.get("(none)", 0)

    lines = [
        "## Summary",
        "",
        f"- **Total cross-overlay references:** {len(rows)}",
        f"- **Distinct ov004 `.rodata` slots referenced:** "
        f"{distinct_slots}",
    ]
    if none_count > 0:
        lines.append(
            f"- **Refs that don't land on a named ov004 symbol:** "
            f"{none_count} (in unnamed gap-file regions; mwldarm "
            f"sees them at link time as bytes in `.rodata`, not as "
            f"distinct symbols)"
        )
    lines.append("")
    lines.append("### By reloc kind")
    lines.append("")
    lines.append("| Kind | Count |")
    lines.append("|---|---:|")
    for k, c in sorted(by_kind.items()):
        lines.append(f"| `{k}` | {c} |")
    lines.append("")
    lines.append("### Top 10 most-referenced ov004 slots")
    lines.append("")
    lines.append("| ov004 slot | Refs |")
    lines.append("|---|---:|")
    for name, c in by_slot.most_common(10):
        if name == "(none)":
            continue
        lines.append(f"| `{name}` | {c} |")
    lines.append("")
    return "\n".join(lines)


def render_markdown(rows: list[PointerTargetRow]) -> str:
    """Render the full report as Markdown."""
    header = (
        "# ov004 `.rodata` pointer-target enumeration\n"
        "\n"
        "**Brief:** 159 part 2 (cloud autonomous research).\n"
        "**Generator:** `tools/find_ov004_rodata_pointer_targets.py`.\n"
        "**Input:** "
        "`config/eur/arm9/overlays/ov002/relocs.txt` (relocs sourced "
        "from ov002's binary) + `ov002/symbols.txt` (function "
        "containment) + `ov004/symbols.txt` (data slot resolution).\n"
        "**Scope:** every ov002 reloc whose target address falls in "
        "ov004's `.rodata` VA range "
        f"`[0x{OV004_RODATA_START:08x}, 0x{OV004_RODATA_END:08x})` "
        "per brief 154's `.rodata` boundary derivation.\n"
        "\n"
    )
    interpretation = (
        "\n"
        "## Interpretation\n"
        "\n"
        "ov002 + ov004 are mutually-exclusive overlays sharing base\n"
        "VAs (brief 132 / 142 model). At runtime an ov002 load of\n"
        "address X resolves to ov002's content at X; ov004's content\n"
        "at the same X is only visible when ov004 is loaded instead.\n"
        "But mwldarm's link-time static analysis sees BOTH modules'\n"
        "definitions for the shared VA, and that's the gate for\n"
        "interwork-veneer emission (brief 132 falsification).\n"
        "\n"
        "Each row below identifies an ov002 instruction whose\n"
        "operand resolves to an address in the VA range that\n"
        "overlaps ov004's `.rodata`. Source-claiming the targeted\n"
        "ov004 slot (the right-hand column) in ov004's source tree\n"
        "is the empirical n<9 lever brief 141 / 147 observed: each\n"
        "suppressed veneer drops the patcher's `spliced N veneers`\n"
        "count by exactly 1.\n"
        "\n"
        "The verification path — pick one slot, claim it, rebuild,\n"
        "observe the veneer count — is decomper-owned per brief\n"
        "158+ scope (the tool runs in cloud; the worked-example\n"
        "claim runs in a follow-up decomper brief).\n"
        "\n"
    )
    table_header = (
        "## Full enumeration\n"
        "\n"
        "Sorted by ov004 slot address, then by ov002 from-address.\n"
        "\n"
        "| ov002 from | ov002 enclosing function | kind | to (= ov004 VA) | ov004 .rodata slot | offset |\n"
        "|---|---|---|---|---|---:|\n"
    )
    body_lines = []
    for r in rows:
        offset_str = f"+0x{r.offset_into_sym:x}" if r.offset_into_sym else ""
        body_lines.append(
            f"| `0x{r.from_va:08x}` "
            f"| `{r.from_func}` "
            f"| `{r.kind}` "
            f"| `0x{r.to_va:08x}` "
            f"| `{r.ov004_sym_name}` "
            f"| {offset_str} |"
        )
    body = "\n".join(body_lines)
    return (
        header
        + render_summary(rows)
        + interpretation
        + table_header
        + body
        + "\n"
    )


def render_text(rows: list[PointerTargetRow]) -> str:
    """Plain-text rendering for stdout / piping."""
    lines = [
        f"# ov004 .rodata pointer targets — {len(rows)} refs",
        "#",
        "#  from_va   from_function                kind          "
        "to_va     ov004_slot                              offset",
    ]
    for r in rows:
        offset_str = f"+0x{r.offset_into_sym:x}" if r.offset_into_sym else "-"
        lines.append(
            f"  0x{r.from_va:08x} "
            f"{r.from_func:30s} "
            f"{r.kind:12s} "
            f"0x{r.to_va:08x} "
            f"{r.ov004_sym_name:40s} "
            f"{offset_str}"
        )
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=__doc__.split("\n\n", 1)[0],
    )
    ap.add_argument(
        "--format",
        choices=("markdown", "text"),
        default="markdown",
        help="markdown (default — writes to --out) or text "
             "(stdout). Markdown is the canonical research-note "
             "format; text is for ad-hoc CLI inspection or piping "
             "through grep / awk.",
    )
    ap.add_argument(
        "--out", type=Path, default=DEFAULT_OUTPUT,
        help=f"Output path for markdown format (default: "
             f"{DEFAULT_OUTPUT.relative_to(ROOT)}). Ignored for "
             f"--format text.",
    )
    ap.add_argument(
        "--kind", default=None,
        help="Filter to a comma-separated set of reloc kinds (e.g. "
             "`load,arm_call`). Default: include all kinds.",
    )
    ap.add_argument(
        "--rodata-start", type=lambda s: int(s, 0),
        default=OV004_RODATA_START,
        help=f"Override ov004 .rodata start VA "
             f"(default: 0x{OV004_RODATA_START:08x}).",
    )
    ap.add_argument(
        "--rodata-end", type=lambda s: int(s, 0),
        default=OV004_RODATA_END,
        help=f"Override ov004 .rodata end VA "
             f"(default: 0x{OV004_RODATA_END:08x}).",
    )
    args = ap.parse_args(argv)

    kind_filter: set[str] | None = None
    if args.kind:
        kind_filter = {k.strip() for k in args.kind.split(",") if k.strip()}

    try:
        rows = enumerate_pointer_targets(
            kind_filter=kind_filter,
            rodata_start=args.rodata_start,
            rodata_end=args.rodata_end,
        )
    except OSError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    if args.format == "markdown":
        text = render_markdown(rows)
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(text, encoding="utf-8")
        print(
            f"wrote {args.out.relative_to(ROOT)} "
            f"({len(rows)} rows)",
            file=sys.stderr,
        )
    else:
        print(render_text(rows))

    return 0


if __name__ == "__main__":
    sys.exit(main())
