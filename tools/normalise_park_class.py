#!/usr/bin/env python3
"""Map attempts.tsv park_class provenance to a controlled wall vocabulary."""

from __future__ import annotations

import argparse
import csv
import json
import os
import re
import tempfile
from collections import Counter
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
MAP_PATH = ROOT / "tools" / "park_class_map.tsv"
LEDGER_PATH = ROOT / "docs" / "research" / "campaign-analytics" / "attempts.tsv"
LEDGER_FIELDS = (
    "addr", "module", "text_size", "tier", "shape", "result",
    "match_pct", "park_class", "park_family", "brief", "attempts",
)
LEGACY_LEDGER_FIELDS = tuple(field for field in LEDGER_FIELDS if field != "park_family")
OLD_LEDGER_FIELDS = tuple(field for field in LEGACY_LEDGER_FIELDS if field != "attempts")
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


def derive_family(
    row: dict[str, str], mapping: dict[str, Normalized] | None = None,
) -> str:
    """Derive the family column without changing park_class evidence."""
    if row.get("result", "").strip().lower() == "shipped":
        return ""
    raw = row.get("park_class", "")
    if not raw.strip() or raw.strip().lower() == "n/a":
        return ""
    return normalize(raw, mapping).family


def regenerate_rows(
    rows: list[dict[str, str]], mapping: dict[str, Normalized] | None = None,
) -> list[dict[str, str]]:
    """Return rows with a deterministic derived park_family value."""
    return [
        {**row, "park_family": derive_family(row, mapping)}
        for row in rows
    ]


def write_ledger(
    path: Path = LEDGER_PATH,
    mapping: dict[str, Normalized] | None = None,
) -> None:
    """Regenerate park_family atomically, preserving every other field."""
    with path.open(encoding="utf-8", newline="") as handle:
        reader = csv.DictReader(handle, delimiter="\t")
        fields = tuple(reader.fieldnames or ())
        if fields not in {LEDGER_FIELDS, LEGACY_LEDGER_FIELDS, OLD_LEDGER_FIELDS}:
            raise ValueError(
                f"Unexpected attempts ledger header in {path}: {fields!r}"
            )
        rows = regenerate_rows(list(reader), mapping)

    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temp_name = tempfile.mkstemp(
        prefix=f".{path.name}.", suffix=".tmp", dir=path.parent,
    )
    try:
        with os.fdopen(fd, "w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(
                handle, fieldnames=LEDGER_FIELDS, delimiter="\t",
                lineterminator="\n",
            )
            writer.writeheader()
            writer.writerows(
                {field: row.get(field, "") for field in LEDGER_FIELDS}
                for row in rows
            )
        os.replace(temp_name, path)
    except BaseException:
        os.unlink(temp_name)
        raise


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
    parser.add_argument("--write", action="store_true", help="regenerate the park_family column")
    args = parser.parse_args()
    mapping = load_map()
    if args.value:
        for raw in args.value:
            print(json.dumps(normalize(raw, mapping).__dict__, sort_keys=True))
    if args.census:
        print_census(census(load_ledger(), mapping))
    if args.write:
        write_ledger(mapping=mapping)
        print(f"wrote {LEDGER_PATH}")
    if not args.value and not args.census and not args.write:
        parser.error("choose --value, --census, or --write")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
