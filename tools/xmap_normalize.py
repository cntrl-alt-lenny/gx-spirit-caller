#!/usr/bin/env python3
"""
xmap_normalize.py — parse a CodeWarrior/mwldarm `arm9.o.xMAP` linker map into
a stable, deterministic "segment  addr  size  name" dump for layout-avalanche
telemetry (docs/research/speedup-research-swarm-2026-07-03.md, Top-5 #4).

Brief: commit the normalized dump to an orphan `xmap` branch on every green
`ninja rom`, so `git diff` between two commits answers "did this candidate's
size change ripple anywhere, and how far" in one command instead of
re-deriving it from a raw ROM diff each time.

WHY NORMALIZE (the "churn-noise" this strips):

The raw `.xMAP` is a full CodeWarrior linker map. Two sections are out of
scope for layout telemetry and are dropped entirely:
  1. `# Unreferenced symbols:` — always empty in every build sampled
     (6/6: eur/usa/jpn x 2 independent worktrees); if it's ever non-empty
     that's itself notable, so this tool still surfaces it as a warning
     rather than silently discarding it.
  2. `# Link map of Entry` — a `found in local/global <obj>` dependency-
     inclusion trace (~45k lines for EUR alone). This says *why* an object
     was pulled in, not where anything lives; it carries no address/size
     information and is unrelated to this tool's purpose.

The remaining "memory map" section is what's parsed. Within it, each real
symbol is typically represented by 2-4 CONSECUTIVE rows at the SAME address
(confirmed empirically against 6 real xMAP files, eur/usa/jpn x 2 build
trees):

    02000086 00000000 .text   $t          (VBlankIntrWait.o)   <- ARM/Thumb mapping marker, size always 0
    02000086 00000008 .text   .text       (VBlankIntrWait.o)   <- the REAL size lives here, "symbol" is just the section name again
    02000086 00000000 .text   VBlankIntrWait (VBlankIntrWait.o) <- the REAL name lives here, size always 0
    0200008C 00000000 .text   $d          (VBlankIntrWait.o)   <- next mapping marker, own address, size 0

Splitting the real (name, size) pair across two different rows is a
CodeWarrior map-file quirk (per-symbol granularity isn't recorded beyond
"whole object's section contribution"), not noise per se, but it means a
naive line-by-line diff shows spurious churn (the size-bearing row's
"symbol" column literally never changes, being just `.text`/`.data`/`.bss`,
while the real name's row's "size" column is always 0) without ever
surfacing the one number an agent actually wants: this symbol's size, in
one place. This tool groups same-address rows and re-attaches the size to
the real name, so a `git diff` on the output only ever shows lines where an
actual address or size changed for an actual named symbol.

Verified against real per-object AND multi-symbol-per-gap-object data (dsd
sometimes bundles several small `.data`/`.bss` globals into one combined
`_dsd_gap@<module>_<n>.o` placeholder, each at its OWN distinct address with
its OWN directly-recorded size — the grouping-by-address rule handles this
case identically, no special-casing needed).

Gap-filler entries (rows whose only "name" is the literal section name,
i.e. no real symbol claims that address) are kept — a gap's size IS the
layout-avalanche signal ("N bytes of unclaimed padding shifted from X to
Y") — but are relabeled to the stable placeholder `<gap>` rather than the
literal `_dsd_gap@<module>_<counter>.o` object name. The counter suffix is
a sequential id assigned by dsd's own bookkeeping and is liable to shift
whenever ANY earlier gap in the same module merges/splits, even when this
specific gap's own position and size are unchanged — keeping it in the
diffed output would manufacture noise on exactly the kind of build where
nothing here actually moved.

Zero-size groups (pure mapping-symbol markers with no size-bearing sibling
row — e.g. a lone `$d` at a segment's tail, or a genuinely empty leading
gap placeholder) carry no layout information and are dropped.

FORMAT: one line per kept entry, tab-separated:

    <segment>\t<addr (8 hex, no 0x)>\t<size (8 hex, no 0x)>\t<name>

`<segment>` is `arm9` / `itcm` / `dtcm` / `ov000`..`ov023` (the linker's own
own segment order is preserved verbatim — confirmed identical and stable
across all three regions, so no re-sorting is needed or done). Linker
script boundary symbols (`ARM9_TEXT_START`, `OV004_BSS_END`, etc.) are kept
as their own rows with `size` fixed at `00000000` (they mark a single
address, not a span) so a segment's total footprint shift is visible
without cross-referencing a second source.

A one-line-per-segment SUMMARY block (segment, TEXT/RODATA/DATA/BSS byte
totals, computed from the very same START/END boundary markers) is
emitted first, so `git diff` on just the top of the file already answers
"which segment(s) changed size at all" before an agent drills into which
symbol did it.

Usage:
    python tools/xmap_normalize.py build/eur/arm9.o.xMAP
    python tools/xmap_normalize.py eur                       # shorthand for build/eur/arm9.o.xMAP
    python tools/xmap_normalize.py build/eur/arm9.o.xMAP --out build/eur/arm9.xmap.norm
    python tools/xmap_normalize.py eur usa jpn --outdir /tmp/xmap-snapshot

See docs/research/tooling/xmap-normalize.md for the orphan-branch workflow
this feeds into.
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

_SEGMENT_HEADER_RE = re.compile(r"^# \.(\w+)\s*$")
_BOUNDARY_RE = re.compile(
    r"^#>([0-9A-Fa-f]{8})\s+(\S+)\s+\(linker command file\)\s*$"
)
_SYMBOL_ROW_RE = re.compile(
    r"^\s*([0-9A-Fa-f]{8})\s+([0-9A-Fa-f]{8})\s+(\S+)\s+(\S+)\s*\(([^)]*)\)\s*$"
)
_MAPPING_SYMBOL_RE = re.compile(r"^\$[atd]$")

_UNREF_HEADER = "# Unreferenced symbols:"
_LINKMAP_HEADER_RE = re.compile(r"^# Link map of ")


class XMapEntry:
    __slots__ = ("segment", "addr", "size", "name", "is_boundary")

    def __init__(self, segment: str, addr: int, size: int, name: str, is_boundary: bool):
        self.segment = segment
        self.addr = addr
        self.size = size
        self.name = name
        self.is_boundary = is_boundary


def _is_real_name(name: str, section: str) -> bool:
    """True if `name` is an actual symbol name, not a mapping-symbol marker
    (`$a`/`$t`/`$d`) and not just the section name repeated (the CodeWarrior
    "this row carries the size, not a name" convention)."""
    if _MAPPING_SYMBOL_RE.match(name):
        return False
    if name == section:
        return False
    return True


def parse_xmap(text: str) -> tuple[list[str], list[XMapEntry]]:
    """Returns (unreferenced_symbol_names, entries)."""
    lines = text.splitlines()
    i = 0
    n = len(lines)
    unreferenced: list[str] = []
    entries: list[XMapEntry] = []

    # --- "# Unreferenced symbols:" section. Present-but-empty in some
    # builds (EUR), absent entirely in others (USA/JPN start directly with
    # "# Link map of Entry") — confirmed on real files, not hypothetical.
    # Bound the search to before the first "# Link map of " line, since
    # that always precedes the memory map and (when present) always
    # follows the unreferenced-symbols header; an unbounded search would
    # run to end-of-file and never find it when it's genuinely absent,
    # leaving nothing for the segment scan below to find.
    header_idx = None
    for j in range(n):
        if _LINKMAP_HEADER_RE.match(lines[j]):
            break
        if lines[j].strip() == _UNREF_HEADER:
            header_idx = j
            break
    if header_idx is not None:
        i = header_idx + 1
        while i < n and lines[i].strip():
            name = lines[i].strip()
            if name:
                unreferenced.append(name)
            i += 1
    # else: no unreferenced-symbols section in this file; i stays at 0 so
    # the segment scan below starts from the true top of the file.

    # --- skip everything up to (but not including) the memory-map proper:
    # every "# Link map of X" dependency-inclusion block, plus any blank/
    # comment lines between them, until the first real segment header or
    # the first `#>ADDR NAME (linker command file)` boundary line ---
    current_segment = None
    while i < n:
        line = lines[i]
        seg_m = _SEGMENT_HEADER_RE.match(line)
        if seg_m:
            current_segment = seg_m.group(1)
            i += 1
            break
        i += 1

    if current_segment is None:
        # No segment headers found at all — nothing to normalize.
        return unreferenced, entries

    # --- the memory map proper: segment headers, boundary markers, and
    # address-grouped symbol rows, all in file order (already address-
    # ascending within each segment; verified across all 6 sampled files) ---
    pending: list[tuple[int, str, str]] = []
    pending_addr: int | None = None

    def flush():
        nonlocal pending, pending_addr
        if pending_addr is not None:
            entry = _flush_group_impl(pending, pending_addr, current_segment)
            if entry is not None:
                entries.append(entry)
        pending = []
        pending_addr = None

    def _flush_group_impl(rows, addr, segment):
        best_name = None
        best_size = 0
        for size, section, name in rows:
            if size > best_size:
                best_size = size
            if best_name is None and _is_real_name(name, section):
                best_name = name
        if best_size == 0:
            return None
        if best_name is None:
            best_name = "<gap>"
        return XMapEntry(segment, addr, best_size, best_name, is_boundary=False)

    while i < n:
        line = lines[i]
        i += 1

        seg_m = _SEGMENT_HEADER_RE.match(line)
        if seg_m:
            flush()
            current_segment = seg_m.group(1)
            continue

        b_m = _BOUNDARY_RE.match(line)
        if b_m:
            flush()
            addr = int(b_m.group(1), 16)
            entries.append(XMapEntry(current_segment, addr, 0, b_m.group(2), is_boundary=True))
            continue

        s_m = _SYMBOL_ROW_RE.match(line)
        if s_m:
            addr = int(s_m.group(1), 16)
            size = int(s_m.group(2), 16)
            section = s_m.group(3)
            name = s_m.group(4)
            if pending_addr is not None and addr != pending_addr:
                flush()
            pending_addr = addr
            pending.append((size, section, name))
            continue

        # Blank line, stray comment, or a line inside a "Link map of X"
        # block interleaved with the memory map (doesn't happen in the 6
        # sampled files, but a stray non-matching line shouldn't corrupt an
        # in-progress group) — ignore, don't flush.

    flush()
    return unreferenced, entries


def _segment_order(entries: list[XMapEntry]) -> list[str]:
    seen: list[str] = []
    seen_set: set[str] = set()
    for e in entries:
        if e.segment not in seen_set:
            seen_set.add(e.segment)
            seen.append(e.segment)
    return seen


def _segment_summary(entries: list[XMapEntry]) -> list[str]:
    """One line per segment: TEXT/RODATA/DATA/BSS byte span, derived from
    the segment's own START/END boundary markers (present for every
    populated sub-section in every sample seen)."""
    bounds: dict[str, dict[str, int]] = {}
    order = _segment_order(entries)
    for e in entries:
        if not e.is_boundary:
            continue
        m = re.match(r"^[A-Z0-9]+_(TEXT|RODATA|DATA|BSS|CTOR)_(START|END)$", e.name)
        if not m:
            continue
        kind, edge = m.group(1), m.group(2)
        seg_bounds = bounds.setdefault(e.segment, {})
        seg_bounds[f"{kind}_{edge}"] = e.addr

    lines = []
    for seg in order:
        b = bounds.get(seg, {})
        parts = []
        for kind in ("TEXT", "RODATA", "DATA", "BSS"):
            start = b.get(f"{kind}_START")
            end = b.get(f"{kind}_END")
            if start is not None and end is not None:
                parts.append(f"{kind.lower()}={end - start:08x}")
        if parts:
            lines.append(f"# {seg:8s} " + " ".join(parts))
    return lines


def normalize(text: str) -> str:
    unreferenced, entries = parse_xmap(text)
    out: list[str] = []

    if unreferenced:
        out.append(f"# WARNING: {len(unreferenced)} unreferenced symbol(s) — normally 0, investigate:")
        for name in unreferenced:
            out.append(f"#   {name}")
        out.append("#")

    out.append("# segment summary (byte totals from linker-script START/END markers)")
    out.extend(_segment_summary(entries))
    out.append("#")
    out.append("# segment\taddr\tsize\tname")
    for e in entries:
        out.append(f"{e.segment}\t{e.addr:08x}\t{e.size:08x}\t{e.name}")
    out.append("")
    return "\n".join(out)


def _resolve_input(arg: str) -> Path:
    """Accept either a direct path to an .xMAP file, or a bare version
    shorthand (eur/usa/jpn) resolving to build/<version>/arm9.o.xMAP."""
    p = Path(arg)
    if p.suffix.lower() == ".xmap" or p.is_file():
        return p
    return ROOT / "build" / arg / "arm9.o.xMAP"


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description="Normalize a CodeWarrior arm9.o.xMAP into a stable "
                    "segment/addr/size/name dump for layout-avalanche telemetry.",
    )
    ap.add_argument(
        "inputs", nargs="+", metavar="FILE_OR_VERSION",
        help="Path to an .xMAP file, or a bare version (eur/usa/jpn) "
             "resolving to build/<version>/arm9.o.xMAP",
    )
    ap.add_argument("--out", type=Path, default=None,
                     help="Write output here instead of stdout (only valid with one input)")
    ap.add_argument("--outdir", type=Path, default=None,
                     help="Write one <version>.xmap.norm file per input into this directory")
    args = ap.parse_args(argv)

    if args.out and len(args.inputs) != 1:
        print("ERROR: --out only supports a single input; use --outdir for multiple", file=sys.stderr)
        return 2
    if args.out and args.outdir:
        print("ERROR: --out and --outdir are mutually exclusive", file=sys.stderr)
        return 2

    for arg in args.inputs:
        in_path = _resolve_input(arg)
        if not in_path.is_file():
            print(f"ERROR: not found: {in_path}", file=sys.stderr)
            return 2
        text = in_path.read_text(encoding="utf-8", errors="replace")
        normalized = normalize(text)

        if args.out:
            args.out.write_text(normalized, encoding="utf-8")
        elif args.outdir:
            args.outdir.mkdir(parents=True, exist_ok=True)
            out_path = args.outdir / f"{Path(arg).stem or arg}.xmap.norm"
            out_path.write_text(normalized, encoding="utf-8")
            print(f"wrote {out_path}", file=sys.stderr)
        else:
            sys.stdout.write(normalized)

    return 0


if __name__ == "__main__":
    sys.exit(main())
