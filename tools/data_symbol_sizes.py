#!/usr/bin/env python3

"""
data_symbol_sizes.py — infer extents for `data_*` symbols.

`dsd init` labels data entries with `kind:data(any)` and no size field,
because it can't tell a 4-byte int from a 0x400-byte table without
touching the ROM bytes. This tool infers each data symbol's size as
the byte gap between it and the next symbol in the same module (by
address). Not exact, but good enough to tell a decomper:

  - "this is a 4-byte int / pointer" (size inferred ~ 4-8 B)
  - "this is probably a struct" (size inferred 0x10..0x80 B)
  - "this is a lookup table" (size inferred > 0x100 B)

Which is invaluable context when a function reads from a data pointer
and you're trying to guess whether to model it as a scalar, struct,
or table.

Outputs:
  - stdout: total data-symbol count, size histogram, per-module bytes
  - build/<ver>/analysis/data_sizes.json: lookup by '<module>|0x<addr>'
  - build/<ver>/analysis/data_sizes.md: per-module top-20 largest blobs

Usage:
    python tools/data_symbol_sizes.py --version eur
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    FAILING_MODULES,
    ROOT,
    Symbol,
    discover_modules,
    parse_symbols_file,
)


def module_symbols_path(config_root: Path, module: str) -> Path:
    arm9 = config_root / "arm9"
    if module == "main":
        return arm9 / "symbols.txt"
    if module in ("itcm", "dtcm"):
        return arm9 / module / "symbols.txt"
    return arm9 / "overlays" / module / "symbols.txt"


def infer_per_module(symbols: list[Symbol]) -> dict[int, int | None]:
    """For every data symbol in `symbols` (must be from a single module),
    return {addr: inferred_size_bytes or None}. Size is the gap to the
    next symbol at a strictly-higher address; None for the last symbol
    in the module (no next anchor)."""
    if not symbols:
        return {}
    # Sort ascending by addr; keep duplicates (rare but possible) stable.
    sorted_syms = sorted(symbols, key=lambda s: s.addr)
    out: dict[int, int | None] = {}
    for i, s in enumerate(sorted_syms):
        if s.type != "data":
            continue
        # Find the next symbol with a strictly-greater address.
        next_addr: int | None = None
        for j in range(i + 1, len(sorted_syms)):
            if sorted_syms[j].addr > s.addr:
                next_addr = sorted_syms[j].addr
                break
        if next_addr is None:
            out[s.addr] = None
        else:
            out[s.addr] = next_addr - s.addr
    return out


def size_bucket(n: int) -> str:
    """Human-readable bucket for histogram rollup."""
    if n <= 4:
        return "<=4 B"
    if n <= 8:
        return "5–8 B"
    if n <= 0x20:
        return "9–32 B"
    if n <= 0x80:
        return "33–128 B"
    if n <= 0x400:
        return "129–1024 B"
    if n <= 0x4000:
        return "1–16 KB"
    return ">16 KB"


BUCKET_ORDER = [
    "<=4 B",
    "5–8 B",
    "9–32 B",
    "33–128 B",
    "129–1024 B",
    "1–16 KB",
    ">16 KB",
]


def print_summary(per_module: dict[str, dict[int, int | None]]) -> None:
    total = 0
    unknown = 0
    inferred_bytes = 0
    bucket_counts: Counter[str] = Counter()
    per_module_totals: dict[str, int] = {}

    for module, sizes in per_module.items():
        module_bytes = 0
        for addr, size in sizes.items():
            total += 1
            if size is None:
                unknown += 1
                continue
            inferred_bytes += size
            module_bytes += size
            bucket_counts[size_bucket(size)] += 1
        per_module_totals[module] = module_bytes

    print(f"Data symbols        : {total}")
    print(f"  size inferred     : {total - unknown}")
    print(f"  size unknown      : {unknown}  (last symbol in a module)")
    print(f"Total inferred bytes: {inferred_bytes:,}")
    print()

    print("Size distribution (inferred):")
    for bucket in BUCKET_ORDER:
        count = bucket_counts.get(bucket, 0)
        if count == 0:
            continue
        print(f"  {bucket:<12s} {count:>6d}")
    print()

    print("Top 10 modules by inferred data bytes:")
    top = sorted(per_module_totals.items(), key=lambda kv: -kv[1])[:10]
    for module, module_bytes in top:
        mark = " [FAIL]" if module in FAILING_MODULES else ""
        print(f"  {module:<6s}{mark}  {module_bytes:>12,} bytes  "
              f"({len(per_module[module])} symbols)")


def write_json(
    path: Path,
    per_module: dict[str, dict[int, int | None]],
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload: dict[str, int | None] = {}
    for module, sizes in per_module.items():
        for addr, size in sizes.items():
            key = f"{module}|0x{addr:08x}"
            payload[key] = size
    with path.open("w") as f:
        json.dump(payload, f, indent=2)


def write_md(
    path: Path,
    per_module: dict[str, dict[int, int | None]],
    symbols_by_module: dict[str, list[Symbol]],
    top_per_module: int = 20,
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)

    lines: list[str] = []
    lines.append("# Data symbol sizes (inferred)")
    lines.append("")
    lines.append(
        "Each `data_*` symbol's size is inferred as the gap in bytes "
        "to the next symbol at a higher address in the same module. "
        "The last symbol in a module has no upper anchor, so its size "
        "shows as `?`."
    )
    lines.append("")
    lines.append(
        "Regenerate with `python tools/data_symbol_sizes.py --version "
        "<ver>`. Lookup JSON lives in the same directory as "
        "`data_sizes.json`."
    )
    lines.append("")

    for module in sorted(per_module.keys()):
        sizes = per_module[module]
        if not sizes:
            continue
        # Rank by inferred size, unknowns last.
        by_addr = {s.addr: s for s in symbols_by_module[module]}
        rows = [
            (addr, size, by_addr.get(addr))
            for addr, size in sizes.items()
            if by_addr.get(addr) is not None
        ]
        rows.sort(key=lambda r: (r[1] is None, -(r[1] or 0)))
        shown = rows[:top_per_module]

        total = sum((s or 0) for _, s, _ in rows)
        fail_mark = " **FAIL**" if module in FAILING_MODULES else ""
        lines.append(
            f"## {module}{fail_mark}  ({len(rows)} data symbols, "
            f"{total:,} inferred bytes — showing top {len(shown)})"
        )
        lines.append("")
        lines.append("| Name | Address | Inferred size |")
        lines.append("|------|---------|--------------:|")
        for addr, size, sym in shown:
            size_s = "`?`" if size is None else f"`0x{size:x}` ({size} B)"
            lines.append(f"| `{sym.name}` | `0x{addr:08x}` | {size_s} |")
        lines.append("")

    with path.open("w") as f:
        f.write("\n".join(lines))


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Infer data_* symbol sizes by gap-to-next-symbol"
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument("--no-outputs", action="store_true")
    ap.add_argument("--top-per-module", type=int, default=20)
    args = ap.parse_args()

    config_root = ROOT / "config" / args.version
    out_dir = ROOT / "build" / args.version / "analysis"

    modules = discover_modules(config_root)
    per_module: dict[str, dict[int, int | None]] = {}
    symbols_by_module: dict[str, list[Symbol]] = {}
    for m in modules:
        syms = parse_symbols_file(module_symbols_path(config_root, m), m)
        symbols_by_module[m] = syms
        per_module[m] = infer_per_module(syms)

    print_summary(per_module)

    if not args.no_outputs:
        write_json(out_dir / "data_sizes.json", per_module)
        write_md(
            out_dir / "data_sizes.md",
            per_module,
            symbols_by_module,
            top_per_module=args.top_per_module,
        )
        print(
            f"\nWrote {out_dir}/data_sizes.json and {out_dir}/data_sizes.md",
            file=sys.stderr,
        )

    return 0


if __name__ == "__main__":
    sys.exit(main())
