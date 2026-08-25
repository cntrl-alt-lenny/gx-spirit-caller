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


def _attempt_value(row: dict[str, str]) -> int | None:
    raw = (row.get("attempts") or "").strip()
    if not raw:
        return None
    try:
        value = int(raw)
    except ValueError:
        return None
    return value if value >= 0 else None


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
        value for row in parked_rows
        if (value := _attempt_value(row)) is not None
    ]
    effort_rows = [
        (value, row) for row in rows
        if (value := _attempt_value(row)) is not None
    ]
    effort_strata: dict[int, dict[str, object]] = {}
    for value in sorted({value for value, _ in effort_rows}):
        selected = [row for attempt, row in effort_rows if attempt == value]
        parked = [
            row for row in selected
            if row.get("result", "").strip().lower() == "parked"
        ]
        match_values = [
            pct for pct in (_number(row.get("match_pct")) for row in parked)
            if pct is not None
        ]
        shipped = sum(
            row.get("result", "").strip().lower() == "shipped"
            for row in selected
        )
        effort_strata[value] = {
            "n": len(selected),
            "shipped": shipped,
            "ship_rate": shipped / len(selected),
            "numeric_match_pct": len(match_values),
            "median": statistics.median(match_values) if match_values else None,
            "mean": statistics.fmean(match_values) if match_values else None,
        }
    by_brief: dict[str, list[int]] = {}
    for value, row in effort_rows:
        by_brief.setdefault(row.get("brief", "") or "(blank brief)", []).append(value)
    effort_inhomogeneous = {
        brief: (min(values), max(values))
        for brief, values in by_brief.items()
        if min(values) != max(values)
    }
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
        "attempts_excluded": len(rows) - len(effort_rows),
        "effort_strata": effort_strata,
        "effort_inhomogeneous": effort_inhomogeneous,
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
    lines.extend(("", "Effort-stratified views (blank/non-integer attempts are excluded):"))
    lines.extend((
        "",
        "| group | attempts | n | shipped | ship rate | numeric match_pct | median | mean |",
        "| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |",
    ))
    for label, rows in groups.items():
        effort_strata = summarize(rows)["effort_strata"]
        for attempts, report in effort_strata.items():
            lines.append(
                f"| {label} | {attempts} | {report['n']} | {report['shipped']} | "
                f"{report['ship_rate']:.1%} | {report['numeric_match_pct']} | "
                f"{_format_number(report['median'])} | {_format_number(report['mean'])} |"
            )
        if not effort_strata:
            lines.append(f"| {label} | none recorded | 0 | 0 | n/a | 0 | n/a | n/a |")
    lines.extend(("", "Attempt-recording coverage:"))
    for label, rows in groups.items():
        report = summarize(rows)
        lines.append(
            f"- {label}: attempts excluded (blank/non-integer) = "
            f"{report['attempts_excluded']}; recorded = {sum(report['effort_strata'][value]['n'] for value in report['effort_strata'])}."
        )
        inhomogeneous = report["effort_inhomogeneous"]
        if inhomogeneous:
            ranges = ", ".join(
                f"{brief} ({low}-{high})"
                for brief, (low, high) in sorted(inhomogeneous.items())
            )
            lines.append(f"- effort-inhomogeneous briefs: {ranges}")
        else:
            lines.append("- effort-inhomogeneous briefs: none")
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
