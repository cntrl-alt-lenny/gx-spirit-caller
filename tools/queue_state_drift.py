#!/usr/bin/env python3
"""Find contradictions between queue/state claims and repository state.

This is a small audit tool, not a replacement queue format. It checks explicit
shipped/resolved/merged evidence in non-final queue items, compares the current
state section with the ACTIVE open PRs, and verifies that docs/state.md carries
a `main-sha:` anchor that still describes the current tip.

Parked status is an EXPLICIT declaration (a `parked` label, or a `[parked]` /
`PARKED` marker in the PR title) — it is deliberately NOT inferred from
GitHub's draft bit. The worker lanes publish ordinary output as draft PRs
(the `yeet` skill opens drafts by default), so equating draft with parked hid
every active worker PR from the active count and made the state claim
unfalsifiable.
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
_PARKED_TITLE_RE = re.compile(r"\[parked\]|\bPARKED\b")
_PARKED_DECL_RE = re.compile(r"parked-prs:\s*([0-9,\s]+)", re.I)
_MAIN_SHA_RE = re.compile(r"main-sha:\s*`?([0-9a-f]{7,40})`?", re.I)
# The state doc is written BEFORE its own doc-PR merges, so at write time the
# anchor names the current tip and main later gains that merge. A round can
# legitimately need a follow-up bookkeeping PR (round 0808 needed two: the
# repair itself, then a correction to its own PR-count claim), so allow two.
# Beyond that means real work landed without the handoff doc being updated --
# the failure this check exists for was five PRs deep, so 2 still catches it.
_STALE_MERGE_TOLERANCE = 2


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


def parked_numbers(state_text: str) -> set[int]:
    """PR numbers the project has EXPLICITLY declared parked.

    Declared in docs/state.md as `<!-- parked-prs: 1020, 1234 -->` so the
    declaration is version-controlled and reviewable, rather than depending on
    mutable GitHub-side state.
    """
    match = _PARKED_DECL_RE.search(state_text)
    if not match:
        return set()
    return {int(n) for n in re.findall(r"\d+", match.group(1))}


def is_parked(pr: dict, declared: set[int] | None = None) -> bool:
    """Parked is declared explicitly; it is never inferred from `isDraft`.

    A draft PR is how the worker lanes ship normal output, so the draft bit
    says nothing about whether an item is parked. Only an in-repo declaration,
    a `parked` label, or a `[parked]` / `PARKED` title marker counts.
    """
    if declared and pr.get("number") in declared:
        return True
    for label in pr.get("labels") or []:
        name = label.get("name") if isinstance(label, dict) else label
        if isinstance(name, str) and name.strip().lower() == "parked":
            return True
    return bool(_PARKED_TITLE_RE.search(pr.get("title") or ""))


def state_sha_findings(state_text: str, anchor_checker) -> list[Finding]:
    """Verify docs/state.md's `main-sha:` anchor still describes the tip.

    `anchor_checker(sha)` returns (is_ancestor, merges_since) for the ref.
    This catches a stale handoff doc even when it makes no PR-count claim —
    the failure mode that let state.md sit five merged PRs behind.
    """
    match = _MAIN_SHA_RE.search(_current_state_section(state_text))
    if not match:
        return [Finding(
            "state", "docs/state.md",
            "no `main-sha:` freshness anchor in the current state section — "
            "a stale handoff cannot be detected without one",
        )]
    sha = match.group(1)
    is_ancestor, merges_since = anchor_checker(sha)
    if not is_ancestor:
        return [Finding(
            "state", "docs/state.md",
            f"`main-sha: {sha}` is not an ancestor of the ref — the anchor "
            "names a commit that never landed",
        )]
    if merges_since > _STALE_MERGE_TOLERANCE:
        return [Finding(
            "state", "docs/state.md",
            f"`main-sha: {sha}` is {merges_since} PR-merges behind the ref "
            f"(tolerance {_STALE_MERGE_TOLERANCE}) — the handoff doc is stale",
        )]
    return []


def state_findings(state_text: str, open_prs: list[dict]) -> tuple[list[Finding], int, int]:
    """Compare the current state claim with the ACTIVE open PRs."""
    claim = _state_claim(state_text)
    declared = parked_numbers(state_text)
    parked = sum(is_parked(pr, declared) for pr in open_prs)
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
        f"({parked} explicitly-parked PR(s) excluded from active count)",
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


def main_anchor_checker(repo: Path, ref: str):
    """Return (is_ancestor, merges_since) for a candidate anchor sha."""
    def check(sha: str) -> tuple[bool, int]:
        if _git(repo, "merge-base", "--is-ancestor", sha, ref).returncode != 0:
            return False, 0
        merges = _git(repo, "rev-list", "--count", "--merges", f"{sha}..{ref}")
        try:
            return True, int(merges.stdout.strip() or 0)
        except ValueError:
            return True, 0

    return check


def _load_prs(repo: Path, fixture: str | None) -> list[dict]:
    if fixture:
        return json.loads(Path(fixture).read_text(encoding="utf-8"))
    result = subprocess.run(
        ["gh", "pr", "list", "--state", "open", "--limit", "1000",
         "--json", "number,isDraft,title,headRefName,labels"],
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
    state_text = args.state.read_text(encoding="utf-8")
    state_findings_list, active, parked = state_findings(state_text, prs)
    findings.extend(state_findings_list)
    findings.extend(state_sha_findings(
        state_text, main_anchor_checker(repo, args.ref),
    ))
    print(f"queue files scanned: {len(queue_paths)}")
    print(f"active open PRs: {active}; explicitly-parked excluded: {parked}")
    for finding in findings:
        print(f"DRIFT [{finding.kind}] {finding.source}: {finding.detail}")
    print(f"QUEUE-STATE DRIFT: {len(findings)} finding(s)")
    return 1 if findings else 0


if __name__ == "__main__":
    raise SystemExit(main())
