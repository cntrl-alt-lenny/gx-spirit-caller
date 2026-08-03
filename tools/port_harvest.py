#!/usr/bin/env python
"""Standing cross-region sim==1.0 port harvest.

This is a thin, fail-closed entry point around port_census + batch_port. It
always re-censuses first, hard-codes the proven HIGH confidence floor, and
delegates fastmatch and ROM-gated staging/commits to batch_port.
"""
from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import time
from pathlib import Path

import batch_port as bp
import port_census


ROOT = Path(__file__).resolve().parent.parent
REGIONS = ("usa", "jpn")
COMPETING_PROCESS_PATTERN = "mwcc|mwld|mwasm|ninja"


def competing_processes() -> list[str]:
    """Return machine-wide competing toolchain processes.

    This deliberately uses the same PowerShell predicate as the brain
    protocol.  Failure to inspect the process list is treated as busy: a
    harvest must never start while contention status is unknown.
    """
    if os.name == "nt":
        command = (
            "Get-Process | Where-Object { $_.Name -match "
            f"'{COMPETING_PROCESS_PATTERN}' }} | "
            "Select-Object -ExpandProperty Name"
        )
        argv = ["powershell.exe", "-NoProfile", "-NonInteractive", "-Command", command]
    else:
        argv = ["ps", "-eo", "comm="]
    try:
        result = subprocess.run(argv, capture_output=True, text=True, check=False)
    except OSError:
        return ["process-check-error"]
    if result.returncode != 0:
        return ["process-check-error"]
    if os.name == "nt":
        return sorted(line.strip() for line in result.stdout.splitlines() if line.strip())
    return sorted(
        line.strip() for line in result.stdout.splitlines()
        if re.search(COMPETING_PROCESS_PATTERN, line, re.IGNORECASE)
    )


def _contention_clear() -> bool:
    names = competing_processes()
    if names:
        print("HARVEST: deferred, machine busy — " + ", ".join(names))
        return False
    return True


def _empty_report(entries: list[dict], *, deferred: bool = False) -> dict:
    floor = len(bp.filter_sim1_backlog(entries))
    return {
        "rows_censused": len(entries),
        "sim1_floor_rows": floor,
        "ported": 0,
        "refused_by_class": {},
        "prefilter_tool_errors": 0,
        "stale": 0,
        "tool_errors": 0,
        "deferred": floor if deferred else 0,
        "contention_deferred": floor if deferred else 0,
        "gates_consumed": 0,
        "commits": 0,
    }


def recensus() -> dict[str, list[dict]]:
    """Refresh and return the tool-produced backlog."""
    port_census.ROOT = ROOT
    port_census.SCRATCH = ROOT / "build"
    port_census.main()
    path = ROOT / "build" / "port_backlog.json"
    return json.loads(path.read_text(encoding="utf-8")).get("backlog", {})


def _check_safe_start(ops: bp.PortOps) -> str | None:
    branch = ops.current_branch()
    guard = bp.bc.branch_guard_message(
        branch, ops.is_detached_at_origin_main(), False
    )
    if guard:
        return f"unsafe branch {branch!r}: {guard}"
    dirty = ops._run(["git", "status", "--porcelain"]).stdout.strip()
    if dirty:
        return "working tree is not clean; refusing to auto-commit"
    return None


def _report_for(region: str, entries: list[dict], report: bp.Report) -> dict:
    refused = dict(report.refused_by_class)
    if report.parked_needs_symbol:
        refused["needs-symbols-txt-line"] = len(report.parked_needs_symbol)
    if report.prefilter_refuse:
        refused["fastmatch-prefilter"] = len(report.prefilter_refuse)
    if report.gate_fail:
        refused["rom-gate-fail"] = len(report.gate_fail)
    return {
        "rows_censused": len(entries),
        "sim1_floor_rows": len(bp.filter_sim1_backlog(entries)),
        "ported": len(report.passed),
        "refused_by_class": refused,
        "prefilter_tool_errors": len(report.prefilter_tool_error),
        "stale": len(report.stale),
        "tool_errors": len(report.tool_error),
        "deferred": len(report.deferred),
        "contention_deferred": len(report.contention_deferred),
        "gates_consumed": report.gate_calls,
        "commits": report.committed_batches,
    }


def _has_retryable_error(reports: dict[str, dict]) -> bool:
    return any(
        r["prefilter_tool_errors"] or r["tool_errors"]
        or r["deferred"] > r.get("contention_deferred", 0)
        for r in reports.values()
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Re-census and harvest only sim==1.0 HIGH-floor ports."
    )
    parser.add_argument(
        "--batch", type=int, default=20,
        help="ports per ROM gate batch (default: 20)",
    )
    args = parser.parse_args(argv)
    if args.batch < 1:
        parser.error("--batch must be positive")

    started = time.monotonic()
    if not _contention_clear():
        elapsed = time.monotonic() - started
        print(json.dumps({
            "status": "deferred",
            "reason": "machine busy or process check unavailable",
            "rows_censused": 0,
            "sim1_floor_rows": 0,
            "ported": 0,
            "gates_consumed": 0,
            "commits": 0,
            "wall_clock_seconds": round(elapsed, 3),
        }, sort_keys=True))
        return 0
    check_ops = bp.PortOps(version="usa")
    unsafe = _check_safe_start(check_ops)
    if unsafe:
        print(f"HARVEST: REFUSING — {unsafe}")
        return 2

    backlog = recensus()
    reports: dict[str, dict] = {}
    total_floor = sum(
        len(bp.filter_sim1_backlog(backlog.get(region, [])))
        for region in REGIONS
    )
    if total_floor == 0:
        elapsed = time.monotonic() - started
        print(
            "HARVEST: nothing to harvest at the sim==1.0 HIGH/EXACT floor "
            "(0 floor rows); no ports, gates, or commits performed."
        )
        print(json.dumps({
            "rows_censused": sum(len(backlog.get(r, [])) for r in REGIONS),
            "sim1_floor_rows": 0,
            "ported": 0,
            "gates_consumed": 0,
            "commits": 0,
            "wall_clock_seconds": round(elapsed, 3),
        }, sort_keys=True))
        return 0

    for region in REGIONS:
        entries = backlog.get(region, [])
        if not bp.filter_sim1_backlog(entries):
            reports[region] = _empty_report(entries)
            continue
        print(f"HARVEST: {region} — HIGH floor only, batch={args.batch}")
        ops = bp.PortOps(version=region)
        prepared, reason = ops.prepare_reference_objects()
        if not prepared:
            print(f"HARVEST: {region} — tool-error before prefilter: {reason}")
            reports[region] = _empty_report(entries)
            reports[region]["tool_errors"] = 1
            continue
        contention_deferred = False

        def before_batch() -> bool:
            nonlocal contention_deferred
            ok = _contention_clear()
            if not ok:
                contention_deferred = True
            return ok

        report = bp.BatchPorter(
            region, ops, batch=args.batch, confidence_floor="HIGH", log=print,
            before_batch=before_batch,
        ).run(entries)
        reports[region] = _report_for(region, entries, report)
        if contention_deferred:
            for later in REGIONS[REGIONS.index(region) + 1:]:
                reports[later] = _empty_report(
                    backlog.get(later, []), deferred=True
                )
            break

    elapsed = time.monotonic() - started
    total_ported = sum(r["ported"] for r in reports.values())
    summary = {
        "status": "deferred" if any(
            r.get("contention_deferred", 0) for r in reports.values()
        ) else "completed",
        "rows_censused": sum(r["rows_censused"] for r in reports.values()),
        "sim1_floor_rows": sum(r["sim1_floor_rows"] for r in reports.values()),
        "ported": total_ported,
        "regions": reports,
        "gates_consumed": sum(r["gates_consumed"] for r in reports.values()),
        "commits": sum(r["commits"] for r in reports.values()),
        "wall_clock_seconds": round(elapsed, 3),
    }
    print("HARVEST REPORT:")
    print(json.dumps(summary, indent=2, sort_keys=True))
    if summary["status"] == "deferred":
        print("HARVEST: deferred, machine busy — prior green batches remain "
              "committed; no further batches attempted.")
    if total_ported == 0:
        print(
            "HARVEST: nothing harvestable passed the HIGH/EXACT floor "
            "this run; clean exit, no false success claimed."
        )
    if _has_retryable_error(reports):
        print("HARVEST: retryable tool error or deferred gate; refusing success")
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
