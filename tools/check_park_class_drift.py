#!/usr/bin/env python3
"""Report parked ledger values missing from the controlled park-class map."""

from __future__ import annotations

import argparse
import csv
import difflib
from collections import defaultdict
from pathlib import Path

from normalise_park_class import Normalized, load_map, normalize

ROOT = Path(__file__).resolve().parent.parent
LEDGER_PATH = ROOT / "docs/research/campaign-analytics/attempts.tsv"
MAP_PATH = ROOT / "tools/park_class_map.tsv"


def load_rows(path: Path = LEDGER_PATH) -> list[dict[str, str]]:
    with path.open(encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle, delimiter="\t"))


def closest_mapping(raw: str, mapping: dict[str, Normalized]) -> Normalized | None:
    """Suggest a mapping without changing the map or adopting the suggestion."""
    if not mapping:
        return None
    return max(
        mapping.values(),
        key=lambda item: difflib.SequenceMatcher(
            None, raw.casefold(), item.raw.casefold(),
        ).ratio(),
    )


def drift_rows(
    rows: list[dict[str, str]], mapping: dict[str, Normalized],
) -> dict[str, list[dict[str, str]]]:
    """Group unmapped parked rows by raw value, retaining introduction evidence."""
    result: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in rows:
        raw = (row.get("park_class") or "").strip()
        if row.get("result", "").strip().lower() == "parked" and raw:
            if normalize(raw, mapping).family == "PROVISIONAL:unmapped":
                result[raw].append(row)
    return dict(sorted(result.items()))


def render(
    drift: dict[str, list[dict[str, str]]], mapping: dict[str, Normalized],
) -> str:
    lines = ["PARK_CLASS DRIFT", f"unmapped_values={len(drift)}"]
    for raw, rows in drift.items():
        suggestion = closest_mapping(raw, mapping)
        if suggestion is None:
            suggestion_text = "none"
        else:
            suggestion_text = f"{suggestion.raw!r} -> {suggestion.family}"
        lines.append(f"UNMAPPED\t{raw!r}\tsuggestion={suggestion_text}")
        for row in rows:
            lines.append(
                "  row="
                f"{row.get('module', '')}/{row.get('addr', '')} "
                f"brief={row.get('brief', '')!r}"
            )
    if not drift:
        lines.append("CLEAN")
    return "\n".join(lines)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--ledger", type=Path, default=LEDGER_PATH)
    parser.add_argument("--map", dest="map_path", type=Path, default=MAP_PATH)
    parser.add_argument(
        "--check", action="store_true",
        help="return non-zero when an unmapped parked value is present",
    )
    args = parser.parse_args(argv)
    mapping = load_map(args.map_path)
    drift = drift_rows(load_rows(args.ledger), mapping)
    print(render(drift, mapping))
    return 1 if args.check and drift else 0


if __name__ == "__main__":
    raise SystemExit(main())
