#!/usr/bin/env python3
"""integrate.py — deterministic merge-round driver for the brain lane.

Merge a list of reviewed branches into the current integration branch with
the repository's three recurring conflict policies, then refresh generated
indexes and run the requested gate.  The driver deliberately does not push:
the integration branch remains a reviewable local result.

Conflict policy:

* ``config/**/delinks.txt`` keeps ours and is canonicalized with
  :mod:`tools.sort_delinks`.
* ``docs/queue/**`` is a stable union of queue sections, de-duplicated by
  their ``q-*`` heading and normalized for Markdown MD022 spacing.
* ``docs/research/README.md`` is regenerated from the research notes.

Unknown conflicts stop the round and abort the in-progress merge.  Use
``--dry-run`` to preview two or more real branches, including the typed
resolver selected for each changed path, without changing the worktree.
"""

from __future__ import annotations

import argparse
import re
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PY = sys.executable
QUEUE_HEADING = re.compile(r"^###\s+(q-[^\s—]+)(?:\s+.*)?$")
ANY_HEADING = re.compile(r"^#{1,6}\s+")


def conflict_kind(path: str) -> str:
    """Return the named resolver for a path, or ``unknown``."""
    path = path.replace("\\", "/")
    if path.startswith("config/") and path.endswith("/delinks.txt"):
        return "delinks-keep-ours-sort"
    if path.startswith("docs/queue/"):
        return "queue-union-dedup"
    if path == "docs/research/README.md":
        return "research-index-regenerate"
    return "unknown"


def _queue_sections(text: str) -> tuple[str, list[tuple[str, str]]]:
    """Split a queue document into its preamble and keyed ``q-*`` blocks."""
    lines = text.splitlines(keepends=True)
    starts: list[tuple[int, str]] = []
    for i, line in enumerate(lines):
        match = QUEUE_HEADING.match(line.rstrip("\r\n"))
        if match:
            starts.append((i, match.group(1)))
    if not starts:
        return text, []
    preamble = "".join(lines[: starts[0][0]])
    sections: list[tuple[str, str]] = []
    for n, (start, key) in enumerate(starts):
        end = starts[n + 1][0] if n + 1 < len(starts) else len(lines)
        sections.append((key, "".join(lines[start:end])))
    return preamble, sections


def _md022(text: str) -> str:
    """Ensure blank lines surround Markdown headings without reflowing prose."""
    lines = text.splitlines()
    out: list[str] = []
    for line in lines:
        if ANY_HEADING.match(line):
            if out and out[-1].strip():
                out.append("")
            out.append(line)
            continue
        if out and ANY_HEADING.match(out[-1]) and line.strip():
            out.append("")
        out.append(line)
    result = "\n".join(out).rstrip() + "\n"
    return result


def union_queue_docs(ours: str, theirs: str) -> str:
    """Union queue sections, keeping ours on duplicate IDs.

    Keeping the current branch's section for a duplicate makes status changes
    deterministic; a later integration round can still merge the other
    branch after the item is claimed or completed.
    """
    ours_preamble, ours_sections = _queue_sections(ours)
    theirs_preamble, theirs_sections = _queue_sections(theirs)
    if not ours_sections and not theirs_sections:
        # This is not a queue-shaped document; preserve both sides once.
        return _md022(ours.rstrip() + "\n\n" + theirs.lstrip())

    preamble = ours_preamble or theirs_preamble
    merged: list[tuple[str, str]] = []
    seen: set[str] = set()
    for key, section in ours_sections:
        if key not in seen:
            merged.append((key, section))
            seen.add(key)
    for key, section in theirs_sections:
        if key not in seen:
            merged.append((key, section))
            seen.add(key)
    return _md022(preamble + "\n".join(section.rstrip() for _, section in merged))


def summary_from_name_status(lines: list[str]) -> tuple[int, int]:
    """Count added C sources and removed assembly sources from name-status."""
    c_added = 0
    s_removed = 0
    for line in lines:
        fields = line.split("\t")
        status = fields[0]
        paths = fields[1:]
        if status.startswith("A") and any(p.endswith(".c") for p in paths):
            c_added += 1
        if status.startswith("D") and any(p.endswith(".s") for p in paths):
            s_removed += 1
    return c_added, s_removed


def _run(cmd: list[str], *, capture: bool = False) -> subprocess.CompletedProcess[str]:
    print("$ " + " ".join(cmd), flush=True)
    return subprocess.run(
        cmd,
        cwd=ROOT,
        text=True,
        capture_output=capture,
        check=False,
    )


def _git_text(*args: str) -> str:
    result = subprocess.run(
        ["git", *args], cwd=ROOT, text=True, capture_output=True, check=True
    )
    return result.stdout


def _conflicts() -> list[str]:
    result = subprocess.run(
        ["git", "diff", "--name-only", "--diff-filter=U"],
        cwd=ROOT, text=True, capture_output=True, check=True,
    )
    return [line for line in result.stdout.splitlines() if line]


def _resolve_queue(path: str) -> None:
    ours = _git_text("show", f":2:{path}")
    theirs = _git_text("show", f":3:{path}")
    (ROOT / path).write_text(union_queue_docs(ours, theirs), encoding="utf-8")
    _run(["git", "add", "--", path])


def _resolve_delinks(path: str) -> None:
    if _run(["git", "checkout", "--ours", "--", path]).returncode:
        raise RuntimeError(f"could not keep ours for {path}")
    sorter = ROOT / "tools" / "sort_delinks.py"
    result = _run([PY, str(sorter.relative_to(ROOT)), path])
    if result.returncode:
        raise RuntimeError(f"delink sort failed for {path}")
    _run(["git", "add", "--", path])


def _resolve_research_index(path: str) -> None:
    if _run(["git", "checkout", "--ours", "--", path]).returncode:
        raise RuntimeError(f"could not keep ours for {path}")
    result = _run([PY, "tools/generate_research_index.py"])
    if result.returncode:
        raise RuntimeError("research index regeneration failed")
    _run(["git", "add", "--", path])


def resolve_conflicts(paths: list[str]) -> None:
    """Resolve all known conflicts or abort before touching the next branch."""
    unknown = [path for path in paths if conflict_kind(path) == "unknown"]
    if unknown:
        _run(["git", "merge", "--abort"])
        raise RuntimeError("unknown conflicts; merge aborted: " + ", ".join(unknown))
    for path in paths:
        kind = conflict_kind(path)
        print(f"resolve {path}: {kind}")
        if kind == "delinks-keep-ours-sort":
            _resolve_delinks(path)
        elif kind == "queue-union-dedup":
            _resolve_queue(path)
        elif kind == "research-index-regenerate":
            _resolve_research_index(path)
    remaining = _conflicts()
    if remaining:
        _run(["git", "merge", "--abort"])
        raise RuntimeError("conflicts remained; merge aborted: " + ", ".join(remaining))


def changed_paths(branch: str) -> list[str]:
    result = subprocess.run(
        ["git", "diff", "--name-only", "HEAD", branch],
        cwd=ROOT, text=True, capture_output=True, check=True,
    )
    return [line for line in result.stdout.splitlines() if line]


def regenerate_indexes() -> None:
    for tool in (
        "tools/generate_tool_index.py",
        "tools/generate_briefs_index.py",
        "tools/generate_research_index.py",
    ):
        result = _run([PY, tool])
        if result.returncode:
            raise RuntimeError(f"index regeneration failed: {tool}")


def run_lint_fix() -> None:
    """Run local markdownlint when installed; CI remains the final authority."""
    executable = shutil.which("markdownlint-cli2")
    if not executable:
        print("lint: markdownlint-cli2 not installed; CI will run it")
        return
    result = _run([executable, "--fix", "docs/**/*.md"])
    if result.returncode:
        raise RuntimeError("markdownlint-cli2 --fix failed")


def run_gate(scope: str) -> int:
    result = _run([PY, "tools/gate3.py", "--scope", scope, "--no-tests"])
    print(f"gate3: {'PASS' if result.returncode == 0 else 'FAIL'} (exit {result.returncode})")
    return result.returncode


def merge_round(branches: list[str], *, dry_run: bool, gate_scope: str) -> int:
    if dry_run:
        print("DRY RUN: no merge, checkout, index regeneration, or commit will occur")
        for branch in branches:
            print(f"branch {branch}")
            paths = changed_paths(branch)
            if not paths:
                print("  (no changed paths from HEAD)")
            for path in paths:
                print(f"  {conflict_kind(path)}: {path}")
        return run_gate(gate_scope)

    base = _git_text("rev-parse", "HEAD").strip()
    for branch in branches:
        result = _run(["git", "merge", "--no-ff", "--no-edit", branch])
        if result.returncode:
            paths = _conflicts()
            resolve_conflicts(paths)
            commit = _run(["git", "commit", "--no-edit"])
            if commit.returncode:
                raise RuntimeError(f"merge commit failed for {branch}")
    regenerate_indexes()
    run_lint_fix()
    gate_rc = run_gate(gate_scope)
    status = _git_text("diff", "--name-status", f"{base}..HEAD", "--", "src", "libs").splitlines()
    c_added, s_removed = summary_from_name_status(status)
    print(f"summary: C added={c_added}; .s removed={s_removed}")
    print("per-region sha1 evidence is printed by gate3 above")
    return gate_rc


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("branches", nargs="+", help="branches or refs to merge in order")
    parser.add_argument("--dry-run", action="store_true", help="preview typed resolution and run the gate")
    parser.add_argument("--gate-scope", default="all", choices=("all", "eur", "usa", "jpn"),
                        help="gate3 scope (default: all)")
    args = parser.parse_args(argv)
    try:
        return merge_round(args.branches, dry_run=args.dry_run, gate_scope=args.gate_scope)
    except (RuntimeError, subprocess.CalledProcessError) as exc:
        print(f"integrate: ERROR: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
