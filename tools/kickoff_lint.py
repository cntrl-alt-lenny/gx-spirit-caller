#!/usr/bin/env python3
"""
kickoff_lint.py — a pre-send gate on agent kickoff text (R&D r8, §4).

The 3-region `gate3.py` is our *merge* gate — the strongest possible arbiter of
correctness. But it fires only after an agent has already spent its hour. The
recurring void-work incidents (b576 transcription-without-invariant, b589
wrong-base census) were kickoffs that shipped *missing the cheap guards* — no
canary, no preflight, a self-report instead of a pasted artifact — and the cost
surfaced only in the post-hoc autopsy.

External best practice (r8 §7) states the principle plainly: put a validation
gate at every inter-agent handoff, because a bad output that passes the handoff
becomes fact for the next layer. The kickoff *is* the brain→worker handoff. This
lint checks the kickoff text itself, before send, for the guards that turn a
false premise or a self-report into a clean STOP instead of void work.

It is deterministic, wine-free, and CI-safe — pure text analysis, no build.

Usage:
    python3.13 tools/kickoff_lint.py path/to/kickoff.txt
    pbpaste | python3.13 tools/kickoff_lint.py        # lint the clipboard
    python3.13 tools/kickoff_lint.py --quiet k.txt    # exit code only

Exit codes:
    0   all REQUIRED checks pass (advisories may still warn)
    1   one or more REQUIRED checks failed
    2   usage / IO error
"""
from __future__ import annotations

import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


@dataclass
class Check:
    key: str
    required: bool
    ok: bool
    detail: str


# --- individual checks -------------------------------------------------------
# Each returns (ok, detail). `applies` gates a check to kickoffs where it's
# relevant (e.g. the worktree retry-loop only matters if the kickoff adds one).

def _has(text: str, *pats: str) -> bool:
    return any(re.search(p, text, re.IGNORECASE) for p in pats)


def check_preflight(text: str) -> tuple[bool, str]:
    # A guard that STOPS on a false premise (missing tool/base/dir) rather than
    # producing void work: a PREFLIGHT marker plus a hard stop (exit 1 / || {).
    marker = _has(text, r"\bpreflight\b")
    stop = _has(text, r"exit\s+1", r"\|\|\s*\{", r"&&\s*echo\s+preflight-ok")
    if marker and stop:
        return True, "PREFLIGHT guard with a hard stop present"
    if marker:
        return False, "PREFLIGHT mentioned but no hard stop (exit 1 / || {…}) — a false premise won't halt"
    return False, "no PREFLIGHT guard — a missing tool/base/dir would run as void work"


_EXPECTED_RE = re.compile(
    # `EXPECT=...` (POSIX) or `$EXPECT = ...` (PowerShell).
    r"(?:^|[;&\s(])\$?(?:EXPECT|EXPECTED_WORKTREE)\s*=\s*['\"]?"
    r"(?P<path>[^'\";\s]+)"
)
_WORKTREE_TARGET_RE = re.compile(
    r"\bgit\s+worktree\s+add\s+(?:--[^\s]+\s+)*(?P<path>[^\s;&]+)"
)
# Two accepted spellings of the same assertion. Requiring only the POSIX form
# was itself a void-work generator: the Codex lanes run PowerShell, so a lane
# handed a bash-only guard transliterates it, and on 2026-08-08 one of them
# Windows-ified the path while writing it -- `git rev-parse --show-toplevel`
# ALWAYS emits forward slashes on Windows, so the comparison was false-negative
# and the lane stopped after 17 seconds in the correct worktree. Accept the
# PowerShell form natively so briefs can ship a guard the lane can run as-is.
_ROOT_ASSERTION_RE = re.compile(
    # POSIX:      [ "$(git rev-parse --show-toplevel)" = "$EXPECT" ]
    r"\$\(\s*git\s+rev-parse\s+--show-toplevel\s*\)\s*"
    r"['\"]?\s*={1,2}\s*['\"]?\$(?:EXPECT|EXPECTED_WORKTREE)\b"
    r"|"
    # PowerShell: if ((git rev-parse --show-toplevel) -ne $EXPECT) { ... }
    r"\(\s*git\s+rev-parse\s+--show-toplevel\s*\)\s*"
    r"(?:\.Replace\([^)]*\)\s*)?"
    r"-(?:eq|ne)\s*\$(?:EXPECT|EXPECTED_WORKTREE)\b"
)
# A backslash in the expected path cannot match git's forward-slash output.
_BACKSLASH_PATH_RE = re.compile(
    r"(?:^|[;&\s(])(?:\$)?(?:EXPECT|EXPECTED_WORKTREE)\s*=\s*['\"]?[^'\";\s]*\\"
)

_LOCATION_ESTABLISHMENT_RES = (
    re.compile(r"\b(?:cd|Set-Location)\s+(?P<path>[^\s;&|]+)", re.IGNORECASE),
    re.compile(r"\bgit\s+-C\s+(?P<path>[^\s;&|]+)", re.IGNORECASE),
)


def _path_basename(path: str) -> str:
    path = path.strip("'\"")
    path = path.replace("$HOME", "~")
    return Path(path).name


def _unquote_path(path: str) -> str:
    return path.strip("'\"")


def _established_paths_before(
    text: str, line_number: int, expected_paths: list[str],
) -> list[str]:
    """Return literal directory paths established before a guard line."""
    lines = text.splitlines()
    paths: list[str] = []
    for raw_line in lines[: line_number - 1]:
        for pattern in _LOCATION_ESTABLISHMENT_RES:
            for match in pattern.finditer(raw_line):
                path = _unquote_path(match.group("path"))
                if path in {"$EXPECT", "$EXPECTED_WORKTREE"}:
                    paths.extend(expected_paths)
                else:
                    paths.append(path)
        for match in _WORKTREE_TARGET_RE.finditer(raw_line):
            paths.append(_unquote_path(match.group("path")))
    return paths


def check_location_guard(text: str) -> tuple[bool, str]:
    """Require equality to the explicitly assigned worktree path.

    This is intentionally line-local. A successful ``pwd`` or
    ``rev-parse`` probe is not an assertion, and a comparison against a
    different worktree target is not protection either.
    """
    stop = (r"\bexit\s+1\b", r"\|\|\s*\{", r"\bSTOP\b")
    expected_paths = [m.group("path") for m in _EXPECTED_RE.finditer(text)]
    targets = [m.group("path") for m in _WORKTREE_TARGET_RE.finditer(text)]
    assertion_lines = [
        (line_number, line)
        for line_number, line in enumerate(text.splitlines(), 1)
        if _ROOT_ASSERTION_RE.search(line) and _has(line, *stop)
    ]
    if not assertion_lines:
        return False, "no repo-root equality assertion against EXPECT with a hard stop"
    if not expected_paths:
        return False, "repo-root comparison has no explicitly assigned EXPECT path"
    if _BACKSLASH_PATH_RE.search(text):
        return False, (
            "EXPECT uses backslashes — `git rev-parse --show-toplevel` always "
            "emits forward slashes on Windows, so this guard false-negatives "
            "and stops a lane that is in the CORRECT worktree"
        )
    if targets and not any(
        _path_basename(expected) == _path_basename(target)
        for expected in expected_paths
        for target in targets
    ):
        return False, "EXPECT path does not match the assigned worktree target"
    if not any(
        _path_basename(expected) == _path_basename(established)
        for expected in expected_paths
        for line_number, _line in assertion_lines
        for established in _established_paths_before(text, line_number, expected_paths)
    ):
        return False, (
            "repo-root equality assertion has no preceding directory establishment "
            "for the EXPECT path"
        )
    return True, "repo-root equality assertion matches the assigned worktree path"


def check_canary(text: str) -> tuple[bool, str]:
    # A first-batch check that fails loud before bulk work (dsd check / self-
    # retrieval / sha1 on one item). The word CANARY is our convention; accept
    # an explicit equivalent first-item verification.
    if _has(text, r"\bcanary\b"):
        return True, "CANARY present"
    if _has(text, r"first\s+(batch|item|rename|carve).{0,40}(check|verify|sha1|dsd check)"):
        return True, "first-item verification present (canary-equivalent)"
    return False, "no CANARY — the wrong-base/wrong-tool class won't be caught before bulk work"


_COMMAND_NAMES = (
    r"\[", r"awk", r"bash", r"cat", r"cd", r"cp", r"diff", r"echo",
    r"find", r"gh", r"git", r"grep", r"head", r"ls", r"mkdir", r"mv",
    r"ninja", r"npx", r"open", r"python(?:3\.\d+)?", r"pytest", r"pwd",
    r"rg", r"ruff", r"sed", r"sh", r"sort", r"tail", r"test", r"wc",
    r"which", r"xargs", r"zsh",
)
_COMMAND_HEAD_RE = re.compile(
    r"^(?:(?:sudo|env)\s+)?(?:" + "|".join(_COMMAND_NAMES) + r")\b"
)
_SCOPED_PATH_RE = re.compile(
    r"(?P<path>(?:src|tools|docs|config|\.github)/[^\s'\"`;&|(){}\[\],]+)"
)
_GIT_SHOW_PATH_RE = re.compile(
    r"\bgit\s+show\s+[^\s:]+:(?P<path>(?:src|tools|docs|config|\.github)/[^\s'\"`;&|(){}\[\],]+)"
)
_COMMIT_TOKEN_RE = re.compile(
    r"(?P<revision>[0-9a-fA-F]{7,40}\^?(?::[^\s'\"`;&|(){}\[\],]+)?)$"
)


def _command_segments(text: str) -> list[tuple[int, str]]:
    """Return only shell-like command segments, excluding ordinary prose."""
    segments: list[tuple[int, str]] = []
    for line_number, raw_line in enumerate(text.splitlines(), 1):
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        line = re.sub(
            r"^(?:CANARY|COMMAND|RUN|THEN|DO)\s*[:—-]?\s*",
            "",
            line,
            flags=re.IGNORECASE,
        )
        for segment in re.split(r"\s*(?:&&|\|\||[;|])\s*", line):
            segment = re.sub(
                r"^(?:run|then|do|command|execute)\s+",
                "",
                segment.strip(),
                flags=re.IGNORECASE,
            )
            if _COMMAND_HEAD_RE.match(segment):
                segments.append((line_number, segment))
    return segments


def _clean_path(path: str) -> str:
    return path.rstrip(".:;!?)]}")


def check_referenced_paths(
    text: str, *, root: Path = Path(__file__).resolve().parent.parent,
) -> tuple[bool, str]:
    """Require command-line repo paths to exist, with git-show as history escape."""
    missing: list[str] = []
    for line_number, segment in _command_segments(text):
        escaped = {_clean_path(match.group("path")) for match in _GIT_SHOW_PATH_RE.finditer(segment)}
        for match in _SCOPED_PATH_RE.finditer(segment):
            path = _clean_path(match.group("path"))
            if path in escaped:
                continue
            if not (root / path).exists():
                missing.append(f"line {line_number}: {path}")
    if missing:
        return False, "referenced command path(s) missing at HEAD — " + ", ".join(missing)
    return True, "all referenced command paths exist at HEAD or use git show history"


def check_referenced_commits(
    text: str, *, root: Path = Path(__file__).resolve().parent.parent,
) -> tuple[bool, str]:
    """Require command-line abbreviated/full revisions to resolve in this repo."""
    missing: list[str] = []
    checked: set[str] = set()
    for line_number, segment in _command_segments(text):
        for token in re.split(r"\s+", segment):
            token = token.strip("'\"(),")
            match = _COMMIT_TOKEN_RE.fullmatch(token)
            if not match:
                continue
            revision = match.group("revision")
            commit_revision = revision.split(":", 1)[0]
            if commit_revision in checked:
                continue
            checked.add(commit_revision)
            result = subprocess.run(
                ["git", "cat-file", "-e", commit_revision],
                cwd=root,
                capture_output=True,
            )
            if result.returncode:
                missing.append(f"line {line_number}: {commit_revision}")
    if missing:
        return False, "referenced commit(s) do not resolve — " + ", ".join(missing)
    return True, "all command-line commit references resolve"


def check_platform_coherence(text: str) -> tuple[bool, str]:
    """Reject the two known cross-machine EXPECT/interpreter paste shapes."""
    expected_paths = [m.group("path") for m in _EXPECTED_RE.finditer(text)]
    commands = [segment for _line, segment in _command_segments(text)]
    bare_python = any(re.match(r"^python\b", command) for command in commands)
    python313 = any(re.match(r"^python3\.13\b", command) for command in commands)
    for path in expected_paths:
        if path.startswith("/Users/") and bare_python:
            return False, "Mac /Users/ EXPECT is paired with bare python; use python3.13"
        if path.startswith("C:/") and python313:
            return False, "C:/ EXPECT is paired with python3.13; use the Windows interpreter"
    return True, "EXPECT path and interpreter platform are coherent"


def check_paste_control(text: str) -> tuple[bool, str]:
    # The kickoff must demand a *pasted tool-derived artifact*, never a self-
    # report. Look for an explicit paste request tied to a checkable output.
    artifact = r"(sha1|dsd check|objdiff|report\.json|git diff --stat|pytest|family-hit|cmp -l|metric|numbers)"
    if _has(text, r"\bpaste\b.{0,60}" + artifact, r"reply with.{0,80}" + artifact):
        return True, "paste-the-output control tied to a checkable artifact present"
    if _has(text, r"\bpaste\b", r"reply with"):
        return False, "a reply/paste is requested but not tied to a tool-derived artifact — could be a self-report"
    return False, "no paste-the-output control — output would be an unverifiable self-report"


def check_effort_tag(text: str) -> tuple[bool, str]:
    # The brief must name an explicit effort tier (r8 §1) so Medium/High is a
    # decision, not a default.
    if _has(text, r"effort.{0,20}(low|medium|high|xhigh|max)",
            r"(low|medium|high|xhigh|max)\s+effort",
            r"set\s+your\s+reasoning\s+effort"):
        return True, "explicit effort tier named"
    return False, "no effort tier — routing (r8 §1) is left to the agent default"


def check_worktree_retry(text: str) -> tuple[bool, str, bool]:
    # Applies only if the kickoff adds a worktree. If it does, it must carry the
    # b602 config-lock retry-loop.
    applies = _has(text, r"worktree\s+add")
    if not applies:
        return True, "no worktree add (retry-loop not applicable)", False
    if _has(text, r"for\s+i\s+in", r"\|\|\s*\{?\s*.*sleep", r"retry"):
        return True, "worktree add carries a retry-loop (b602 lock-race guard)", True
    return False, "worktree add WITHOUT the b602 retry-loop — 4-way `git worktree add` will collide on .git/config", True


def check_no_nested_backticks(text: str) -> tuple[bool, str, bool]:
    # Advisory: kickoffs are pasted as ONE fenced block; an inner triple-backtick
    # breaks the paste (banked preference). Only meaningful when the kickoff will
    # itself be wrapped — always warn if present so the brain notices.
    n = text.count("```")
    if n == 0:
        return True, "no triple-backticks (paste-safe as one block)", False
    return False, f"{n} triple-backtick run(s) — will break a single-block paste; use indented blocks", True


def lint(text: str) -> list[Check]:
    checks: list[Check] = []
    for key, fn in (
        ("preflight", check_preflight),
        ("location-guard", check_location_guard),
        ("canary", check_canary),
        ("paste-control", check_paste_control),
        ("effort-tag", check_effort_tag),
        ("referenced-paths", check_referenced_paths),
        ("referenced-commits", check_referenced_commits),
        ("platform-coherence", check_platform_coherence),
    ):
        ok, detail = fn(text)
        checks.append(Check(key, True, ok, detail))

    ok, detail, applies = check_worktree_retry(text)
    # required only when it applies (a worktree IS added)
    checks.append(Check("worktree-retry", applies, ok, detail))

    ok, detail, _ = check_no_nested_backticks(text)
    checks.append(Check("no-nested-backticks", False, ok, detail))  # advisory
    return checks


def main(argv: list[str]) -> int:
    args = [a for a in argv[1:] if not a.startswith("-")]
    quiet = "--quiet" in argv[1:]
    try:
        if args:
            text = open(args[0], encoding="utf-8").read()
        elif not sys.stdin.isatty():
            text = sys.stdin.read()
        else:
            print("usage: kickoff_lint.py <kickoff.txt>  (or pipe on stdin)", file=sys.stderr)
            return 2
    except OSError as e:
        print(f"kickoff_lint: {e}", file=sys.stderr)
        return 2

    checks = lint(text)
    failed_required = [c for c in checks if c.required and not c.ok]

    if not quiet:
        for c in checks:
            if c.ok:
                mark, tag = "PASS", ""
            elif c.required:
                mark, tag = "FAIL", " [required]"
            else:
                mark, tag = "WARN", " [advisory]"
            print(f"  {mark:4} {c.key:20}{tag:11} {c.detail}")
        print()
        if failed_required:
            print(f"kickoff_lint: {len(failed_required)} required check(s) failed — "
                  f"do NOT send; this kickoff risks void work (r8 §4).")
        else:
            warns = [c for c in checks if not c.required and not c.ok]
            suffix = f" ({len(warns)} advisory warning(s))" if warns else ""
            print(f"kickoff_lint: OK — all required guards present{suffix}.")
    return 1 if failed_required else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
