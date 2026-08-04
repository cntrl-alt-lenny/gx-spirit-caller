#!/usr/bin/env python3
"""Find contradictions between queue/state claims and repository state.

This is a small audit tool, not a replacement queue format. It checks explicit
shipped/resolved/merged evidence in non-final queue items and compares the
current state section with non-draft open PRs. Parked drafts are reported but
excluded from the active count.
"""
from __future__ import annotations

import argparse
import json
import re
import subprocess
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

import sys

sys.path.insert(0, str(ROOT / "tools"))
from work_queue import _items, _section  # noqa: E402


_SHIPPED_RE = re.compile(r"\b(?:already\s+)?(?:shipped|resolved|merged|landed)\b", re.I)
_NEGATED_SHIPPED_RE = re.compile(r"\b(?:nothing|not|never|no)\s+shipped\b", re.I)
_PATH_RE = re.compile(r"`((?:tools|src|config|docs)/[^`\s]+)`")
_COMMIT_RE = re.compile(r"\b[0-9a-f]{9,40}\b", re.I)
_OPEN_RE = re.compile(r"\bOpen PRs?:\s*\*{0,2}(\d+)\*{0,2}", re.I)
_OPEN_COUNT_RE = re.compile(r"\bOpen PR count is\s+\*{0,2}(\d+)\*{0,2}", re.I)
_ACTIVE_RE = re.compile(
    r"\*{0,2}active\*{0,2}\s+count\s+is\s*\*{0,2}(\d+)\*{0,2}",
    re.I,
)


@dataclass(frozen=True)
class Finding:
    kind: str
    source: str
    detail: str


def _is_artifact_path(path: str) -> bool:
    return not (path.startswith("docs/queue/") or path == "docs/state.md")


def queue_findings(text: str, source: str, artifact_exists) -> list[Finding]:
    """Find TODO/CLAIMED items with concrete shipped artifact evidence."""
    findings: list[Finding] = []
    for item in _items(text):
        if item.group("status") not in {"TODO", "CLAIMED"}:
            continue
        section = _section(text, item)
        for line in section.splitlines():
            if not _SHIPPED_RE.search(line) or _NEGATED_SHIPPED_RE.search(line):
                continue
            paths = [
                path for path in _PATH_RE.findall(line)
                if _is_artifact_path(path) and artifact_exists(path)
            ]
            commits = [commit for commit in _COMMIT_RE.findall(line) if artifact_exists(commit)]
            # A hash alone often describes a prerequisite or historical item;
            # require a concrete non-bookkeeping path to call the item stale.
            if not paths:
                continue
            evidence = [f"path {path}" for path in paths]
            evidence.extend(f"commit {commit}" for commit in commits)
            findings.append(Finding(
                "queue",
                f"{source}:{item.group('id')}",
                f"[{item.group('status')}] has shipped/resolved evidence on main "
                f"({', '.join(evidence)})",
            ))
            break
    return findings


def _current_state_section(text: str) -> str:
    return text.split("**Previously", 1)[0]


def _state_claim(text: str) -> tuple[str, int] | None:
    current = _current_state_section(text)
    active = _ACTIVE_RE.search(current)
    if active:
        return "active", int(active.group(1))
    open_count = _OPEN_RE.search(current) or _OPEN_COUNT_RE.search(current)
    if open_count:
        return "open", int(open_count.group(1))
    return None


def state_findings(state_text: str, open_prs: list[dict]) -> tuple[list[Finding], int, int]:
    """Compare the current state claim with non-draft open PRs."""
    claim = _state_claim(state_text)
    parked = sum(bool(pr.get("isDraft")) for pr in open_prs)
    active = len(open_prs) - parked
    if claim is None:
        return [], active, parked
    kind, expected = claim
    # A plain "Open PRs" claim is still an activity claim for drift purposes:
    # parked drafts are legitimately open and must not create a false finding.
    actual = active
    if expected == actual:
        return [], active, parked
    counted = f"{actual} {kind} PR(s)"
    return [Finding(
        "state",
        "docs/state.md",
        f"claims {kind} PRs: {expected}, but {counted} exist "
        f"({parked} parked draft(s) excluded from active count)",
    )], active, parked


def _git(repo: Path, *args: str) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        ["git", "-C", str(repo), *args],
        text=True,
        capture_output=True,
        check=False,
    )


def main_artifact_checker(repo: Path, ref: str):
    def exists(value: str) -> bool:
        if "/" in value:
            return _git(repo, "cat-file", "-e", f"{ref}:{value}").returncode == 0
        return _git(repo, "merge-base", "--is-ancestor", value, ref).returncode == 0

    return exists


def _load_prs(repo: Path, fixture: str | None) -> list[dict]:
    if fixture:
        return json.loads(Path(fixture).read_text(encoding="utf-8"))
    result = subprocess.run(
        ["gh", "pr", "list", "--state", "open", "--limit", "1000",
         "--json", "number,isDraft,title,headRefName"],
        cwd=repo,
        text=True,
        capture_output=True,
        check=False,
    )
    if result.returncode:
        raise RuntimeError(result.stderr.strip() or "gh pr list failed")
    return json.loads(result.stdout)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=ROOT)
    parser.add_argument("--ref", default="origin/main")
    parser.add_argument("--state", type=Path, default=ROOT / "docs/state.md")
    parser.add_argument("--queue-glob", default="docs/queue/*.md")
    parser.add_argument("--pr-json", help="fixture JSON from gh pr list")
    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    repo = args.repo.resolve()
    checker = main_artifact_checker(repo, args.ref)
    findings: list[Finding] = []
    queue_paths = sorted(repo.glob(args.queue_glob))
    for path in queue_paths:
        findings.extend(queue_findings(
            path.read_text(encoding="utf-8"),
            str(path.relative_to(repo)),
            checker,
        ))
    try:
        prs = _load_prs(repo, args.pr_json)
    except (OSError, RuntimeError, json.JSONDecodeError) as exc:
        print(f"PR LIST ERROR: {exc}")
        return 2
    state_findings_list, active, parked = state_findings(
        args.state.read_text(encoding="utf-8"), prs,
    )
    findings.extend(state_findings_list)
    print(f"queue files scanned: {len(queue_paths)}")
    print(f"active open PRs: {active}; parked drafts excluded: {parked}")
    for finding in findings:
        print(f"DRIFT [{finding.kind}] {finding.source}: {finding.detail}")
    print(f"QUEUE-STATE DRIFT: {len(findings)} finding(s)")
    return 1 if findings else 0


if __name__ == "__main__":
    raise SystemExit(main())
