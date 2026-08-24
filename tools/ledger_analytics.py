#!/usr/bin/env python3
"""Summarize self-reported match percentages for selected ledger briefs."""

from __future__ import annotations

import argparse
import csv
import statistics
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LEDGER_PATH = ROOT / "docs/research/campaign-analytics/attempts.tsv"


def load_rows(path: Path = LEDGER_PATH) -> list[dict[str, str]]:
    with path.open(encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle, delimiter="\t"))


def _number(value: str | None) -> float | None:
    try:
        return float((value or "").strip())
    except ValueError:
        return None


def select_rows(rows: list[dict[str, str]], briefs: list[str]) -> dict[str, list[dict[str, str]]]:
    return {
        brief: [row for row in rows if row.get("brief", "") == brief]
        for brief in briefs
    }


def summarize(rows: list[dict[str, str]]) -> dict[str, object]:
    parked_rows = [
        row for row in rows if row.get("result", "").strip().lower() == "parked"
    ]
    percentages = [value for value in (_number(row.get("match_pct")) for row in parked_rows)
                   if value is not None]
    shipped_bytes = sum(
        int(row["text_size"])
        for row in rows
        if row.get("result", "").strip().lower() == "shipped"
        and row.get("text_size", "").strip().isdigit()
    )
    attempts = [
        int(row["attempts"])
        for row in parked_rows
        if row.get("attempts", "").strip().lstrip("-").isdigit()
    ]
    return {
        "n": len(parked_rows),
        "numeric_match_pct": len(percentages),
        "median": statistics.median(percentages) if percentages else None,
        "mean": statistics.fmean(percentages) if percentages else None,
        "at_least_85": sum(value >= 85 for value in percentages),
        "at_least_75": sum(value >= 75 for value in percentages),
        "below_50": sum(value < 50 for value in percentages),
        "park_class": Counter(
            row.get("park_class", "") or "(blank)" for row in parked_rows
        ),
        "shipped_bytes": shipped_bytes,
        "attempts": Counter(attempts),
        "attempts_recorded": len(attempts),
    }


def _format_number(value: object) -> str:
    return "n/a" if value is None else f"{value:.1f}%"


def render(groups: dict[str, list[dict[str, str]]]) -> str:
    lines = [
        "CAVEAT: match_pct is agent-reported (park_one.py accepts free text), "
        "so it is evidence, not proof; compare groups only when the same lane "
        "used the same convention.",
        "",
        "| group | n | numeric match_pct | median | mean | >=85% | >=75% | <50% | shipped bytes | park_class |",
        "| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |",
    ]
    for label, rows in groups.items():
        report = summarize(rows)
        park_class = ", ".join(
            f"{name}={count}" for name, count in sorted(report["park_class"].items())
        )
        lines.append(
            f"| {label} | {report['n']} | {report['numeric_match_pct']} | "
            f"{_format_number(report['median'])} | {_format_number(report['mean'])} | "
            f"{report['at_least_85']} | {report['at_least_75']} | {report['below_50']} | "
            f"{report['shipped_bytes']} | {park_class} |"
        )
    attempts_seen = [summarize(rows)["attempts_recorded"] for rows in groups.values()]
    if any(attempts_seen):
        lines.extend(("", "attempts (recorded values only):"))
        for label, rows in groups.items():
            counter = summarize(rows)["attempts"]
            values = ", ".join(f"{value}={count}" for value, count in sorted(counter.items()))
            lines.append(f"- {label}: {values or 'none'}")
    else:
        lines.extend(("", "attempts: not available in this ledger schema or no values recorded"))
    lines.extend(("", "park_class breakdowns above are raw evidence, not taxonomy judgments."))
    return "\n".join(lines)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--ledger", type=Path, default=LEDGER_PATH)
    parser.add_argument(
        "--brief", action="append", dest="briefs", required=True,
        help="exact brief to include; repeat for a side-by-side comparison",
    )
    args = parser.parse_args(argv)
    groups = select_rows(load_rows(args.ledger), args.briefs)
    missing = [brief for brief, rows in groups.items() if not rows]
    if missing:
        parser.error("brief not found: " + ", ".join(missing))
    print(render(groups))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
