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
import sys
from dataclasses import dataclass


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


def check_canary(text: str) -> tuple[bool, str]:
    # A first-batch check that fails loud before bulk work (dsd check / self-
    # retrieval / sha1 on one item). The word CANARY is our convention; accept
    # an explicit equivalent first-item verification.
    if _has(text, r"\bcanary\b"):
        return True, "CANARY present"
    if _has(text, r"first\s+(batch|item|rename|carve).{0,40}(check|verify|sha1|dsd check)"):
        return True, "first-item verification present (canary-equivalent)"
    return False, "no CANARY — the wrong-base/wrong-tool class won't be caught before bulk work"


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
        ("canary", check_canary),
        ("paste-control", check_paste_control),
        ("effort-tag", check_effort_tag),
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
