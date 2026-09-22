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

OWNER OVERRIDES. The constitution lets the owner explicitly override Brain's
routine-merge authority — that is a real, sanctioned act, not stale language to
reject. Judging it by wording alone put the same meaning on both sides of the
line depending only on phrasing. The recognised, reviewable form:

    <!-- guard:owner-override routine-approval text="Brain merges reviewed work only on the owner's approval." -->
    Brain merges reviewed work only on the owner's approval.

The declaration is one physical line: an HTML comment, invisible when
rendered, naming the rule it overrides and the *exact overriding sentence* —
not a paraphrase, not a whole section. The very next line of real prose must
read, verbatim, exactly that sentence (it may itself wrap across physical
lines, like any other prose here) — so a fresh reader sees the override as an
ordinary sentence, immediately under the marker, never only inside the
invisible comment. `scan_overrides()` proves the rest: the declared sentence
is run back through the real scanner in isolation, and only a genuine hit
against the named rule earns the exemption — on that rule, on that one line,
nowhere else. A declaration naming text the scanner would not otherwise flag,
that does not literally appear as the next sentence, or that names the wrong
rule, protects nothing and is reported as inert by
`inert_override_declarations()` — the same "an exemption that protects
nothing is a silent widening" principle the counterexample mechanism already
applies. A different rule's finding on the same line, and this rule's finding
on every other line in every document, are both untouched. This is a
machine-readable RECORD of an exceptional act the owner initiated, not a way
to grant one: nothing here authenticates who wrote the declaration, and only
the owner may add, change or remove one — see `framework/CONSTITUTION.md`'s
"Authority" and `framework/adoption.md`.

A CLEAN RESULT (no findings, no inert declarations) proves the text contains
no *unrecognised* stale-authority idiom. It does NOT prove: that a running
Brain actually asks the owner before merging, or refuses to when there is no
override; that a declared override was genuinely initiated by the owner rather
than added by anyone with write access to the document; or that the override
is still current. Those remain human review and repository-history questions,
the same as every other guard in this framework that checks a text artifact
rather than a running agent.

This is a text guard on a text artifact, so the property it checks *is* the
invariant rather than a proxy for one. What it cannot do is prove that a running
agent obeys what the text says.
"""

from __future__ import annotations

import re
import sys
from collections.abc import Sequence
from dataclasses import dataclass
from pathlib import Path

from textblocks import (NEGATORS, counterexample_blocks, logical_lines,
                        logical_lines_with_positions, negated as _negated)

__all__ = ["Finding", "scan", "scan_overrides", "inert_counterexamples",
           "inert_override_declarations", "has_merge_prohibition",
           "ROUTINE_APPROVAL", "EXECUTOR_SELF_MERGE", "NEGATORS"]


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


def _scan_raw(text: str, *, source: str = "<text>",
              skip_lines: Sequence[int] = ()) -> list[Finding]:
    """Report every stale-authority idiom in ``text``, before override suppression.

    ``skip_lines`` is for callers that suppress explicitly-marked historical
    quotations; the framework's own catalogue uses it. This is the shared
    core both ``scan()`` (findings minus validated overrides) and
    ``scan_overrides()`` (the validated overrides themselves) are built from,
    so the two can never disagree about what the scanner actually found.
    """
    skip = set(skip_lines)
    # A document may need to QUOTE a stale form in order to name it. Wrapping it
    # in a counterexample block suppresses the finding here; the block is still
    # required to contain one -- see inert_counterexamples().
    _, suppressed = counterexample_blocks(text)
    skip |= suppressed
    # An owner-override declaration line is machine metadata, not prose: its
    # own `text="..."` attribute necessarily repeats the overriding sentence,
    # which would otherwise also fire as an unrelated, unsuppressible finding
    # on the marker's own line -- never what the declaration is naming.
    skip |= {
        n for n, raw_line in enumerate(text.splitlines(), 1)
        if _OWNER_OVERRIDE_DECLARATION.match(raw_line)
    }
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


#: `<!-- guard:owner-override <rule> text="<the whole overriding sentence>" -->`
#: -- see the module docstring's OWNER OVERRIDES section. Deliberately
#: narrower than the counterexample declaration: one rule, one exact
#: sentence, no role list, because an override names a specific sentence of
#: real policy for a human to read, not a class of banned examples.
_OWNER_OVERRIDE_DECLARATION = re.compile(
    r'^\s*<!--\s*guard:owner-override\s+'
    r'(?P<rule>[a-z][a-z0-9-]*)\s+'
    r'text="(?P<text>[^"]+)"\s*-->\s*$'
)

#: Documentation SHOWING the declaration syntax (as this framework's own
#: templates do) must not be read as a live declaration. Mirrors
#: `neutrality.py`'s `_live_lines` fenced/indented/raw-HTML-example boundary
#: -- duplicated rather than imported, the same deliberate choice that
#: module's own comment explains: both files are copied standalone.
_FENCE = re.compile(r"^( {0,3})(?P<run>(?P<char>`|~){2,})(?P<info>.*)$")
_HTML_EXAMPLE_OPEN = re.compile(
    r"<\s*(?P<tag>pre|code|textarea|script|style)\b[^>]*>", re.IGNORECASE,
)
_HTML_EXAMPLE_CLOSE = re.compile(
    r"</\s*(?P<tag>pre|code|textarea|script|style)\s*>", re.IGNORECASE,
)


def _normalise_override_text(value: str) -> str:
    """Insignificant whitespace only -- see ``_OWNER_OVERRIDE_DECLARATION``.

    Deliberately does not strip backticks or punctuation: an override names
    one exact sentence, not a fuzzy paraphrase.
    """
    return " ".join(value.split())


def _owner_override_declarations(text: str) -> list[tuple[int, str, str]]:
    """Parse ``(declaration line, rule, declared text)`` triples, verbatim.

    Skips declarations inside fenced or four-space/tab-indented Markdown
    code, and inside raw HTML ``pre``/``code``/``textarea``/``script``/
    ``style`` blocks: those are examples showing the syntax, not live policy.
    A declaration embedded in arbitrary inline HTML or a non-standard
    renderer construct is still parsed and needs human review, the same
    documented boundary `framework/adoption.md` states for the unrelated
    branch-namespace declaration.
    """
    declarations: list[tuple[int, str, str]] = []
    fence_char: str | None = None
    fence_length = 0
    html_tag: str | None = None
    for n, line in enumerate(text.splitlines(), 1):
        if fence_char is not None:
            stripped = line.lstrip()
            if (
                stripped.startswith(fence_char * fence_length)
                and stripped[len(fence_char) * fence_length:].strip() == ""
            ):
                fence_char = None
                fence_length = 0
            continue
        if html_tag is not None:
            close = _HTML_EXAMPLE_CLOSE.search(line)
            if close and close.group("tag").lower() == html_tag:
                html_tag = None
            continue
        if line.startswith("\t") or line.startswith("    "):
            continue
        fence = _FENCE.match(line)
        if fence:
            fence_char = fence.group("char")
            fence_length = len(fence.group("run"))
            continue
        html = _HTML_EXAMPLE_OPEN.search(line)
        if html:
            tag = html.group("tag").lower()
            if not _HTML_EXAMPLE_CLOSE.search(line, html.end()):
                html_tag = tag
            continue
        match = _OWNER_OVERRIDE_DECLARATION.match(line)
        if match:
            declarations.append((n, match.group("rule"), match.group("text")))
    return declarations


def _next_logical_line(text: str, after: int) -> tuple[int | None, str | None]:
    """The first logical line starting strictly after physical line ``after``.

    Logical, not physical: an override sentence may itself be hard-wrapped
    across two physical lines, the same as any other prose in this framework.
    """
    for start, line, _ in logical_lines_with_positions(text):
        if start > after:
            return start, line
    return None, None


def _split_overrides(
    text: str, raw_findings: Sequence[Finding],
) -> tuple[list[Finding], list[int]]:
    """Partition ``raw_findings`` into validated overrides and the rest.

    A declaration earns an override only by satisfying three things the
    declaration's own say-so cannot fake:

    1. Its ``text`` equals, verbatim (modulo insignificant whitespace), the
       very next logical line of real prose -- so a fresh reader sees the
       override as an ordinary, visible sentence, immediately under the
       (invisible) machine marker, never only inside the HTML comment.
    2. That declared sentence, scanned in isolation, genuinely fires the
       named rule -- proving it is a real instance of the pattern, not a
       fabricated exemption of harmless text.
    3. The real document actually has a finding of that exact rule on that
       exact line.

    Only then are findings of THAT rule on THAT one line exempted -- a
    different rule's finding on the same line, or the same rule anywhere
    else in the document, is untouched. A declaration failing any of the
    three exempts nothing and is reported by its own line number as inert.
    """
    overrides: list[Finding] = []
    inert_lines: list[int] = []
    for line_no, rule, declared_text in _owner_override_declarations(text):
        norm_declared = _normalise_override_text(declared_text)
        target_line, joined = _next_logical_line(text, line_no)
        if target_line is None or _normalise_override_text(joined) != norm_declared:
            inert_lines.append(line_no)
            continue
        probe = [
            f for f in _scan_raw(declared_text, source="<override-probe>")
            if f.rule == rule
        ]
        if not probe:
            inert_lines.append(line_no)
            continue
        matches = [
            f for f in raw_findings if f.rule == rule and f.line == target_line
        ]
        if matches:
            overrides.extend(matches)
        else:
            inert_lines.append(line_no)
    return overrides, inert_lines


def scan(text: str, *, source: str = "<text>",
         skip_lines: Sequence[int] = ()) -> list[Finding]:
    """Report stale-authority idioms in ``text``, EXCLUDING validated owner
    overrides -- see ``scan_overrides()`` for those, and the module
    docstring's OWNER OVERRIDES section for the declaration format and what a
    clean result does and does not prove.

    ``skip_lines`` is for callers that suppress explicitly-marked historical
    quotations; the framework's own catalogue uses it.
    """
    raw = _scan_raw(text, source=source, skip_lines=skip_lines)
    overrides, _ = _split_overrides(text, raw)
    overridden = set(overrides)
    return [f for f in raw if f not in overridden]


def scan_overrides(text: str, *, source: str = "<text>") -> list[Finding]:
    """The findings ``scan()`` excluded because a validated declaration
    covers them exactly. Report these distinctly from real findings -- an
    override is a recognised, reviewable record of the owner's exceptional
    act, not a defect to fix and not silence to trust blindly.
    """
    raw = _scan_raw(text, source=source)
    overrides, _ = _split_overrides(text, raw)
    return overrides


def inert_override_declarations(text: str, *, source: str = "<text>") -> list[int]:
    """Declaration line numbers that exempt nothing.

    Every declaration must earn its exemption against the real scan; one that
    names text the scanner never flagged (wrong rule, paraphrased, or not
    actually present) is a silent widening waiting to happen -- the same
    principle ``inert_counterexamples()`` applies to the unrelated
    counterexample mechanism. Callers should treat a non-empty result as a
    failure.
    """
    raw = _scan_raw(text, source=source)
    _, inert_lines = _split_overrides(text, raw)
    return inert_lines


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


#: This scanner's own rule vocabulary. Used only to recognise when a
#: counterexample block declares EXCLUSIVELY a rule some OTHER scanner owns
#: (`tools/neutrality.py`'s `compound-lane` / `prefixed-lane` /
#: `branch-namespace` / `queue-identity` / `lane-count` share the same
#: `guard:counterexample` wrapper and `guard:violation` syntax) -- so this
#: scanner never claims such a block is "inert". It was never this
#: scanner's block to judge in the first place; see inert_counterexamples().
_OWN_RULES = frozenset({"routine-approval", "executor-self-merge"})

#: The bare rule-name token from any `guard:violation <rule> ...` line,
#: regardless of which scanner's full declaration syntax follows it --
#: deliberately looser than `_OWNER_OVERRIDE_DECLARATION` above, which
#: validates a complete declaration this scanner can act on. This is used
#: only to determine ownership, never to validate one.
_DECLARED_RULE = re.compile(
    r'^\s*<!--\s*guard:violation\s+(?P<rule>[a-z][a-z0-9-]*)\b'
)


def _declared_rule_names(body: str) -> set[str]:
    return {
        m.group("rule") for line in body.splitlines()
        if (m := _DECLARED_RULE.match(line))
    }


def inert_counterexamples(text: str, *, source: str = "<text>") -> list[int]:
    """Counterexample blocks that exempt nothing real -- restricted to
    blocks this guard could plausibly own.

    A block whose scan finds SOMETHING is never inert, regardless of which
    rule its declaration names: the wrapper is genuinely suppressing real
    content, which is the property this check exists to prove. Only when the
    scan finds NOTHING does ownership matter, as a tie-breaker: a block whose
    every `guard:violation` declares a rule outside `_OWN_RULES` belongs
    entirely to a different scanner (e.g. neutrality.py's `compound-lane`)
    and an empty scan there is expected, not a defect -- it was never this
    guard's block to protect anything in. An exemption protecting nothing
    IS a silent widening for the guard that actually owns the block, or for
    a block naming no owner at all; either the quoted text is not actually a
    violation, or the rule that used to catch it has regressed. Callers
    should treat a non-empty result as a failure.
    """
    blocks, _ = counterexample_blocks(text)
    inert: list[int] = []
    for start, body in blocks:
        if scan(body, source=source):
            continue
        declared = _declared_rule_names(body)
        if declared and declared.isdisjoint(_OWN_RULES):
            continue
        inert.append(start)
    return inert


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


def _iter_files(paths: Sequence[str]) -> list[Path]:
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
    overrides: list[Finding] = []
    inert: list[str] = []
    for path in files:
        try:
            text = path.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError) as exc:
            print(f"authority: cannot read {path}: {exc}", file=sys.stderr)
            return 2
        findings += scan(text, source=str(path))
        overrides += scan_overrides(text, source=str(path))
        inert += [
            f"{path}:{line} counterexample block suppresses nothing"
            for line in inert_counterexamples(text, source=str(path))
        ]
        inert += [
            f"{path}:{line} owner-override declaration exempts nothing"
            for line in inert_override_declarations(text, source=str(path))
        ]

    if not args.quiet:
        for finding in findings:
            print(finding)
        for override in overrides:
            print(f"{override} [recognised owner override]")
        for line in inert:
            print(line)
        print(
            f"authority: {len(findings)} finding(s), {len(overrides)} "
            f"recognised owner override(s), {len(inert)} inert declaration(s) "
            f"in {len(files)} file(s). A clean result means no *unrecognised* "
            f"stale-authority idiom -- it does not prove a running Brain "
            f"honours a declared override, or that the override was "
            f"genuinely initiated by the owner.",
            file=sys.stderr,
        )
    return 1 if (findings or inert) else 0


if __name__ == "__main__":
    sys.exit(main())
