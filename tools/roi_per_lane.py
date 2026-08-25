#!/usr/bin/env python3
"""Join recent lane outcomes with the effort evidence that actually exists.

The ledger is the source of function-lane outcomes and recorded attempts.
Research/PR evidence is normalized in ``roi-evidence.tsv`` for data-lane
outcomes and documented full-gate counts, because those facts are not columns
in attempts.tsv.  The tool keeps the two cost proxies separate: full-gate
invocations are machine-workload exposure, while recorded attempts are a
candidate-effort proxy.  It deliberately does not manufacture wall-clock
hours or rank lanes.
"""

from __future__ import annotations

import argparse
import csv
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LEDGER_PATH = ROOT / "docs/research/campaign-analytics/attempts.tsv"
EVIDENCE_PATH = ROOT / "docs/research/campaign-analytics/roi-evidence.tsv"


@dataclass(frozen=True)
class Evidence:
    round_name: str
    lane: str
    item: str
    source: str
    full_gate_runs: int
    ledger_prefix: str | None
    candidates: int | None
    shipped: int | None
    shipped_bytes: int | None


def _int(value: str | None, *, field: str, row_number: int) -> int | None:
    raw = (value or "").strip()
    if raw in {"", "-"}:
        return None
    try:
        parsed = int(raw)
    except ValueError as exc:
        raise ValueError(f"row {row_number}: {field} is not an integer") from exc
    if parsed < 0:
        raise ValueError(f"row {row_number}: {field} must be non-negative")
    return parsed


def load_evidence(path: Path = EVIDENCE_PATH) -> list[Evidence]:
    with path.open(encoding="utf-8", newline="") as handle:
        reader = csv.DictReader(handle, delimiter="\t")
        required = {
            "round", "lane", "item", "source", "full_gate_runs",
            "ledger_prefix", "candidates", "shipped", "shipped_bytes",
        }
        missing = required - set(reader.fieldnames or ())
        if missing:
            raise ValueError("evidence is missing columns: " + ", ".join(sorted(missing)))
        result = []
        for row_number, row in enumerate(reader, start=2):
            gates = _int(row.get("full_gate_runs"), field="full_gate_runs", row_number=row_number)
            if not gates:
                raise ValueError(f"row {row_number}: full_gate_runs must be positive")
            ledger_raw = (row.get("ledger_prefix") or "").strip()
            ledger_prefix = None if ledger_raw in {"", "-"} else ledger_raw
            result.append(Evidence(
                round_name=(row.get("round") or "").strip(),
                lane=(row.get("lane") or "").strip(),
                item=(row.get("item") or "").strip(),
                source=(row.get("source") or "").strip(),
                full_gate_runs=gates,
                ledger_prefix=ledger_prefix,
                candidates=_int(row.get("candidates"), field="candidates", row_number=row_number),
                shipped=_int(row.get("shipped"), field="shipped", row_number=row_number),
                shipped_bytes=_int(row.get("shipped_bytes"), field="shipped_bytes", row_number=row_number),
            ))
    if any(not item.round_name or not item.lane or not item.item or not item.source
           for item in result):
        raise ValueError("evidence rows require round, lane, item, and source")
    return result


def load_ledger(path: Path = LEDGER_PATH) -> list[dict[str, str]]:
    with path.open(encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle, delimiter="\t"))


def _matches_prefix(row: dict[str, str], prefix: str) -> bool:
    brief = (row.get("brief") or "")
    return brief == prefix or brief.startswith(prefix + "-")


def _attempt_value(row: dict[str, str]) -> int | None:
    raw = (row.get("attempts") or "").strip()
    if not raw:
        return None
    try:
        value = int(raw)
    except ValueError:
        return None
    return value if value >= 0 else None


def _ledger_metrics(rows: list[dict[str, str]], prefix: str) -> tuple[int, int, int, int, int | None, int]:
    selected = [row for row in rows if _matches_prefix(row, prefix)]
    shipped = [row for row in selected if (row.get("result") or "").strip().lower() == "shipped"]
    bytes_shipped = sum(
        int(row["text_size"])
        for row in shipped
        if (row.get("text_size") or "").strip().isdigit()
    )
    recorded = [value for row in selected if (value := _attempt_value(row)) is not None]
    effort_sum = sum(recorded) if recorded else None
    return (
        len(selected), len(shipped), bytes_shipped, len(recorded), effort_sum,
        len(selected) - len(recorded),
    )


def _round_key(value: str) -> tuple[int, str]:
    digits = "".join(char for char in value if char.isdigit())
    return int(digits or 0), value


def select_rounds(evidence: list[Evidence], rounds: list[str] | None, last: int = 3) -> list[str]:
    available = sorted({item.round_name for item in evidence}, key=_round_key)
    if rounds:
        unknown = [value for value in rounds if value not in available]
        if unknown:
            raise ValueError("round not found in evidence: " + ", ".join(unknown))
        return rounds
    return available[-last:]


def build_rows(
    evidence: list[Evidence],
    ledger: list[dict[str, str]],
    rounds: list[str],
) -> list[dict[str, object]]:
    output = []
    for item in evidence:
        if item.round_name not in rounds:
            continue
        if item.ledger_prefix:
            metrics = _ledger_metrics(ledger, item.ledger_prefix)
            actual = metrics[:3]
            declared = (item.candidates, item.shipped, item.shipped_bytes)
            if any(value is not None for value in declared) and actual != declared:
                raise ValueError(
                    f"{item.item}: evidence disagrees with ledger prefix "
                    f"{item.ledger_prefix}: {actual} != {declared}"
                )
            candidates, shipped, shipped_bytes, recorded, effort_sum, excluded = metrics
        else:
            if None in (item.candidates, item.shipped, item.shipped_bytes):
                raise ValueError(f"{item.item}: non-ledger evidence needs outcome fields")
            candidates = item.candidates
            shipped = item.shipped
            shipped_bytes = item.shipped_bytes
            recorded = 0
            effort_sum = None
            excluded = candidates
        if shipped > candidates:
            raise ValueError(f"{item.item}: shipped exceeds candidates")
        output.append({
            "round": item.round_name,
            "lane": item.lane,
            "item": item.item,
            "candidates": candidates,
            "shipped": shipped,
            "ship_rate": shipped / candidates if candidates else None,
            "bytes": shipped_bytes,
            "full_gate_runs": item.full_gate_runs,
            "gate_region_runs": item.full_gate_runs * 3,
            "attempts_recorded": recorded,
            "attempts_excluded": excluded,
            "attempt_sum": effort_sum,
            "source": item.source,
        })
    return output


def aggregate_rows(rows: list[dict[str, object]]) -> list[dict[str, object]]:
    grouped: dict[tuple[str, str], dict[str, object]] = {}
    for row in rows:
        key = (str(row["round"]), str(row["lane"]))
        if key not in grouped:
            grouped[key] = {
                "round": row["round"],
                "lane": row["lane"],
                "item": [],
                "candidates": 0,
                "shipped": 0,
                "bytes": 0,
                "full_gate_runs": 0,
                "gate_region_runs": 0,
                "attempts_recorded": 0,
                "attempts_excluded": 0,
                "attempt_sum": 0,
                "has_attempt_sum": False,
            }
        target = grouped[key]
        target["item"].append(row["item"])
        for field in (
            "candidates", "shipped", "bytes", "full_gate_runs", "gate_region_runs",
            "attempts_recorded", "attempts_excluded",
        ):
            target[field] += row[field]
        if row["attempt_sum"] is not None:
            target["attempt_sum"] += row["attempt_sum"]
            target["has_attempt_sum"] = True
    result = []
    for row in grouped.values():
        row["item"] = ", ".join(row["item"])
        row["ship_rate"] = row["shipped"] / row["candidates"] if row["candidates"] else None
        if not row["has_attempt_sum"]:
            row["attempt_sum"] = None
        del row["has_attempt_sum"]
        result.append(row)
    return result


def render(rows: list[dict[str, object]], rounds: list[str]) -> str:
    lines = [
        "Cost evidence is intentionally split: full-gate counts are machine-workload "
        "exposure, and recorded attempts are a per-candidate effort proxy. "
        "No wall-clock or machine-hour denominator is committed, so this output "
        "does not calculate bytes/hour, rank lanes, or recommend funding.",
        "",
        "| round | lane | item | candidates | shipped | ship rate | bytes shipped | full 3-region gates | region gate runs | attempts recorded | attempts excluded | attempt sum |",
        "| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |",
    ]
    for row in aggregate_rows(rows):
        rate = "n/a" if row["ship_rate"] is None else f"{row['ship_rate']:.1%}"
        effort = "n/a" if row["attempt_sum"] is None else str(row["attempt_sum"])
        lines.append(
            f"| {row['round']} | {row['lane']} | `{row['item']}` | "
            f"{row['candidates']} | {row['shipped']} | {rate} | {row['bytes']:,} | "
            f"{row['full_gate_runs']} | {row['gate_region_runs']} | "
            f"{row['attempts_recorded']} | {row['attempts_excluded']} | {effort} |"
        )
    lines.extend(("", "Selected rounds: " + ", ".join(rounds) + "."))
    lines.append("Blank attempts are excluded, never converted to zero.")
    lines.append("Sources are recorded per row in roi-evidence.tsv.")
    return "\n".join(lines)


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--evidence", type=Path, default=EVIDENCE_PATH)
    parser.add_argument("--ledger", type=Path, default=LEDGER_PATH)
    parser.add_argument("--round", action="append", dest="rounds")
    parser.add_argument("--last", type=int, default=3)
    args = parser.parse_args(argv)
    if args.last <= 0:
        parser.error("--last must be positive")
    try:
        evidence = load_evidence(args.evidence)
        rounds = select_rounds(evidence, args.rounds, args.last)
        rows = build_rows(evidence, load_ledger(args.ledger), rounds)
    except (OSError, ValueError) as exc:
        parser.error(str(exc))
    print(render(rows, rounds))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
