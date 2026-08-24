#!/usr/bin/env python3
"""Audit repeated attempts.tsv events without treating repeats as duplicates."""

from __future__ import annotations

import argparse
import csv
import re
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LEDGER = ROOT / "docs/research/campaign-analytics/attempts.tsv"
PR_BRIEF_RE = re.compile(r"^PR#(?P<number>\d+):(?P<sha>[0-9a-f]+)$", re.IGNORECASE)


@dataclass(frozen=True)
class AuditGroup:
    key: tuple[str, str]
    rows: tuple[dict[str, str], ...]
    classification: str
    reason: str


def normalise_attempt_addr(row: dict[str, str]) -> tuple[str, str]:
    """Return the selector key, folding historical overlay module spellings."""
    module = (row.get("module") or "").strip().lower()
    if module.startswith("overlay") and module[7:].isdigit():
        module = f"ov{module[7:]:0>3}"
    address = (row.get("addr") or "").strip().lower()
    try:
        address = f"0x{int(address, 0):08x}"
    except ValueError:
        pass
    return module, address


def load_rows(path: Path = LEDGER) -> list[dict[str, str]]:
    with path.open(newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream, delimiter="\t"))


def _same_brief_has_different_result(rows: tuple[dict[str, str], ...]) -> bool:
    results_by_brief: dict[str, set[str]] = defaultdict(set)
    for row in rows:
        results_by_brief[row.get("brief", "")].add(
            (row.get("result") or "").strip().lower()
        )
    return any(len(results) > 1 for results in results_by_brief.values())


def _exact_event(row: dict[str, str]) -> tuple[str, ...]:
    return tuple(
        (row.get(field) or "").strip().lower()
        for field in (
            "brief", "text_size", "tier", "shape", "result", "match_pct",
            "park_class", "park_family", "attempts",
        )
    )


def _pr_number(row: dict[str, str]) -> int | None:
    match = PR_BRIEF_RE.fullmatch((row.get("brief") or "").strip())
    return int(match.group("number")) if match else None


def _chronological_rows(
    rows: tuple[dict[str, str], ...],
) -> tuple[dict[str, str], ...] | None:
    """Order rows by backfilled PR provenance, or refuse to guess."""
    numbered = [(_pr_number(row), row) for row in rows]
    if any(number is None for number, _row in numbered):
        return None
    if len({number for number, _row in numbered}) != len(numbered):
        return None
    return tuple(row for _number, row in sorted(numbered, key=lambda item: item[0]))


def _classify(rows: tuple[dict[str, str], ...]) -> tuple[str, str]:
    results = [(row.get("result") or "").strip().lower() for row in rows]
    shipped_indices = [index for index, result in enumerate(results) if result == "shipped"]
    if len(shipped_indices) > 1:
        return "CONTRADICTORY", "more than one shipped event"
    if _same_brief_has_different_result(rows):
        if {
            (row.get("result") or "").strip().lower() for row in rows
        } == {"parked", "shipped"} and any(
            (row.get("park_class") or "").strip().lower() == "tool-anomaly"
            for row in rows
        ):
            return "LEGITIMATE", "tool-anomaly retry later shipped in the same batch"
        return "AMBIGUOUS", "same brief records different results; order unavailable"
    if any(result == "parked" for result in results) and shipped_indices:
        ordered = _chronological_rows(rows)
        if ordered is None:
            return "AMBIGUOUS", "event order unavailable from ledger provenance"
        ordered_results = [
            (row.get("result") or "").strip().lower() for row in ordered
        ]
        shipped_index = ordered_results.index("shipped")
        if any(result == "parked" for result in ordered_results[shipped_index + 1 :]):
            return "CONTRADICTORY", "parked after shipped with no intervening re-attempt"
    if len({_exact_event(row) for row in rows}) < len(rows):
        return "AMBIGUOUS", "exact event repeated; provenance cannot distinguish it"
    return "LEGITIMATE", "event sequence is consistent"


def audit_rows(rows: list[dict[str, str]]) -> list[AuditGroup]:
    grouped: dict[tuple[str, str], list[dict[str, str]]] = defaultdict(list)
    for row in rows:
        grouped[normalise_attempt_addr(row)].append(row)
    return [
        AuditGroup(key, tuple(group), *_classify(tuple(group)))
        for key, group in sorted(grouped.items())
        if len(group) > 1
    ]


def _format_row(row: dict[str, str]) -> str:
    return (
        f"brief={row.get('brief', '')!r} "
        f"result={row.get('result', '')!r} "
        f"park_class={row.get('park_class', '')!r} "
        f"attempts={row.get('attempts')!r}"
    )


def render(groups: list[AuditGroup]) -> str:
    lines = ["LEDGER CONTRADICTION AUDIT"]
    for group in groups:
        module, address = group.key
        lines.append(
            f"{group.classification}\t{module}/{address}\t{group.reason}"
        )
        lines.extend(f"  {_format_row(row)}" for row in group.rows)
    counts: dict[str, int] = defaultdict(int)
    for group in groups:
        counts[group.classification] += 1
    lines.append("SUMMARY")
    for classification in ("LEGITIMATE", "CONTRADICTORY", "AMBIGUOUS"):
        lines.append(f"{classification.lower()}_groups={counts[classification]}")
    return "\n".join(lines)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--ledger", type=Path, default=LEDGER)
    parser.add_argument(
        "--check",
        action="store_true",
        help="fail if a repeated event is contradictory or ambiguous",
    )
    args = parser.parse_args(argv)
    groups = audit_rows(load_rows(args.ledger))
    print(render(groups))
    if args.check and any(group.classification != "LEGITIMATE" for group in groups):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
