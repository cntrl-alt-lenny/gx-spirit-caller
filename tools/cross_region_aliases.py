#!/usr/bin/env python3
"""Derive the cross-region data-symbol alias block-list.

The fallback data resolver assumes that an EUR address has the same meaning
in USA/JPN.  This tool finds the narrower, dangerous case: a data/bss symbol
with the same name and absolute address in all three symbol tables while the
USA and JPN addresses are still backed by raw ``.bss`` sections.  The raw
section and nearest-symbol-size tests are the same comparison used by the
cross-region aliasing audit; the final symbol's lower-bound size ends at the
module's ``.bss`` boundary.  The EUR side may already be C-backed because the
future risk is a newly ported EUR consumer resolving against the target's
wrong object.

Usage / exit codes:

    python tools/cross_region_aliases.py --write  # regenerate JSON
    python tools/cross_region_aliases.py --check  # refuse stale JSON

``--write`` exits 0 after writing the generated file. ``--check`` exits 0
when the committed file is current and 1 when it is stale or malformed.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import parse_symbols_file  # noqa: E402
from progress import parse_delinks_file  # noqa: E402


ROOT = Path(__file__).resolve().parent.parent
BLOCKLIST_PATH = Path(__file__).resolve().with_name("cross_region_aliases.json")
REGIONS = ("eur", "usa", "jpn")
DATA_KINDS = frozenset(("data", "bss"))
OVERLAY_RE = re.compile(r"ov\d{3}\Z")


def _symbols_path(root: Path, region: str, module: str) -> Path:
    arm9 = root / "config" / region / "arm9"
    return arm9 / "symbols.txt" if module == "main" else arm9 / "overlays" / module / "symbols.txt"


def _modules(root: Path) -> list[str]:
    overlays = root / "config" / "eur" / "arm9" / "overlays"
    names = [
        path.name for path in overlays.iterdir()
        if path.is_dir() and OVERLAY_RE.fullmatch(path.name)
    ] if overlays.is_dir() else []
    return ["main", *sorted(names)]


def _raw_data_ranges(delinks_path: Path) -> list[tuple[int, int]]:
    """Return data/bss ranges belonging to raw ``.s`` translation units."""

    _module_sections, tus = parse_delinks_file(delinks_path)
    ranges: list[tuple[int, int]] = []
    for tu in tus:
        if not tu["source"].endswith(".s"):
            continue
        ranges.extend(
            (start, end)
            for kind, start, end in tu["sections"]
            if kind in (".data", ".bss")
        )
    return ranges


def _backed(address: int, ranges: list[tuple[int, int]]) -> bool:
    return any(start <= address < end for start, end in ranges)


def _next_symbol_gaps(symbols: list, section_end: int) -> dict[int, int]:
    """Return the audit's lower-bound size, ending at the section boundary."""

    addresses = sorted({symbol.addr for symbol in symbols})
    return {
        address: (
            addresses[index + 1] - address
            if index + 1 < len(addresses) else section_end - address
        )
        for index, address in enumerate(addresses)
    }


def derive_aliases(root: Path = ROOT) -> list[dict[str, object]]:
    """Derive all maintained block-list rows from committed region data."""

    rows: list[dict[str, object]] = []
    for module in _modules(root):
        symbols = {
            region: parse_symbols_file(_symbols_path(root, region, module), module)
            for region in REGIONS
        }
        gaps = {}
        for region in REGIONS:
            module_sections, _tus = parse_delinks_file(
                _symbols_path(root, region, module).with_name("delinks.txt")
            )
            bss_ends = [end for kind, _start, end in module_sections if kind == ".bss"]
            gaps[region] = _next_symbol_gaps(symbols[region], max(bss_ends, default=0))
        by_key = {
            region: {
                (symbol.name, symbol.addr): symbol
                for symbol in entries
                if symbol.type in DATA_KINDS
            }
            for region, entries in symbols.items()
        }
        raw_ranges = {
            region: _raw_data_ranges(_symbols_path(root, region, module).with_name("delinks.txt"))
            for region in ("usa", "jpn")
        }
        for name, address in sorted(
            set(by_key["eur"]) & set(by_key["usa"]) & set(by_key["jpn"]),
            key=lambda item: (item[1], item[0]),
        ):
            if not all(_backed(address, raw_ranges[region]) for region in ("usa", "jpn")):
                continue
            if any(
                by_key[region][(name, address)].type != "bss"
                for region in ("usa", "jpn")
            ):
                continue
            same_shape = all(
                (
                    by_key[region][(name, address)].type,
                    gaps[region][address],
                ) == (
                    by_key["eur"][(name, address)].type,
                    gaps["eur"][address],
                )
                for region in ("usa", "jpn")
            )
            if same_shape:
                continue
            rows.append({
                "module": module,
                "name": name,
                "addr": f"0x{address:08x}",
                "eur_kind": by_key["eur"][(name, address)].type,
                "usa_kind": by_key["usa"][(name, address)].type,
                "jpn_kind": by_key["jpn"][(name, address)].type,
            })
    return rows


def render(rows: list[dict[str, object]]) -> str:
    return json.dumps(rows, indent=2) + "\n"


def load_entries(path: Path = BLOCKLIST_PATH) -> list[dict[str, object]]:
    with path.open(encoding="utf-8") as handle:
        rows = json.load(handle)
    if not isinstance(rows, list) or not all(isinstance(row, dict) for row in rows):
        raise ValueError(f"{path} is not a list of alias rows")
    return rows


def load_blocklist(path: Path = BLOCKLIST_PATH) -> frozenset[tuple[str, int]]:
    return frozenset(
        (str(row["module"]), int(str(row["addr"]), 16))
        for row in load_entries(path)
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true", help="write the generated JSON")
    mode.add_argument("--check", action="store_true", help="fail if generated JSON is stale")
    args = parser.parse_args(argv)
    rows = derive_aliases()
    expected = render(rows)

    if args.write:
        BLOCKLIST_PATH.write_text(expected, encoding="utf-8")
        print(f"wrote {BLOCKLIST_PATH.relative_to(ROOT)} ({len(rows)} rows)")
        return 0
    if args.check:
        actual = BLOCKLIST_PATH.read_text(encoding="utf-8") if BLOCKLIST_PATH.is_file() else ""
        if actual != expected:
            print(f"error: {BLOCKLIST_PATH.relative_to(ROOT)} is stale; run with --write", file=sys.stderr)
            return 1
        print(f"{BLOCKLIST_PATH.relative_to(ROOT)} is current ({len(load_entries())} rows)")
        return 0
    print(expected, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
