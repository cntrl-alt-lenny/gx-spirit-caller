#!/usr/bin/env python3
"""Detect stale authority language in normative text.

The framework's first version routed every merge back through the human:
*review locally, summarize, offer to merge, execute on OK.* That makes the
coordinating role a recommender rather than a lead, and puts the owner back in
the seat this framework exists to get them out of. It is also the single most
likely thing to creep back in, because it reads as polite.

Two rules:

``routine-approval``
    Text making a **routine** merge conditional on human assent. The owner keeps
    direction, veto, reversal and an explicit reserved list; what they do not do
    is approve each round.

``executor-self-merge``
    Text granting an executor the right to merge or accept its own work. Urgency
    is exactly when this bends and exactly when it must not.

NEGATION IS HANDLED, and it has to be: correct documents talk about merging
constantly, in the form "never merges", "does not self-accept", "may not merge".
A match preceded by a negation on the same line is a *prohibition*, which is the
thing we want to see, so it is not reported. Both directions are unit-tested —
a permission must fire and a prohibition must not.

This is a text guard on a text artifact, so the property it checks *is* the
invariant rather than a proxy for one. What it cannot do is prove that a running
agent obeys what the text says.
"""

from __future__ import annotations

import re
import sys
from dataclasses import dataclass
from typing import Sequence

from textblocks import (NEGATORS, counterexample_blocks, logical_lines,
                        logical_lines_with_positions, negated as _negated)

__all__ = ["Finding", "scan", "inert_counterexamples",
           "has_merge_prohibition", "ROUTINE_APPROVAL",
           "EXECUTOR_SELF_MERGE", "NEGATORS"]


@dataclass(frozen=True)
class Finding:
    source: str
    line: int
    rule: str
    matched: str
    message: str

    def __str__(self) -> str:  # pragma: no cover - formatting only
        return f"{self.source}:{self.line} [{self.rule}] {self.message}: {self.matched!r}"


#: Idioms that make a routine merge conditional on human assent.
ROUTINE_APPROVAL: tuple[tuple[str, str], ...] = (
    (r"offers?\s+to\s+merge",
     "routine merge offered to the owner for approval"),
    (r"\b(shall|should|can|may)\s+(i|we)\s+merge\b",
     "asking the owner to authorise a routine merge"),
    (r"\bok(?:ay)?\s+to\s+merge\b",
     "routine merge gated on an approval token"),
    (r"\bpermission\s+to\s+merge\b",
     "routine merge gated on permission"),
    (r"\bexecutes?\s+on\s+(?:their\s+|the\s+)?(?:ok|okay|approval)\b",
     "merge executed on an approval token"),
    (r"\bmerges?\s+on\s+(?:the\s+)?[\w'-]+(?:'s)?\s+(?:ok|okay|approval|sign-?off)\b",
     "merge conditioned on a person's approval"),
    (r"\bon\s+(?:the\s+)?(?:human|owner|user)(?:'s)?\s+(?:ok|okay|approval|sign-?off)\b",
     "action conditioned on the owner's approval"),
    (r"\b(?:human|owner|user)\s+(?:approval|sign-?off)\s+(?:is\s+)?(?:required|needed)",
     "human approval declared as the gate"),
    (r"\bwait(?:s|ing)?\s+for\s+(?:the\s+|a\s+)?(?:human|owner|user|your)(?:'s)?\s+"
     r"(?:ok|okay|approval|sign-?off|go-?ahead)",
     "round blocked on the owner's approval"),
    (r"\b(?:human|owner|user|you)\s+(?:merges?|approves?)\s+(?:the\s+)?"
     r"(?:prs?|pull\s+requests?|changes?|work|it)\b",
     "the owner named as the routine merge actor"),
)

#: Text granting an executor the right to accept or merge its own work.
EXECUTOR_SELF_MERGE: tuple[tuple[str, str], ...] = (
    (r"\bself-?merges?\b", "an executor merging its own work"),
    (r"\bself-?merging\b", "an executor merging its own work"),
    (r"\bmerge\s+(?:its|their|your|his|her)\s+own\b",
     "an executor merging its own work"),
    (r"\baccepts?\s+(?:its|their|your)\s+own\s+work\b",
     "an executor accepting its own work"),
)

#: A line that names a person as the subject AND describes merging as one of
#: their duties. Split into two parts because v1's worst case put them at
#: opposite ends of a table cell — "Human project owner. Sets priorities, picks
#: direction, merges PRs" — which no single adjacency regex catches. Requiring
#: the person-word keeps a legitimate "Brain merges accepted rounds" clean.
PERSON_SUBJECT = re.compile(
    r"\b(human|owner|user|meatspace|product\s+owner|you)\b", re.IGNORECASE
)
MERGE_DUTY = re.compile(
    r"\bmerges?\s+(?:the\s+)?(?:prs?|pull\s+requests?|changes?|branches?|it)\b",
    re.IGNORECASE,
)

_COMPILED_APPROVAL = tuple((re.compile(p, re.IGNORECASE), m) for p, m in ROUTINE_APPROVAL)
_COMPILED_SELF_MERGE = tuple(
    (re.compile(p, re.IGNORECASE), m) for p, m in EXECUTOR_SELF_MERGE
)


def scan(text: str, *, source: str = "<text>",
         skip_lines: Sequence[int] = ()) -> list[Finding]:
    """Report stale-authority idioms in ``text``.

    ``skip_lines`` is for callers that suppress explicitly-marked historical
    quotations; the framework's own catalogue uses it.
    """
    skip = set(skip_lines)
    # A document may need to QUOTE a stale form in order to name it. Wrapping it
    # in a counterexample block suppresses the finding here; the block is still
    # required to contain one -- see inert_counterexamples().
    _, suppressed = counterexample_blocks(text)
    skip |= suppressed
    findings: list[Finding] = []
    # Logical lines, not physical ones: prose is hard-wrapped here, and a
    # negation on the previous physical line must still negate.
    for _, line, positions in logical_lines_with_positions(text):
        if positions and positions[0] in skip:
            continue
        for pattern, message in _COMPILED_APPROVAL:
            for m in pattern.finditer(line):
                if _negated(line, m.start()):
                    continue
                line_number = positions[m.start()] if positions else 1
                if line_number not in skip:
                    findings.append(
                        Finding(source, line_number, "routine-approval", m.group(0), message)
                    )
        if PERSON_SUBJECT.search(line):
            for m in MERGE_DUTY.finditer(line):
                if _negated(line, m.start()):
                    continue
                line_number = positions[m.start()] if positions else 1
                if line_number not in skip:
                    findings.append(
                        Finding(source, line_number, "routine-approval", m.group(0),
                                "a person named as the routine merge actor")
                    )
        for pattern, message in _COMPILED_SELF_MERGE:
            for m in pattern.finditer(line):
                if _negated(line, m.start()):
                    continue
                line_number = positions[m.start()] if positions else 1
                if line_number not in skip:
                    findings.append(
                        Finding(source, line_number, "executor-self-merge", m.group(0), message)
                    )
    return findings


#: A statement about the ACT of merging. Deliberately narrow.
#:
#: An earlier version accepted any negated use of "merge" or "accept" anywhere
#: in the file, and that was a proxy guard of exactly the kind
#: `framework/evidence.md` warns about: "Do not accept a paraphrase" and "not
#: merge-blocking" both satisfied it, so a contract could lose its actual
#: boundary and still pass. The mutation test in `tests/test_guards_fire.py`
#: found that.
#:
#: The trailing exclusion keeps hyphenated compounds ("merge-blocking",
#: "merge-conflict") from counting: those are adjectives, not the act.
MERGE_ACT = re.compile(r"\bmerges?\b(?![-\w])", re.IGNORECASE)


def has_merge_prohibition(text: str) -> bool:
    """True if ``text`` states somewhere that this role does not merge.

    Deliberately not an exact-wording lock: any negated statement about the act
    of merging counts, so a contract can be reworded freely — but it cannot
    silently lose the boundary.
    """
    for _, line in logical_lines(text):
        for m in MERGE_ACT.finditer(line):
            if _negated(line, m.start()):
                return True
    return False


def inert_counterexamples(text: str, *, source: str = "<text>") -> list[int]:
    """Counterexample blocks that this guard finds nothing in.

    An exemption protecting nothing is a silent widening: either the quoted text
    is not actually a violation, or the rule that used to catch it has
    regressed. Callers should treat a non-empty result as a failure.
    """
    blocks, _ = counterexample_blocks(text)
    return [start for start, body in blocks if not scan(body, source=source)]


# --- Command line -----------------------------------------------------------
#
# A project that adopts this framework receives this file and is expected to be
# able to *run* it -- in CI, or by hand against a document it is unsure about.
# Without an entrypoint that took writing glue first, which is why, in practice,
# nobody did.
#
# The path walk below is duplicated in `neutrality.py` rather than shared. That
# is deliberate: both files are copied standalone into other repositories, and a
# scanner that drags in a private helper module is a scanner that breaks the
# first time someone copies only the file they were told they needed.


def _iter_files(paths: Sequence[str]) -> list["Path"]:
    from pathlib import Path
    out: list[Path] = []
    for raw in paths:
        p = Path(raw)
        if not p.exists():
            raise FileNotFoundError(raw)
        if p.is_dir():
            out += sorted(q for q in p.rglob("*.md") if q.is_file())
        elif p.is_file():
            out.append(p)
        else:
            raise OSError(f"not a regular file or directory: {raw}")
    return out


def main(argv: Sequence[str] | None = None) -> int:
    """Scan files or directories for stale authority language.

    Exit 0 clean, 1 findings, 2 nothing scanned. "Nothing scanned" is an error
    rather than a pass: a guard that silently checked no files is the failure
    `evidence.md` calls failing open.
    """
    import argparse

    ap = argparse.ArgumentParser(
        prog="authority.py",
        description="Detect stale authority language in normative documents.",
        epilog=(
            "Scans exactly what it is pointed at. Selecting the normative "
            "surface is the caller's job -- a historical document that quotes "
            "broken forms on purpose will report findings, correctly. "
            "Exit status: 0 clean, 1 findings found, 2 nothing was scanned."
        ),
    )
    ap.add_argument(
        "paths", nargs="+",
        help="files, or directories to scan recursively for *.md",
    )
    ap.add_argument(
        "--quiet", action="store_true",
        help="print nothing; use the exit status only",
    )
    args = ap.parse_args(argv)

    try:
        files = _iter_files(args.paths)
    except OSError as exc:
        print(f"authority: cannot scan requested path: {exc}", file=sys.stderr)
        return 2
    if not files:
        print("authority: no files matched; refusing to report success",
              file=sys.stderr)
        return 2

    findings: list[Finding] = []
    inert: list[str] = []
    for path in files:
        try:
            text = path.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError) as exc:
            print(f"authority: cannot read {path}: {exc}", file=sys.stderr)
            return 2
        findings += scan(text, source=str(path))
        inert += [
            f"{path}:{line} counterexample block suppresses nothing"
            for line in inert_counterexamples(text, source=str(path))
        ]

    if not args.quiet:
        for finding in findings:
            print(finding)
        for line in inert:
            print(line)
        print(
            f"authority: {len(findings) + len(inert)} finding(s) in "
            f"{len(files)} file(s)",
            file=sys.stderr,
        )
    return 1 if (findings or inert) else 0


if __name__ == "__main__":
    sys.exit(main())
