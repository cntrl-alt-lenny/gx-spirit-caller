#!/usr/bin/env python3
"""Measure campaign pools from the live repository.

The pool definitions intentionally delegate to the campaign's existing
selectors.  This module adds only a reproducible measurement envelope:
count, effective bytes, repository revision, and the exact command.
"""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from dataclasses import asdict, dataclass, field
from datetime import date, datetime, timedelta
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

import data_worklist  # noqa: E402
import wall_aware_headroom  # noqa: E402


DATA_STRING_SHAPES = frozenset({
    data_worklist.SHAPE_STRING,
    data_worklist.SHAPE_STRING_ASCII4,
})
_CALL_RE = re.compile(r"^\s*(?:bl|blx)(?:\s|$)", re.IGNORECASE)
_POOL_FIGURE_RE = re.compile(
    r"(?P<count>[0-9][0-9,]*)\s+(?P<label>symbols?|candidates?)"
    r"\s*(?:/\s*(?P<bytes>[0-9][0-9,]*)\s*B)?",
    re.IGNORECASE,
)
_BARE_POOL_COUNT_RE = re.compile(r"\*\*(?P<count>[0-9][0-9,]*)\*\*")
_DATE_RE = re.compile(r"(?P<date>20[0-9]{2}-[0-9]{2}-[0-9]{2})")


@dataclass(frozen=True)
class PoolMeasurement:
    pool: str
    count: int
    bytes: int
    revision: str
    command: str
    definition: str
    details: dict[str, object] = field(default_factory=dict)


@dataclass(frozen=True)
class QueueFigure:
    line: int
    count: int
    bytes: int | None
    text: str


def _revision(root: Path = ROOT) -> str:
    result = subprocess.run(
        ["git", "rev-parse", "HEAD"],
        cwd=root,
        check=False,
        capture_output=True,
        text=True,
    )
    if result.returncode:
        raise RuntimeError("cannot determine the repository revision")
    return result.stdout.strip()


def _data_string_pool(version: str) -> PoolMeasurement:
    config_dir = data_worklist.ROOT / "config" / version
    if not config_dir.is_dir():
        raise ValueError(f"unknown data-worklist version: {version}")
    modules = data_worklist.load_all(config_dir)
    graph = data_worklist.build_call_graph(modules)
    matched = data_worklist.collect_matched_ranges(config_dir)
    sections = data_worklist.load_module_sections(config_dir, version)
    sizes = data_worklist.build_size_table(modules, sections)
    entries = data_worklist.rank_data_symbols(
        modules,
        graph,
        matched,
        min_readers=1,
        modsecs_map=sections,
        size_table=sizes,
        shape_filter=DATA_STRING_SHAPES,
    )
    command = (
        f"python tools/pool_freshness.py --pool data-string-pool "
        f"--version {version}"
    )
    return PoolMeasurement(
        pool="data-string-pool",
        count=len(entries),
        bytes=sum(entry.effective_size for entry in entries),
        revision=_revision(),
        command=command,
        definition=(
            "data_worklist.py unmatched placeholder data symbols with "
            "at least one reader and shape in {string,string-ascii4}"
        ),
        details={
            "version": version,
            "shapes": sorted(DATA_STRING_SHAPES),
            "min_readers": 1,
        },
    )


def body_call_count(path: Path) -> int:
    """Count exact ``bl``/``blx`` call instructions in an assembly body."""
    text = path.read_text(encoding="utf-8", errors="replace")
    body = text.split(".text", 1)[-1]
    return sum(bool(_CALL_RE.match(line)) for line in body.splitlines())


def _wall_files(per: dict[str, dict], module: str | None) -> list[dict]:
    files: list[dict] = []
    modules = [module] if module is not None else sorted(per)
    for name in modules:
        if name not in per:
            continue
        data = per[name]
        files.extend(
            data["coercible_files"]
            + data["unknown_files"]
            + data["no_marker_files"]
        )
    return files


def _wall_bl4_pool(
    *, max_size: int = 192, exclude_attempted: bool = True, module: str = "main",
) -> PoolMeasurement:
    per = wall_aware_headroom.scan(
        max_size=max_size,
        exclude_attempted=exclude_attempted,
    )
    selected: list[dict[str, object]] = []
    missing_files = 0
    for item in _wall_files(per, module):
        path = wall_aware_headroom.ROOT / item["path"]
        if not path.is_file():
            missing_files += 1
            continue
        calls = body_call_count(path)
        if calls >= 4:
            selected.append({
                "path": item["path"],
                "text_size": item["text_size"],
                "bl_blx": calls,
            })
    module_arg = f" --module {module}" if module else " --all-modules"
    attempted_arg = " --exclude-attempted" if exclude_attempted else ""
    command = (
        "python tools/pool_freshness.py --pool wall-bl4-small"
        f" --max-size {max_size}{attempted_arg}{module_arg}"
    )
    return PoolMeasurement(
        pool="wall-bl4-small",
        count=len(selected),
        bytes=sum(int(item["text_size"] or 0) for item in selected),
        revision=_revision(),
        command=command,
        definition=(
            "wall_aware_headroom.scan(max_size=N, exclude_attempted=True), "
            "candidate files whose assembly body contains at least four exact "
            "bl/blx call instructions"
        ),
        details={
            "max_size": max_size,
            "exclude_attempted": exclude_attempted,
            "module": module,
            "min_bl_blx": 4,
            "missing_files": missing_files,
            "files": selected,
        },
    )


def measure_pool(
    pool: str,
    *,
    version: str = "eur",
    max_size: int = 192,
    exclude_attempted: bool = True,
    module: str | None = "main",
) -> PoolMeasurement:
    if pool == "data-string-pool":
        return _data_string_pool(version)
    if pool == "wall-bl4-small":
        return _wall_bl4_pool(
            max_size=max_size,
            exclude_attempted=exclude_attempted,
            module=module,
        )
    raise ValueError(f"unknown pool {pool!r}")


def extract_queue_figures(text: str, *, pool: str) -> list[QueueFigure]:
    """Extract count/byte figures only from lines naming the pool shape."""
    terms = {
        "data-string-pool": ("string,string-ascii4", "string pool"),
        "wall-bl4-small": (">=4 bl/blx", "bl/blx", "wall pool"),
    }[pool]
    other_terms = {
        "data-string-pool": (">=4 bl/blx", "bl/blx", "wall pool"),
        "wall-bl4-small": ("string,string-ascii4", "string pool"),
    }[pool]
    lines = text.splitlines()
    figures: list[QueueFigure] = []
    seen: set[tuple[int, int, int | None]] = set()
    for index, line in enumerate(lines):
        if not any(term.lower() in line.lower() for term in terms):
            continue
        # Queue prose commonly wraps the pool name and its figure onto
        # adjacent lines. Keep the extraction textual, but allow that wrap.
        for candidate_index in range(max(0, index - 2), min(len(lines), index + 3)):
            candidate = lines[candidate_index]
            if any(term.lower() in candidate.lower() for term in other_terms):
                continue
            for match in _POOL_FIGURE_RE.finditer(candidate):
                count = int(match.group("count").replace(",", ""))
                byte_count = (
                    int(match.group("bytes").replace(",", ""))
                    if match.group("bytes") else None
                )
                key = (candidate_index + 1, count, byte_count)
                if key in seen:
                    continue
                seen.add(key)
                figures.append(QueueFigure(
                    line=candidate_index + 1,
                    count=count,
                    bytes=byte_count,
                    text=candidate.strip(),
                ))
            if not any(
                figure.line == candidate_index + 1 for figure in figures
            ):
                for match in _BARE_POOL_COUNT_RE.finditer(candidate):
                    count = int(match.group("count").replace(",", ""))
                    key = (candidate_index + 1, count, None)
                    if key in seen:
                        continue
                    seen.add(key)
                    figures.append(QueueFigure(
                        line=candidate_index + 1,
                        count=count,
                        bytes=None,
                        text=candidate.strip(),
                    ))
    return figures


def _queue_date(text: str) -> date | None:
    dates = []
    for match in _DATE_RE.finditer(text):
        try:
            dates.append(datetime.strptime(match.group("date"), "%Y-%m-%d").date())
        except ValueError:
            continue
    return max(dates) if dates else None


def stale_queue_figures(
    text: str,
    measurement: PoolMeasurement,
    *,
    today: date | None = None,
    max_age_days: int = 14,
    merges_since: int = 0,
    max_merges: int = 10,
) -> list[QueueFigure]:
    """Return mismatched queue figures once their freshness window expired."""
    figures = extract_queue_figures(text, pool=measurement.pool)
    recorded = _queue_date(text)
    today = today or date.today()
    age_expired = recorded is not None and (today - recorded) > timedelta(days=max_age_days)
    merge_expired = merges_since > max_merges
    if not (age_expired or merge_expired):
        return []
    return [
        figure for figure in figures
        if figure.count != measurement.count
        or (figure.bytes is not None and figure.bytes != measurement.bytes)
    ]


def _print_measurement(measurement: PoolMeasurement, *, as_json: bool) -> None:
    payload = asdict(measurement)
    if as_json:
        print(json.dumps(payload, indent=2))
        return
    print(f"pool: {measurement.pool}")
    print(f"count: {measurement.count}")
    print(f"bytes: {measurement.bytes}")
    print(f"computed_at: {measurement.revision}")
    print(f"definition: {measurement.definition}")
    print(f"command: {measurement.command}")
    if measurement.details:
        print("details: " + json.dumps(measurement.details, sort_keys=True))


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description="Measure live campaign pool freshness.")
    ap.add_argument("--pool", choices=("data-string-pool", "wall-bl4-small"))
    ap.add_argument("--version", default="eur")
    ap.add_argument("--max-size", type=int, default=192)
    ap.add_argument("--exclude-attempted", action=argparse.BooleanOptionalAction, default=True)
    ap.add_argument("--module", default="main")
    ap.add_argument("--all-modules", action="store_true")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--check-queue", type=Path)
    ap.add_argument("--max-age-days", type=int, default=14)
    ap.add_argument("--merges-since", type=int, default=0)
    ap.add_argument("--max-merges", type=int, default=10)
    args = ap.parse_args(argv)
    if not args.pool:
        ap.error("--pool is required")
    module = None if args.all_modules else args.module
    measurement = measure_pool(
        args.pool,
        version=args.version,
        max_size=args.max_size,
        exclude_attempted=args.exclude_attempted,
        module=module,
    )
    _print_measurement(measurement, as_json=args.json)
    if args.check_queue:
        text = args.check_queue.read_text(encoding="utf-8")
        stale = stale_queue_figures(
            text,
            measurement,
            max_age_days=args.max_age_days,
            merges_since=args.merges_since,
            max_merges=args.max_merges,
        )
        for figure in stale:
            print(
                f"STALE line {figure.line}: {figure.text} "
                f"(live {measurement.count} / {measurement.bytes} B)",
                file=sys.stderr,
            )
        if stale:
            return 1
        print("queue freshness: no expired mismatches")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
