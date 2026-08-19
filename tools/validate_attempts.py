#!/usr/bin/env python3
"""Validate the append-only attempts ledger before it feeds a sweep.

Failure mode: ``attempts.tsv`` is consumed as machine data, but previously
only selected writer paths and ad-hoc tests checked it.  A malformed row could
therefore hide a candidate, misstate its size, or move a wall label between
columns without a loud failure.

Usage:
    python tools/validate_attempts.py
    python tools/validate_attempts.py --ledger path/to/attempts.tsv
    python tools/validate_attempts.py --json

Exit codes:
    0  The ledger has no hard validation errors.  Shape/park-class conflicts
       are reported because they require human judgement, but do not fail.
    1  One or more schema, contradiction, module, or text-size errors exist.
"""
from __future__ import annotations

import argparse
import csv
import json
import re
import subprocess
from dataclasses import asdict, dataclass, field
from functools import lru_cache
from pathlib import Path

from batch_sha1 import _c_to_s_rel
from parsers import parse_delinks_file
from wall_aware_headroom import _source_module

ROOT = Path(__file__).resolve().parent.parent
LEDGER = ROOT / "docs/research/campaign-analytics/attempts.tsv"
FIELDS = (
    "addr", "module", "text_size", "tier", "shape", "result",
    "match_pct", "park_class", "park_family", "brief",
)
_C_LEVER_RE = re.compile(r"\bC-\d+[a-z]?\b", re.IGNORECASE)
_NON_SHAPE_RE = re.compile(
    r"^(?:[CP]-\d+[a-z]?\b|reg-alloc$|scheduling-wall$|"
    r".*(?:wall|resistance).*)",
    re.IGNORECASE,
)
_ROUND_RE = re.compile(
    r"\b(cm-(?:main-tier-sweep-\d+|ov\d{3}-unknown-sweep-\d+))\b"
)
_SHIP_COVERAGE_RE = re.compile(
    r"\b(cm-main-tier-sweep-\d+|cm-ov002-unknown-sweep-17)\b"
)


@dataclass
class Audit:
    row_count: int = 0
    not_attempted_with_measured_pct: list[dict] = field(default_factory=list)
    shipped_below_100: list[dict] = field(default_factory=list)
    parked_at_100: list[dict] = field(default_factory=list)
    shipped_with_c_lever: list[dict] = field(default_factory=list)
    invalid_modules: list[dict] = field(default_factory=list)
    text_size_mismatches: list[dict] = field(default_factory=list)
    shape_migrations: list[dict] = field(default_factory=list)
    shape_conflicts: list[dict] = field(default_factory=list)
    ship_coverage_errors: list[dict] = field(default_factory=list)
    schema_errors: list[str] = field(default_factory=list)

    @property
    def hard_errors(self) -> list:
        return [
            self.not_attempted_with_measured_pct,
            self.shipped_below_100,
            self.parked_at_100,
            self.invalid_modules,
            self.text_size_mismatches,
            self.ship_coverage_errors,
            self.schema_errors,
        ]

    @property
    def error_count(self) -> int:
        return sum(len(items) for items in self.hard_errors)


def _pct(row: dict) -> float | None:
    value = (row.get("match_pct") or "").strip().lower().rstrip("%")
    if value in {"", "unknown", "n/a", "na", "none"}:
        return None
    try:
        return float(value)
    except ValueError:
        return None


def _ground_truth(root: Path) -> tuple[set[str], dict[tuple[str, str], int]]:
    """Return valid module keys and EUR delinks text sizes by key."""
    modules: set[str] = set()
    sizes: dict[tuple[str, str], int] = {}
    for delinks in sorted((root / "config/eur/arm9").glob("**/delinks.txt")):
        _sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            source = tu.get("source", "")
            if not source.startswith("src/"):
                continue
            if source.endswith(".c"):
                source = _c_to_s_rel(source)
            if not source.endswith(".s"):
                continue
            module = _source_module(source)
            if not module:
                continue
            text_sections = [
                (start, end)
                for name, start, end in tu.get("sections", [])
                if name == ".text"
            ]
            if not text_sections:
                continue
            modules.add(module)
            start = min(begin for begin, _end in text_sections)
            size = sum(max(0, end - begin) for begin, end in text_sections)
            sizes[(module, f"0x{start:08x}")] = size
    return modules, sizes


def audit_rows(
    rows: list[dict], *, modules: set[str] | None, sizes: dict[tuple[str, str], int] | None,
) -> Audit:
    """Audit parsed rows against supplied mechanical ground truth."""
    report = Audit(row_count=len(rows))
    for row in rows:
        result = (row.get("result") or "").strip().lower()
        percentage = _pct(row)
        if result == "not-attempted" and percentage is not None:
            report.not_attempted_with_measured_pct.append(row)
        if result == "shipped" and percentage is not None and percentage < 100:
            report.shipped_below_100.append(row)
        if result == "parked" and percentage == 100:
            report.parked_at_100.append(row)
        if result == "shipped" and _C_LEVER_RE.search(row.get("park_class", "")):
            report.shipped_with_c_lever.append(row)

        module = (row.get("module") or "").strip().lower()
        if modules is not None and module not in modules:
            report.invalid_modules.append(row)

        text_size = (row.get("text_size") or "").strip().lower()
        key = (module, (row.get("addr") or "").strip().lower())
        if text_size not in {"", "unknown"}:
            try:
                recorded = int(text_size, 0)
            except ValueError:
                report.text_size_mismatches.append(
                    {"row": row, "ground_truth": "non-numeric"}
                )
            else:
                expected = sizes.get(key) if sizes is not None else recorded
                if expected is None:
                    report.text_size_mismatches.append(
                        {"row": row, "ground_truth": "missing"}
                    )
                elif recorded != expected:
                    report.text_size_mismatches.append(
                        {"row": row, "ground_truth": expected}
                    )

        shape = (row.get("shape") or "").strip()
        park_class = (row.get("park_class") or "").strip()
        if _NON_SHAPE_RE.match(shape):
            item = {"row": row, "shape": shape, "park_class": park_class}
            if park_class:
                report.shape_conflicts.append(item)
            else:
                report.shape_migrations.append(item)
    return report


def _brief_round(brief: str) -> str | None:
    match = _ROUND_RE.search(brief)
    return match.group(1) if match else None


def audit_ship_coverage(
    round_flips: dict[str, list[dict]], rows: list[dict]
) -> list[dict]:
    """Return delinks ship flips with no shipped ledger event for that round."""
    shipped_by_round: dict[str, set[tuple[str, str]]] = {}
    for row in rows:
        if (row.get("result") or "").strip().lower() != "shipped":
            continue
        round_name = _brief_round(row.get("brief", ""))
        if round_name is None:
            continue
        shipped_by_round.setdefault(round_name, set()).add(
            (
                (row.get("module") or "").strip().lower(),
                (row.get("addr") or "").strip().lower(),
            )
        )

    errors = []
    for round_name, flips in sorted(round_flips.items()):
        observed = shipped_by_round.get(round_name, set())
        missing = [
            flip
            for flip in flips
            if (
                str(flip.get("module", "")).lower(),
                str(flip.get("addr", "")).lower(),
            )
            not in observed
        ]
        if missing:
            errors.append(
                {
                    "round": round_name,
                    "flips": len(flips),
                    "recorded_shipped": len(observed),
                    "missing": missing,
                }
            )
    return errors


@lru_cache(maxsize=4)
def _history_ship_flips(root: Path) -> dict[str, list[dict]]:
    """Derive round ship flips from the round-labelled git history."""
    # Main-tier rounds and ov002 sweep-17 are the ship-coverage campaign
    # represented by this ledger.  Older ov002 rounds predate ship recording
    # and are intentionally outside this backfill's coverage contract.
    log = subprocess.check_output(
        ["git", "log", "--all", "--format=%H%x09%s"],
        cwd=root,
        text=True,
    )
    by_round: dict[str, set[tuple[str, str]]] = {}
    for line in log.splitlines():
        commit, subject = line.split("\t", 1)
        names = {match.group(1) for match in _SHIP_COVERAGE_RE.finditer(subject)}
        if not names:
            continue
        parent = subprocess.run(
            ["git", "rev-parse", f"{commit}^1"],
            cwd=root,
            text=True,
            capture_output=True,
        )
        if parent.returncode:
            continue
        diff = subprocess.check_output(
            [
                "git", "diff", "--unified=0", parent.stdout.strip(), commit,
                "--", "config/eur/arm9",
            ],
            cwd=root,
            text=True,
        )
        lines = diff.splitlines()
        for index in range(len(lines) - 1):
            old_line, new_line = lines[index : index + 2]
            if not (old_line.startswith("-src/") and old_line.endswith(".s:")):
                continue
            if not (new_line.startswith("+src/") and new_line.endswith(".c:")):
                continue
            source = new_line[1:-1]
            module = _source_module(source[:-2] + ".s")
            address = re.search(
                r"func_(?:ov\d{3}_)?([0-9a-fA-F]{8})", Path(source).name
            )
            if module is None or address is None:
                continue
            key = (module.lower(), f"0x{address.group(1).lower()}")
            for name in names:
                by_round.setdefault(name, set()).add(key)
    return {
        name: [
            {"module": module, "addr": addr}
            for module, addr in sorted(keys)
        ]
        for name, keys in by_round.items()
    }


def audit_file(path: Path, *, root: Path = ROOT) -> Audit:
    with path.open(newline="", encoding="utf-8") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        report = Audit()
        if tuple(reader.fieldnames or ()) != FIELDS:
            report.schema_errors.append(
                f"expected header {FIELDS!r}, got {reader.fieldnames!r}"
            )
            return report
        rows = list(reader)
    modules, sizes = _ground_truth(root)
    report = audit_rows(rows, modules=modules, sizes=sizes)
    if root == ROOT and path.resolve() == LEDGER.resolve():
        report.ship_coverage_errors = audit_ship_coverage(
            _history_ship_flips(root), rows
        )
    return report


def audit_event(row: dict, *, root: Path = ROOT) -> Audit:
    """Validate one prospective append without requiring a ledger file.

    Synthetic callers may not have EUR delinks data, so source-grounded
    module/size checks are applied when the configured EUR tree exists and
    semantic row checks still apply everywhere.
    """
    if (root / "config/eur/arm9").is_dir():
        modules, sizes = _ground_truth(root)
    else:
        modules, sizes = None, None
    return audit_rows([row], modules=modules, sizes=sizes)


def _summary(report: Audit) -> dict:
    return {
        "rows": report.row_count,
        "errors": report.error_count,
        "families": {
            "not-attempted-with-measured-pct": len(report.not_attempted_with_measured_pct),
            "shipped-below-100": len(report.shipped_below_100),
            "parked-at-100": len(report.parked_at_100),
            "shipped-with-C-lever": len(report.shipped_with_c_lever),
            "invalid-module": len(report.invalid_modules),
            "text-size-mismatch": len(report.text_size_mismatches),
            "ship-coverage-missing": len(report.ship_coverage_errors),
        },
        "shape_migrations": len(report.shape_migrations),
        "shape_conflicts": len(report.shape_conflicts),
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--ledger", type=Path, default=LEDGER)
    parser.add_argument("--json", action="store_true", dest="as_json")
    args = parser.parse_args(argv)
    report = audit_file(args.ledger)
    if args.as_json:
        print(json.dumps({"summary": _summary(report), "report": asdict(report)}, indent=2))
    else:
        print(json.dumps(_summary(report), indent=2))
        for name in (
            "not_attempted_with_measured_pct", "shipped_below_100",
            "parked_at_100", "invalid_modules", "text_size_mismatches",
        ):
            for row in getattr(report, name):
                print(f"{name}: {row}")
        for item in report.shape_conflicts:
            row = item["row"]
            print(
                "shape-conflict: "
                f"{row['module']}/{row['addr']} shape={item['shape']!r} "
                f"park_class={item['park_class']!r} source={row['brief']}"
            )
        for item in report.ship_coverage_errors:
            print(
                "ship-coverage-missing: "
                f"{item['round']} recorded={item['recorded_shipped']} "
                f"flips={item['flips']} missing={len(item['missing'])}"
            )
    return 1 if report.error_count else 0


if __name__ == "__main__":
    raise SystemExit(main())
