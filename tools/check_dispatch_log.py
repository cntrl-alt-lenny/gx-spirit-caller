#!/usr/bin/env python3
"""Require a new dispatch-log row when a round updates the state handoff."""
from __future__ import annotations

import argparse
import re
import subprocess
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
_ROUND_ROW_RE = re.compile(r"^\|\s*([0-9]{4}[a-z]?)\s*\|")
_LAST_UPDATED_RE = re.compile(r"^\*\*Last updated:\*\*")


@dataclass(frozen=True)
class CheckResult:
    ok: bool
    skipped: bool = False
    detail: str = ""


def _git(repo: Path, *args: str) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        ["git", "-C", str(repo), *args],
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        check=False,
    )


def is_shallow_repository(repo: Path) -> bool:
    result = _git(repo, "rev-parse", "--is-shallow-repository")
    return result.returncode == 0 and result.stdout.strip().lower() == "true"


def _show(repo: Path, ref: str, path: str) -> str | None:
    result = _git(repo, "show", f"{ref}:{path}")
    return result.stdout if result.returncode == 0 else None


def _last_updated_block(text: str | None) -> tuple[str, ...] | None:
    if text is None:
        return None
    lines = text.splitlines()
    try:
        start = next(i for i, line in enumerate(lines) if _LAST_UPDATED_RE.match(line))
    except StopIteration:
        return None
    end = start + 1
    while end < len(lines) and lines[end].strip():
        end += 1
    return tuple(lines[start:end])


def dispatch_rounds(text: str | None) -> set[str]:
    if text is None:
        return set()
    return {
        match.group(1)
        for line in text.splitlines()
        if (match := _ROUND_ROW_RE.match(line))
    }


def check_texts(
    state_base: str | None,
    state_head: str | None,
    log_base: str | None,
    log_head: str | None,
) -> CheckResult:
    """Check two base/head snapshots without consulting the live repository."""
    before = _last_updated_block(state_base)
    after = _last_updated_block(state_head)
    if before is None or after is None or before == after:
        return CheckResult(True, detail="state Last updated block unchanged; dispatch row not required")
    added = dispatch_rounds(log_head) - dispatch_rounds(log_base)
    if not added:
        return CheckResult(
            False,
            detail=(
                "docs/state.md Last updated block changed, but docs/dispatch-log.md "
                "has no newly-added round id"
            ),
        )
    return CheckResult(
        True,
        detail=(
            "state Last updated block changed; new dispatch round id(s): "
            + ", ".join(sorted(added))
        ),
    )


def check_repository(repo: Path, base: str, head: str) -> CheckResult:
    if is_shallow_repository(repo):
        return CheckResult(
            True,
            skipped=True,
            detail="SKIP: shallow clone; dispatch-log history comparison requires a full clone",
        )
    return check_texts(
        _show(repo, base, "docs/state.md"),
        _show(repo, head, "docs/state.md"),
        _show(repo, base, "docs/dispatch-log.md"),
        _show(repo, head, "docs/dispatch-log.md"),
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=ROOT)
    parser.add_argument("--base", default="origin/main")
    parser.add_argument("--head", default="HEAD")
    args = parser.parse_args(argv)
    result = check_repository(args.repo, args.base, args.head)
    print(f"dispatch-log-lint: {result.detail}")
    return 0 if result.ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
