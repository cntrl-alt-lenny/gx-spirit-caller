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


POOL_BY_ITEM = {"q-pool-freshness-tool": "wall-bl4-small"}
# One table is the source of truth for lane-to-worktree routing. Windows was
# brain-verified on 2026-08-22. Mac decomper/scaffolder were confirmed live
# by a Mac brain on 2026-09-07 (both are real worktrees under
# ~/Dev/spirit-caller/). kb-map and kb-types have never been confirmed on
# either host; their entries below are unverified placeholders, and
# VERIFIED_WORKTREES below is what actually gates generation -- adding a row
# here is not enough to make it emittable.
def _mac_worktree(role: str) -> str:
    return f"~/Dev/spirit-caller/claude-{role}-queue"


LANE_WORKTREES = {
    "decomper": {
        "windows": "C:/Users/leona/Dev/gx-spirit-caller/decomper",
        "mac": _mac_worktree("decomper"),
    },
    "scaffolder": {
        "windows": "C:/Users/leona/Dev/gx-spirit-caller/scaffolder",
        "mac": _mac_worktree("scaffolder"),
    },
    "kb-map": {
        "windows": "C:/Users/leona/Dev/gx-spirit-caller/kb-map",
        "mac": "~/Dev/spirit-caller/kb-map",
    },
    "kb-types": {
        "windows": "C:/Users/leona/Dev/gx-spirit-caller/kb-types",
        "mac": "~/Dev/spirit-caller/kb-types",
    },
}
LANES = tuple(LANE_WORKTREES)

# (lane, host) pairs a brain has actually confirmed resolve to a real
# worktree. This is the defect class fix: kb-map/kb-types' mac paths were
# hand-typed guesses that pointed at directories which do not exist, and
# nothing stopped the generator from sending a worker there. A path
# existence check on disk cannot do this job -- the generator commonly runs
# on a different host (or in CI) than the one the emitted path names, so
# "verified" is a fact a brain records here after actually checking, not
# something computed at generation time. Any lane/host added to
# LANE_WORKTREES without a matching entry here stays unverified and
# generation for it is refused.
VERIFIED_WORKTREES = {
    ("decomper", "windows"), ("decomper", "mac"),
    ("scaffolder", "windows"), ("scaffolder", "mac"),
    ("kb-map", "windows"),
    ("kb-types", "windows"),
}


@dataclass(frozen=True)
class LaneSpec:
    lane: str
    host: str
    worktree: str
    interpreter: str
    powershell: bool


class GenerationError(RuntimeError):
    """The generator refused: an unverified worktree, or a skeleton that
    failed its own required lint."""


def lane_spec(lane: str, host: str) -> LaneSpec:
    if lane not in LANES:
        raise ValueError(f"unknown lane {lane!r}; choose from {', '.join(LANES)}")
    if host not in {"windows", "mac"}:
        raise ValueError("host must be windows or mac")
    if (lane, host) not in VERIFIED_WORKTREES:
        raise GenerationError(
            f"{lane}/{host} worktree path is unverified -- a brain must confirm "
            f"{LANE_WORKTREES[lane][host]!r} is a real worktree and add "
            f"({lane!r}, {host!r}) to VERIFIED_WORKTREES before this can be emitted"
        )
    return LaneSpec(
        lane=lane,
        host=host,
        worktree=LANE_WORKTREES[lane][host],
        interpreter="python" if host == "windows" else "python3.13",
        powershell=host == "windows",
    )


def _run_pool(pool: str, target_host: str) -> tuple[int, int, str]:
    # `spec.interpreter` names the interpreter the WORKER will type on the
    # target host; it is not necessarily present on the host GENERATING the
    # kickoff. Measuring the live pool is a local action, so it runs under the
    # generator's own interpreter. The REPRODUCER line printed into the kickoff
    # is unaffected: pool_freshness.py emits its own command string.
    command = [
        sys.executable, "tools/pool_freshness.py", "--pool", pool,
        "--target-host", target_host,
    ]
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
    branch = branch or f"{lane}/kickoff"
    lines = [
        f"{lane.capitalize()} kickoff — lane {lane}, host {host}.",
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
        count, byte_count, command = _run_pool(pool, host)
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
