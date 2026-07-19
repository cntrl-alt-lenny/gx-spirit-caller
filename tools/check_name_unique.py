#!/usr/bin/env python3
"""Check that a proposed config symbol name is unique in one region.

The linker sees the ARM9 main symbols and every overlay symbol table as one
namespace.  This deliberately reads the committed symbol tables directly so
it can be used before a rename, without a build or toolchain.
"""

from __future__ import annotations

import argparse
import re
import sys
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CONFIG = ROOT / "config"
ADDR_RE = re.compile(r"\baddr:(0x[0-9a-fA-F]+)")


@dataclass(frozen=True)
class NameCheck:
    name: str
    proposed: int
    existing: tuple[int, ...]

    @property
    def collision(self) -> bool:
        return any(address != self.proposed for address in self.existing)


def name_addresses(config_root: Path, version: str) -> dict[str, set[int]]:
    """Return every symbol name and its addresses for ``version``."""
    symbols: dict[str, set[int]] = defaultdict(set)
    region_root = config_root / version / "arm9"
    if not region_root.is_dir():
        raise FileNotFoundError(f"missing region config: {region_root}")
    for path in sorted(region_root.rglob("symbols.txt")):
        for line in path.read_text().splitlines():
            fields = line.split()
            if not fields or fields[0].startswith("#"):
                continue
            match = ADDR_RE.search(line)
            if match:
                symbols[fields[0]].add(int(match.group(1), 16))
    return dict(symbols)


def check(config_root: Path, version: str, address: int, name: str) -> NameCheck:
    existing = tuple(sorted(name_addresses(config_root, version).get(name, set())))
    return NameCheck(name=name, proposed=address, existing=existing)


def format_result(version: str, result: NameCheck) -> str:
    if result.collision:
        addresses = ",".join(f"0x{value:08x}" for value in result.existing)
        return (
            f"COLLISION version={version} name={result.name} "
            f"proposed=0x{result.proposed:08x} existing={addresses}"
        )
    if result.existing:
        addresses = ",".join(f"0x{value:08x}" for value in result.existing)
        return (
            f"SAME_ADDRESS version={version} name={result.name} "
            f"proposed=0x{result.proposed:08x} existing={addresses}"
        )
    return (
        f"UNIQUE version={version} name={result.name} "
        f"proposed=0x{result.proposed:08x}"
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--version", required=True, choices=("eur", "usa", "jpn"))
    parser.add_argument("--addr", required=True, type=lambda value: int(value, 0))
    parser.add_argument("--name", required=True)
    args = parser.parse_args()
    result = check(CONFIG, args.version, args.addr, args.name)
    print(format_result(args.version, result))
    return 1 if result.collision else 0


if __name__ == "__main__":
    sys.exit(main())
