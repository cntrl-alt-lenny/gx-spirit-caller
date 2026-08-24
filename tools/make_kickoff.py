#!/usr/bin/env python3
"""Emit and self-lint the mechanical part of an agent kickoff."""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

import kickoff_lint  # noqa: E402


LANES = ("decomper", "scaffolder", "kb-map", "kb-types")
POOL_BY_ITEM = {"q-pool-freshness-tool": "wall-bl4-small"}
WINDOWS_ROOT = "C:/Users/leona/Dev/gx-spirit-caller"
MAC_ROOT = "~/Dev/spirit-caller"


@dataclass(frozen=True)
class LaneSpec:
    lane: str
    host: str
    worktree: str
    interpreter: str
    powershell: bool


class GenerationError(RuntimeError):
    """The requested skeleton failed its own required lint."""


def lane_spec(lane: str, host: str) -> LaneSpec:
    if lane not in LANES:
        raise ValueError(f"unknown lane {lane!r}; choose from {', '.join(LANES)}")
    if host not in {"windows", "mac"}:
        raise ValueError("host must be windows or mac")
    root = WINDOWS_ROOT if host == "windows" else MAC_ROOT
    return LaneSpec(
        lane=lane,
        host=host,
        worktree=f"{root}/{lane}",
        interpreter="python" if host == "windows" else "python3.13",
        powershell=host == "windows",
    )


def _run_pool(interpreter: str, pool: str) -> tuple[int, int, str]:
    command = [interpreter, "tools/pool_freshness.py", "--pool", pool]
    result = subprocess.run(
        command,
        cwd=ROOT,
        capture_output=True,
        text=True,
        check=False,
    )
    if result.returncode:
        raise GenerationError(
            f"pool freshness failed for {pool}: {result.stderr.strip()}"
        )
    values: dict[str, str] = {}
    for line in result.stdout.splitlines():
        key, separator, value = line.partition(":")
        if separator:
            values[key.strip()] = value.strip()
    try:
        return int(values["count"]), int(values["bytes"]), values["command"]
    except (KeyError, ValueError) as exc:
        raise GenerationError(
            f"pool freshness returned no usable count/bytes for {pool}"
        ) from exc


def _windows_preflight(spec: LaneSpec, item: str | None, branch: str) -> list[str]:
    lines = [
        "PREFLIGHT — STOP-and-report on any failure:",
        f"    Set-Location '{spec.worktree}'",
        f"    $EXPECT = '{spec.worktree}'",
        "    if ((git rev-parse --show-toplevel) -ne $EXPECT) { Write-Output 'WRONG WORKTREE'; exit 1 }",
        "    if (-not (Test-Path tools/kickoff_lint.py)) { Write-Output 'MISSING LINTER'; exit 1 }",
        "    if (-not (Test-Path tests/test_kickoff_lint.py)) { Write-Output 'MISSING TEST'; exit 1 }",
        "    if (-not (Test-Path tools/work_queue.py)) { Write-Output 'MISSING QUEUE TOOL'; exit 1 }",
        "    git fetch origin",
        f"    git checkout -B {branch} origin/main",
    ]
    next_command = f"{spec.interpreter} tools/work_queue.py next {spec.lane}"
    lines.append(f"    $NEXT = {next_command} | Out-String")
    if item:
        lines.append(
            f"    if ($NEXT -notmatch '{re.escape(item)}') {{ Write-Output 'WRONG QUEUE ITEM'; exit 1 }}"
        )
    else:
        lines.append(
            "    if ([string]::IsNullOrWhiteSpace($NEXT)) { Write-Output 'EMPTY QUEUE OUTPUT'; exit 1 }"
        )
    lines.append(f"    {spec.interpreter} tools/work_queue.py next {spec.lane} --claim")
    return lines


def _mac_preflight(spec: LaneSpec, item: str | None, branch: str) -> list[str]:
    lines = [
        "PREFLIGHT — STOP-and-report on any failure:",
        f'    cd {spec.worktree} || {{ echo "CANNOT REACH WORKTREE"; exit 1; }}',
        f'    EXPECT="{spec.worktree}"',
        '    [ "$(git rev-parse --show-toplevel)" = "$EXPECT" ] || { echo "WRONG WORKTREE"; exit 1; }',
        '    test -f tools/kickoff_lint.py || { echo "MISSING LINTER"; exit 1; }',
        '    test -f tests/test_kickoff_lint.py || { echo "MISSING TEST"; exit 1; }',
        '    test -f tools/work_queue.py || { echo "MISSING QUEUE TOOL"; exit 1; }',
        "    git fetch origin",
        f"    git checkout -B {branch} origin/main",
    ]
    next_command = f"{spec.interpreter} tools/work_queue.py next {spec.lane}"
    lines.append(f'    NEXT="$({next_command})"')
    if item:
        lines.append(
            f"    printf '%s\\n' \"$NEXT\" | grep -q '{re.escape(item)}' || {{ echo \"WRONG QUEUE ITEM\"; exit 1; }}"
        )
    else:
        lines.append(
            '    test -n "$NEXT" || { echo "EMPTY QUEUE OUTPUT"; exit 1; }'
        )
    lines.append(f"    {spec.interpreter} tools/work_queue.py next {spec.lane} --claim")
    return lines


def render(
    lane: str,
    host: str,
    *,
    item: str | None = None,
    branch: str | None = None,
) -> str:
    spec = lane_spec(lane, host)
    branch = branch or f"codex/{lane}-kickoff"
    lines = [
        f"Codex Scaffolder kickoff — lane {lane}, host {host}.",
        "SET YOUR REASONING EFFORT TO HIGH.",
    ]
    if spec.powershell:
        lines.extend(_windows_preflight(spec, item, branch))
    else:
        lines.extend(_mac_preflight(spec, item, branch))
    lines.extend([
        "CANARY: verify the first item before any bulk work and paste the result.",
        f"Finish: paste the real {spec.interpreter} -m pytest -q tests tail, the unittest tail, and ruff check output.",
    ])
    if item in POOL_BY_ITEM:
        pool = POOL_BY_ITEM[item]
        count, byte_count, command = _run_pool(spec.interpreter, pool)
        lines.extend([
            f"LIVE POOL {pool}: {count} candidates / {byte_count} B.",
            f"REPRODUCER: {command}",
        ])
    return "\n".join(lines) + "\n"


def required_failures(text: str) -> list[kickoff_lint.Check]:
    return [check for check in kickoff_lint.lint(text) if check.required and not check.ok]


def validate(text: str) -> str:
    failures = required_failures(text)
    if failures:
        details = "; ".join(f"{check.key}: {check.detail}" for check in failures)
        raise GenerationError(f"generated kickoff refused by kickoff_lint: {details}")
    return text


def generate(
    lane: str,
    host: str,
    *,
    item: str | None = None,
    branch: str | None = None,
) -> str:
    return validate(render(lane, host, item=item, branch=branch))


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Emit a self-linting kickoff skeleton.")
    parser.add_argument("--lane", required=True, choices=LANES)
    parser.add_argument("--host", required=True, choices=("windows", "mac"))
    parser.add_argument("--item")
    parser.add_argument("--branch")
    args = parser.parse_args(argv)
    try:
        sys.stdout.write(generate(args.lane, args.host, item=args.item, branch=args.branch))
    except (GenerationError, ValueError) as exc:
        print(f"make_kickoff: REFUSED — {exc}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
