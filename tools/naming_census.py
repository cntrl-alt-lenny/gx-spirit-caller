#!/usr/bin/env python3
"""Count placeholder and real function names in committed symbol tables."""

from __future__ import annotations

import argparse
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REGIONS = ("eur", "usa", "jpn")
_FUNCTION_RE = re.compile(r"^(\S+) kind:function\(")


def module_for(path: Path, config_root: Path) -> str:
    rel = path.relative_to(config_root)
    parts = rel.parts
    if "overlays" in parts:
        return parts[parts.index("overlays") + 1]
    if len(parts) >= 2 and parts[-2] == "arm9":
        return "main"
    return parts[-2]


def parse_symbols(text: str) -> tuple[int, int, int]:
    total = placeholders = 0
    for line in text.splitlines():
        match = _FUNCTION_RE.match(line)
        if not match:
            continue
        total += 1
        name = match.group(1)
        if name.startswith("func_") or name.startswith("__sinit_"):
            placeholders += 1
    return total, placeholders, total - placeholders


def collect(root: Path = ROOT) -> list[dict]:
    rows = []
    for region in REGIONS:
        config_root = root / "config" / region
        totals: dict[str, list[int]] = {}
        for symbols in sorted(config_root.rglob("symbols.txt")):
            module = module_for(symbols, config_root)
            total, placeholder, real = parse_symbols(symbols.read_text())
            cell = totals.setdefault(module, [0, 0, 0])
            for i, value in enumerate((total, placeholder, real)):
                cell[i] += value
        for module in sorted(totals):
            total, placeholder, real = totals[module]
            rows.append({"region": region, "module": module,
                         "total": total, "placeholder": placeholder,
                         "real": real})
    return rows


def render(rows: list[dict]) -> str:
    lines = [
        "# Naming coverage census",
        "",
        "Placeholder names are func_* and __sinit_*; all other function names",
        "are counted as real names.",
        "",
        "| Region | Module | Total functions | Placeholder-named | Real-named |",
        "|---|---|---:|---:|---:|",
    ]
    lines.extend(
        f"| {r['region'].upper()} | {r['module']} | {r['total']} | "
        f"{r['placeholder']} | {r['real']} |" for r in rows
    )
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path,
                        default=ROOT / "docs/research/campaign-analytics/naming-census.md")
    args = parser.parse_args()
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(render(collect()))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
