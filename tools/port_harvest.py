#!/usr/bin/env python
"""Standing cross-region sim==1.0 port harvest.

This is a thin, fail-closed entry point around port_census + batch_port. It
always re-censuses first, hard-codes the proven HIGH confidence floor, and
delegates fastmatch and ROM-gated staging/commits to batch_port.
"""
from __future__ import annotations

import argparse
import json
import time
from pathlib import Path

import batch_port as bp
import port_census


ROOT = Path(__file__).resolve().parent.parent
REGIONS = ("usa", "jpn")


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
        "gates_consumed": report.gate_calls,
        "commits": report.committed_batches,
    }


def _has_retryable_error(reports: dict[str, dict]) -> bool:
    return any(
        r["prefilter_tool_errors"] or r["tool_errors"] or r["deferred"]
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
            reports[region] = {
                "rows_censused": len(entries),
                "sim1_floor_rows": 0,
                "ported": 0,
                "refused_by_class": {},
                "prefilter_tool_errors": 0,
                "stale": 0,
                "tool_errors": 0,
                "deferred": 0,
                "gates_consumed": 0,
                "commits": 0,
            }
            continue
        print(f"HARVEST: {region} — HIGH floor only, batch={args.batch}")
        ops = bp.PortOps(version=region)
        report = bp.BatchPorter(
            region, ops, batch=args.batch, confidence_floor="HIGH", log=print
        ).run(entries)
        reports[region] = _report_for(region, entries, report)

    elapsed = time.monotonic() - started
    total_ported = sum(r["ported"] for r in reports.values())
    summary = {
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
