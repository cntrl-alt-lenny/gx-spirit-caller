#!/usr/bin/env python3
"""Map attempts.tsv park_class provenance to a controlled wall vocabulary."""

from __future__ import annotations

import argparse
import csv
import json
import re
from collections import Counter
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
MAP_PATH = ROOT / "tools" / "park_class_map.tsv"
LEDGER_PATH = ROOT / "docs" / "research" / "campaign-analytics" / "attempts.tsv"
ANCHOR_RE = re.compile(r"(?P<family>(?:c|p|oq)-\d+)", re.IGNORECASE)


@dataclass(frozen=True)
class Normalized:
    raw: str
    family: str
    qualifier: str


def load_map(path: Path = MAP_PATH) -> dict[str, Normalized]:
    with path.open(encoding="utf-8", newline="") as handle:
        return {
            row["raw"]: Normalized(row["raw"], row["family"], row["qualifier"])
            for row in csv.DictReader(handle, delimiter="\t")
        }


def normalize(raw: str, mapping: dict[str, Normalized] | None = None) -> Normalized:
    mapping = mapping or load_map()
    value = raw.strip()
    if value in mapping:
        return mapping[value]
    anchor = ANCHOR_RE.fullmatch(value)
    if anchor:
        return Normalized(value, anchor.group("family").upper(), "formal anchor")
    folded = [item for key, item in mapping.items() if key.casefold() == value.casefold()]
    if len(folded) == 1:
        return folded[0]
    return Normalized(value, "PROVISIONAL:unmapped", f"unmapped raw value: {value}")


def load_ledger(path: Path = LEDGER_PATH) -> list[dict[str, str]]:
    with path.open(encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle, delimiter="\t"))


def unmapped_values(
    rows: list[dict[str, str]], mapping: dict[str, Normalized]
) -> list[str]:
    return sorted({
        row["park_class"]
        for row in rows
        if row["result"] == "parked"
        and row["park_class"].strip()
        and normalize(row["park_class"], mapping).family == "PROVISIONAL:unmapped"
    })


def assert_all_parked_values_mapped(
    rows: list[dict[str, str]], mapping: dict[str, Normalized]
) -> None:
    missing = unmapped_values(rows, mapping)
    if missing:
        raise AssertionError(
            "unmapped parked park_class values: " + ", ".join(repr(value) for value in missing)
        )


def census(rows: list[dict[str, str]], mapping: dict[str, Normalized]) -> dict[str, object]:
    raw_counts = Counter(row["park_class"] for row in rows)
    normalized = {raw: normalize(raw, mapping) for raw in raw_counts}
    all_families = Counter(normalized[row["park_class"]].family for row in rows)
    parked_rows = [row for row in rows if row["result"] == "parked"]
    parked_families = Counter(normalized[row["park_class"]].family for row in parked_rows)
    unmapped = unmapped_values(rows, mapping)
    return {
        "rows": len(rows),
        "parked_rows": len(parked_rows),
        "raw_distinct": len(raw_counts),
        "family_distinct": len(all_families),
        "raw_counts": raw_counts,
        "normalized": normalized,
        "all_families": all_families,
        "parked_families": parked_families,
        "unmapped_values": unmapped,
    }


def print_census(report: dict[str, object]) -> None:
    raw_counts = report["raw_counts"]
    normalized = report["normalized"]
    all_families = report["all_families"]
    parked_families = report["parked_families"]
    print(f"rows={report['rows']}")
    print(f"parked_rows={report['parked_rows']}")
    print(f"raw_distinct={report['raw_distinct']}")
    print(f"family_distinct={report['family_distinct']}")
    print("RAW_ENUMERATION")
    for raw, count in sorted(raw_counts.items(), key=lambda item: (-item[1], item[0])):
        item = normalized[raw]
        print(f"{raw}\t{count}\t{item.family}\t{item.qualifier}")
    print("FAMILY_CENSUS_ALL")
    for family, count in all_families.most_common():
        print(f"{family}\t{count}\t{count / report['rows']:.4%}")
    print("FAMILY_CENSUS_PARKED")
    for family, count in parked_families.most_common():
        print(f"{family}\t{count}\t{count / report['parked_rows']:.4%}")
    print("UNMAPPED_PARKED_VALUES")
    for value in report["unmapped_values"]:
        print(value)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--value", action="append", help="normalize one raw value; repeatable")
    parser.add_argument("--census", action="store_true", help="enumerate the ledger and census families")
    args = parser.parse_args()
    mapping = load_map()
    if args.value:
        for raw in args.value:
            print(json.dumps(normalize(raw, mapping).__dict__, sort_keys=True))
    if args.census:
        print_census(census(load_ledger(), mapping))
    if not args.value and not args.census:
        parser.error("choose --value or --census")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
