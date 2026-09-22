#!/usr/bin/env python3
"""Structural provider-neutrality scanner.

Enforces that a project's *lane identity* — its roles, branch namespaces, task
queues and dispatch topology — is derived from ROLES and never from whichever
provider, model or tool happens to be running a seat this round.

DESIGN NOTE, and it is the entire point of this module.

A guard built from a list of known provider names is worthless against the next
provider. Every rule here is instead expressed as a POSITIVE invariant over the
caller's declared role set, and FAILS CLOSED on anything it does not recognise.
A provider that has never existed is therefore rejected by default, with no edit
to this file.

`GRAMMAR_QUALIFIERS` is the one allowance, and it is a closed set of English
function words — not a vendor list. A test asserts it contains no proper nouns,
so it cannot quietly become one.

BRANCH NAMESPACE DECLARATIONS are deliberately structural, not an arbitrary
allowlist. A project's AGENTS.md may declare the bounded structural forms
`m<N>` and `meta`, or a lower-case project namespace backed by a tracked
`docs/branch-namespaces/<name>.md` evidence file. The scanner checks that
syntax and evidence, but it cannot identify providers or prove that a custom
label is provider-neutral. The declaration is therefore a reviewed human
decision, not a machine-verified guarantee.

HISTORICAL TEXT IS OUT OF SCOPE. Case studies, round logs, archived briefs and
failure catalogues record which tool actually ran. That is a record of events,
never a lane definition. Callers pass only their *normative* surface.

COUNTEREXAMPLE BLOCKS. A normative document sometimes needs to quote a banned
form in order to prohibit it. Wrap it and declare the structural violation it
demonstrates:

    <!-- guard:counterexample -->
    <!-- guard:violation compound-lane roles=builder text="Acme Builder" -->
    ... text that SHOULD be rejected ...
    <!-- /guard:counterexample -->

The declaration names the exact scanner match and the roles with which it is
invalid. The probe runs that text through the real scanner with those declared
roles, not the adopting project's roles. A missing, absent or unflagged
declaration is inert. The outer scan suppresses only a validated finding whose
rule and `Finding.matched` text are covered by the declaration; other findings
in the same block remain visible. Matching collapses whitespace and removes
balanced outer backticks, but otherwise requires equality. A partial word or a
whole surrounding sentence is not a key for the finding. The block is still
reported separately, so `ScanResult.inert_counterexamples()` can make a
useless exemption fail.
"""

from __future__ import annotations

import re
import sys
from dataclasses import dataclass, field
from typing import Iterable, Sequence

from textblocks import (
    COUNTEREXAMPLE_CLOSE,
    COUNTEREXAMPLE_OPEN,
    counterexample_blocks,
    logical_lines,
    logical_lines_with_positions,
    negated,
)

__all__ = [
    "Finding",
    "Counterexample",
    "ScanResult",
    "GRAMMAR_QUALIFIERS",
    "branch_namespace_declarations",
    "branch_namespaces_for_paths",
    "scan",
    "scan_counterexample",
    "scan_adapter_blocks",
    "adapter_policy_hits",
]

@dataclass(frozen=True)
class Finding:
    """One structural violation."""

    source: str
    line: int
    rule: str
    message: str
    matched: str = ""

    def __str__(self) -> str:  # pragma: no cover - formatting only
        return f"{self.source}:{self.line} [{self.rule}] {self.message}"


@dataclass(frozen=True)
class Counterexample:
    """A suppressed region, and whatever the scanner found inside it."""

    source: str
    line: int
    text: str
    findings: tuple[Finding, ...]


@dataclass
class ScanResult:
    findings: list[Finding] = field(default_factory=list)
    counterexamples: list[Counterexample] = field(default_factory=list)
    lines_scanned: int = 0

    def __bool__(self) -> bool:
        return bool(self.findings)

    def inert_counterexamples(self) -> list[Counterexample]:
        """Blocks that suppress nothing — i.e. exemptions protecting nothing.

        A caller should treat a non-empty result as a failure: either the
        example is not actually a violation (so the document is teaching the
        wrong thing), or the rule that used to catch it has regressed.
        """
        return [c for c in self.counterexamples if not c.findings]

    def report(self) -> str:
        return "\n".join(str(f) for f in self.findings)


#: English function words and ordinary adjectives that may legitimately precede
#: a capitalised role word. Deliberately NOT a vendor list: an unrecognised
#: qualifier fails closed, which is exactly what makes a novel provider name get
#: rejected without ever appearing here.
GRAMMAR_QUALIFIERS = frozenset(
    {
        "a", "an", "the", "this", "that", "these", "those", "each", "every",
        "both", "either", "neither", "one", "two", "three", "any", "no",
        "and", "or", "per", "for", "to", "as", "is", "are", "was", "were",
        "be", "by", "with", "from", "of", "in", "on", "at", "into", "via",
        "your", "our", "its", "their", "my",
        "standing", "active", "primary", "current", "assigned", "temporary",
        "permanent", "independent", "optional", "required", "additional",
        "second", "third", "fresh", "new", "single", "same", "other",
        "role", "roles", "lane", "lanes", "seat", "seats", "specialist",
        "worker", "workers", "executor", "executors", "reviewer", "reviewers",
        "not", "never", "only", "also", "still", "then", "when", "where",
        "while", "if", "so", "but", "because", "than", "before", "after",
        "what", "which", "who", "whether", "how",
        "next", "previous", "another", "each's",
    }
)

_WORD_TO_INT = {
    "one": 1, "two": 2, "three": 3, "four": 4, "five": 5,
    "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10,
}


def _role_alt(roles: Sequence[str]) -> str:
    return "|".join(re.escape(r) for r in sorted(roles, key=len, reverse=True))


#: One qualifier word. A dot is part of the word only when it is immediately
#: followed by another word character -- a version- or domain-shaped token
#: such as "Acme.io" or "Gpt5.6" -- never when it is followed by whitespace or
#: end of word. That keeps a genuine sentence-ending period ("Verifier. That
#: Builder" -- two ordinary role mentions, not a provider-shaped lane) from
#: being absorbed into the preceding word, while still letting a dotted
#: provider-shaped qualifier match as one token. Hyphens are deliberately
#: EXCLUDED: an ordinary capitalised English compound adjective ("Self-
#: contained Builder", "Follow-up Builder") must not be forced into one
#: qualifier "word" that then fails the grammar check just because it isn't a
#: dictionary word -- a hyphen here breaks tokenisation the same way one did
#: on main, so the compound never becomes a candidate at all.
_QUALIFIER_WORD = r"[A-Z][\w+]*(?:\.\w[\w+]*)*"


def _compound_lane_re(roles: Sequence[str]) -> re.Pattern[str]:
    """`<Proper Noun> <Role>` — binding a proper noun to a role makes a lane
    out of the qualifier. Anything that is not plain English grammar is treated
    as a proper noun, i.e. a provider, and rejected."""
    caps = "|".join(re.escape(r.capitalize()) for r in sorted(roles, key=len, reverse=True))
    return re.compile(
        r"(?<![\w-])((?:" + _QUALIFIER_WORD + r"\s+){1,3})(" + caps + r")\b"
    )


def _prefixed_lane_re(roles: Sequence[str]) -> re.Pattern[str]:
    """Find a role-suffixed token; the caller supplies identity context.

    Token shape alone is insufficient: ``deck-builder`` can be ordinary
    English or a filename. `_prefixed_lane_is_identity` below requires a lane
    cue, an explicit identifier, or a role-suffixed path before emitting it.
    """
    return re.compile(
        r"(?<![\w-])(?P<prefix>[a-z0-9][\w.+-]*?)[-_]"
        r"(?P<role>" + _role_alt(roles) + r")\b"
    )


_LANE_IDENTITY_NOUN = re.compile(
    r"^\s+(?:lane|lanes|queue|queues|seat|seats|role|roles|session|sessions|"
    r"worktree|worktrees|checkout|checkouts|branch|branches|namespace|"
    r"namespaces)\b",
    re.IGNORECASE,
)
_LANE_ROUTING_VERB = re.compile(
    r"\b(?:send|hand|route|assign|dispatch|use|run|launch|start|open|cut|create)\b",
    re.IGNORECASE,
)
_LANE_IDENTITY_BEFORE = re.compile(
    r"\b(?:lane|lanes|queue|queues|seat|seats|role|roles|session|sessions|"
    r"worktree|worktrees|checkout|checkouts|branch|branches|namespace|"
    r"namespaces)\s+(?:is|are|was|were|named|called|uses|routes)\s*$",
    re.IGNORECASE,
)
_ORDINARY_TOKEN_SUFFIX = re.compile(
    r"^\s+(?:module|modules|path|paths|file|files|ui|tool|tools|"
    r"pattern|patterns|brief|briefs|prompt|prompts|note|notes|guide|"
    r"guidance|document|documents|directory|directories)\b",
    re.IGNORECASE,
)
_BRANCH_NAMESPACE_DECLARATION = re.compile(
    r'^\s*<!--\s*guard:branch-namespaces\s+'
    r'prefixes="(?P<prefixes>[^"]+)"\s*-->\s*$'
)
_STRUCTURAL_BRANCH_NAMESPACES = frozenset(("m<N>", "meta"))
_MILESTONE_NAMESPACE = re.compile(r"m[0-9]+\Z")
_PROJECT_NAMESPACE = re.compile(r"[a-z](?:[a-z0-9]|-(?=[a-z0-9]))*\Z")
_FENCE = re.compile(r"^( {0,3})(?P<run>(?P<char>`|~){2,})(?P<info>.*)$")
_HTML_EXAMPLE_OPEN = re.compile(
    r"<\s*(?P<tag>pre|code|textarea|script|style)\b[^>]*>",
    re.IGNORECASE,
)
_HTML_EXAMPLE_CLOSE = re.compile(
    r"</\s*(?P<tag>pre|code|textarea|script|style)\s*>",
    re.IGNORECASE,
)


def _live_lines(text: str) -> list[str]:
    """Return lines outside common Markdown and HTML example constructs.

    Declarations in fenced or four-space-indented Markdown code, or in raw
    HTML ``pre``, ``code``, ``textarea``, ``script`` or ``style`` blocks, are
    examples rather than live project policy. This is deliberately a
    line-oriented guard: an inline comment embedded in arbitrary HTML or a
    non-standard renderer construct can still look live and needs review.
    """
    live: list[str] = []
    fence_char: str | None = None
    fence_length = 0
    html_tag: str | None = None
    for line in text.splitlines():
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
        match = _FENCE.match(line)
        if match:
            run = match.group("run")
            fence_char = match.group("char")
            fence_length = len(run)
            continue
        html = _HTML_EXAMPLE_OPEN.search(line)
        if html:
            tag = html.group("tag").lower()
            if not _HTML_EXAMPLE_CLOSE.search(line, html.end()):
                html_tag = tag
            continue
        live.append(line)
    return live


def _namespace_evidence(root: "Path", prefix: str) -> bool:
    """Require a tracked project-structure witness for custom namespaces.

    This proves project-owned structure exists; it does not prove anything
    about whether the chosen label resembles a provider.
    """
    import subprocess

    evidence = root / "docs" / "branch-namespaces" / f"{prefix}.md"
    try:
        result = subprocess.run(
            [
                "git", "-C", str(root), "ls-files", "--error-unmatch",
                str(evidence.relative_to(root)),
            ],
            capture_output=True, text=True, check=False,
        )
    except OSError:
        return False
    return result.returncode == 0


def _validate_namespace_forms(
    prefixes: Sequence[str], *, roles: Iterable[str] = (), coordinator: str = "brain",
) -> None:
    invalid = [prefix for prefix in prefixes if not (
        prefix in _STRUCTURAL_BRANCH_NAMESPACES
        or _PROJECT_NAMESPACE.fullmatch(prefix)
    )]
    if invalid:
        raise ValueError(
            "unsupported branch namespace declaration(s): "
            + ", ".join(invalid)
            + "; custom names must be lower-case project namespaces using "
            "letters, digits, and single hyphens"
        )
    role_prefixes = set(roles) | {coordinator}
    role_bearing = [
        prefix for prefix in prefixes
        if prefix not in _STRUCTURAL_BRANCH_NAMESPACES
        and prefix not in role_prefixes
        and _namespace_carries_role(prefix, role_prefixes)
    ]
    if role_bearing:
        raise ValueError(
            "unsupported branch namespace declaration(s): "
            + ", ".join(role_bearing)
            + "; a custom namespace may not carry a declared role or coordinator"
        )


def _namespace_carries_role(prefix: str, role_prefixes: set[str]) -> bool:
    """Return whether a namespace contains a role as separator-delimited words.

    Both namespaces and declared role names may contain hyphens or underscores.
    Comparing whole split pieces misses ``lead-brain`` inside
    ``acme-lead-brain``; comparing the role's own word sequence preserves the
    old boundary semantics while handling compound role names.
    """
    namespace_words = tuple(word for word in re.split(r"[-_]", prefix) if word)
    for role in role_prefixes:
        role_words = tuple(word for word in re.split(r"[-_]", role) if word)
        if not role_words or len(role_words) > len(namespace_words):
            continue
        width = len(role_words)
        if any(
            namespace_words[index:index + width] == role_words
            for index in range(len(namespace_words) - width + 1)
        ):
            return True
    return False


def branch_namespace_declarations(
    text: str, *, root: "Path | None" = None,
    roles: Iterable[str] = (), coordinator: str = "brain",
) -> tuple[str, ...]:
    """Read the bounded declaration from a project document.

    ``m<N>`` and ``meta`` are built-in structural forms. A custom lower-case
    namespace, including a single-hyphen project namespace, is accepted only
    when ``root`` proves it with a tracked
    ``docs/branch-namespaces/<name>.md`` document. If roles are supplied, a
    custom namespace carrying a declared role is refused.
    """
    marker_lines = [
        line for line in _live_lines(text)
        if "guard:branch-namespaces" in line
    ]
    if not marker_lines:
        return ()
    if len(marker_lines) != 1:
        raise ValueError("only one branch-namespace declaration is allowed")
    match = _BRANCH_NAMESPACE_DECLARATION.match(marker_lines[0])
    if not match:
        raise ValueError(
            'branch namespace declaration must be '
            '<!-- guard:branch-namespaces prefixes="m<N>,meta" -->'
        )
    prefixes = tuple(
        prefix.strip() for prefix in match.group("prefixes").split(",")
        if prefix.strip()
    )
    if not prefixes or len(set(prefixes)) != len(prefixes):
        raise ValueError("branch namespace declaration must name unique prefixes")
    _validate_namespace_forms(prefixes, roles=roles, coordinator=coordinator)
    if root is not None:
        missing = [
            prefix for prefix in prefixes
            if prefix not in _STRUCTURAL_BRANCH_NAMESPACES
            and not _namespace_evidence(root, prefix)
        ]
        if missing:
            raise ValueError(
                "custom branch namespace(s) lack tracked project-structure "
                "evidence under docs/branch-namespaces/: "
                + ", ".join(missing)
            )
    return prefixes


def _project_root_for_paths(paths: Sequence[str]) -> "Path | None":
    from pathlib import Path

    roots = []
    for raw in paths:
        path = Path(raw).resolve()
        start = path.parent if path.is_file() else path
        for parent in (start, *start.parents):
            if (parent / "AGENTS.md").is_file():
                roots.append(parent)
                break
    if not roots:
        return None
    unique = {root.resolve() for root in roots}
    if len(unique) != 1:
        raise ValueError("scanned paths belong to different AGENTS.md projects")
    return roots[0]


def branch_namespaces_for_paths(
    paths: Sequence[str], *, roles: Iterable[str] = (), coordinator: str = "brain",
) -> tuple[str, ...]:
    """Discover the same AGENTS.md declaration used by the installed guard."""
    root = _project_root_for_paths(paths)
    if root is None:
        return ()
    return branch_namespace_declarations(
        (root / "AGENTS.md").read_text(encoding="utf-8"), root=root,
        roles=roles, coordinator=coordinator,
    )


def _branch_namespace_allowed(
    prefix: str,
    role_prefixes: set[str],
    declared: Sequence[str],
) -> bool:
    if prefix in role_prefixes:
        return True
    return (
        prefix in declared
        or ("m<N>" in declared and _MILESTONE_NAMESPACE.fullmatch(prefix) is not None)
    )


def _prefixed_lane_is_identity(line: str, match: re.Match[str]) -> bool:
    """Require evidence that a role-suffixed token names a lane.

    A role-suffixed path component, a token directly used as a lane/queue/etc.,
    or a routing target is an identity claim. A token used as an adjective for
    a module, file, UI, tool, or path is ordinary prose even when that sentence
    mentions a queue or checkout elsewhere.
    """
    _, end = match.span("role")
    token_start = match.start("prefix")
    token_end = end
    after = line[token_end:]
    if after.startswith("/"):
        return True
    if after.startswith(("-", "_")):
        return False

    previous = line[:token_start]
    if line[token_start - 1:token_start] == "/" and not (
        previous.endswith("../") or previous.endswith("./")
    ):
        return True

    after_unquoted = after
    if after.startswith("`"):
        if token_start > 0 and line[token_start - 1] == "`":
            return True
        after_unquoted = after[1:]
    if _LANE_IDENTITY_NOUN.match(after_unquoted):
        return True
    if _ORDINARY_TOKEN_SUFFIX.match(after_unquoted):
        return False

    if previous.endswith("../") or previous.endswith("./"):
        return False
    left_boundary = max(
        (line.rfind(mark, 0, token_start) for mark in ".!?;"),
        default=-1,
    )
    sentence_before = line[left_boundary + 1:token_start]
    if (
        _LANE_ROUTING_VERB.search(sentence_before)
        or _LANE_IDENTITY_BEFORE.search(sentence_before)
    ):
        return True
    return False


#: A branch PRESCRIPTION. Deliberately narrow: a branch name is only claimed
#: when a git command creates it, or when it is written as a backticked token on
#: a line that is actually about branches. A detector that mistakes prose for a
#: branch cries wolf forever and then gets disabled.
BRANCH_COMMAND = re.compile(
    r"git\s+(?:switch\s+-c|checkout\s+-b)\s+(?:origin/)?([\w.+-]+)/[\w.<>-]+"
    r"|git\s+worktree\s+add\s+(?:--\S+\s+)*\S+\s+-b\s+(?:origin/)?([\w.+-]+)/[\w.<>-]+"
)
BRANCH_BACKTICK = re.compile(r"`(?:origin/)?([a-z][\w.+-]*)/([\w.<>-]+)`")
BRANCH_LINE = re.compile(r"\bbranch(?:es|ed|ing)?\b|\bnamespace\b", re.IGNORECASE)
FILE_SUFFIX = re.compile(r"\.[a-z0-9]{1,5}$", re.IGNORECASE)

#: A count that DIRECTLY quantifies standing lanes. "lane" is an overloaded
#: word, so a role-ish qualifier is required — that keeps build concurrency
#: ("four parallel jobs") out and catches "three standing lanes".
LANE_COUNT = re.compile(
    r"\b(one|two|three|four|five|six|seven|eight|nine|ten|\d+)\s+"
    r"(?:active\s+|parallel\s+|concurrent\s+|standing\s+)*"
    r"(?:standing|worker|executor|role|permanent)\s+(?:lanes?|roles?|seats?|sessions?)\b",
    re.IGNORECASE,
)

#: Things an OPTIONAL provider-adapter block may never contain, because each
#: would redefine role, queue, branch, authority or gate.
ADAPTER_FORBIDDEN = re.compile(
    r"(git\s+switch\s+-c|git\s+checkout\s+-b|git\s+merge\b|gh\s+pr\s+merge"
    r"|\bmay\s+merge\b|\bmerge\s+authority\b|\bqueue\b|\bbranch\s+namespace\b)",
    re.IGNORECASE,
)
ADAPTER_MARKER = re.compile(r"OPTIONAL\s*[-—–]+\s*(.+?)\s+only", re.IGNORECASE)


def scan(
    text: str,
    roles: Iterable[str],
    *,
    source: str = "<text>",
    coordinator: str = "brain",
    branch_namespaces: Iterable[str] = (),
    queue_pattern: str | None = None,
    max_lanes: int | None = None,
) -> ScanResult:
    """Scan normative text for provider-shaped lane identity.

    ``roles``       the project's declared executor roles. The single source of
                    truth for lane identity; everything below derives from it.
    ``coordinator`` the coordinating role, which may also own branches.
    ``branch_namespaces`` bounded structural namespace forms declared by the
                    adopting project's AGENTS.md (`m<N>` and/or `meta`).
    ``queue_pattern`` optional regex with one capture group yielding the stem of
                    a canonical (non-archived) queue path. Enabled only for
                    projects that keep such files.
    ``max_lanes``   optional; when set, prose claiming more standing lanes than
                    this is a violation. Leave ``None`` for documents that
                    legitimately discuss several topologies.
    """
    roles = tuple(roles)
    if not roles:
        raise ValueError("at least one role must be declared; an empty role set "
                         "would make every rule vacuous")

    declared_namespaces = tuple(branch_namespaces)
    _validate_namespace_forms(
        declared_namespaces, roles=roles, coordinator=coordinator,
    )

    compound_re = _compound_lane_re(roles)
    prefixed_re = _prefixed_lane_re(roles)
    queue_re = re.compile(queue_pattern) if queue_pattern else None
    role_set = set(roles)
    branch_prefixes = role_set | {coordinator}
    role_branch_re = re.compile(
        r"(?<![\w-])((?:[a-z0-9][\w.+]*[-_])?(?:" + _role_alt(roles) + r"))/"
        r"[\w.<>-]+"
    )

    result = ScanResult()
    blocks, _ = counterexample_blocks(text)
    scan_text = _counterexample_scan_text(text)
    exemptions = _counterexample_exemptions(
        text, roles, coordinator=coordinator,
        branch_namespaces=declared_namespaces,
        queue_pattern=queue_pattern, max_lanes=max_lanes,
    )
    lines = scan_text.splitlines()
    result.lines_scanned = len(lines)

    def emit(n: int, rule: str, message: str, *, matched: str = "") -> None:
        for start, end, declarations in exemptions:
            if not start <= n <= end:
                continue
            if any(
                rule == declared_rule
                and _same_counterexample_match(matched, declared_text)
                for declared_rule, declared_text in declarations
            ):
                return
        result.findings.append(Finding(source, n, rule, message, matched))

    # Token-adjacency rules run over LOGICAL lines, so a compound split across a
    # soft wrap -- "the SomeProvider" ending one line and "Worker" starting the
    # next -- is still caught.
    for _, line, positions in logical_lines_with_positions(scan_text):
        for match in compound_re.finditer(line):
            qualifier, role = match.groups()
            words = [w for w in qualifier.split() if w]
            bad = [
                w for w in words
                if w.lower().strip(".,;:*`\"'()[]") not in GRAMMAR_QUALIFIERS
            ]
            if bad:
                emit(
                    positions[match.start()] if positions else 1, "compound-lane",
                    f"'{qualifier.strip()} {role}' binds a proper noun to a role; "
                    f"lanes are the bare roles {roles}",
                    matched=match.group(0).strip(),
                )

        for match in prefixed_re.finditer(line):
            prefix, role = match.group("prefix"), match.group("role")
            if not _prefixed_lane_is_identity(line, match):
                continue
            emit(
                positions[match.start()] if positions else 1, "prefixed-lane",
                f"'{prefix}-{role}' prefixes a role to make a lane token; "
                f"the lane is '{role}'",
                matched=match.group(0),
            )

    # Positional rules stay on PHYSICAL lines: joining a paragraph would let the
    # word "branch" anywhere in it enable backtick-branch detection for the
    # whole thing, which is how this kind of detector starts crying wolf.
    for n, line in enumerate(lines, 1):
        candidates: list[tuple[str, str]] = []
        for match in BRANCH_COMMAND.finditer(line):
            command = match.group(0)
            for prefix in (group for group in match.groups() if group):
                marker = f"{prefix}/"
                start = command.rfind(marker)
                candidates.append((prefix, command[start:] if start >= 0 else command))
        if BRANCH_LINE.search(line):
            for match in BRANCH_BACKTICK.finditer(line):
                prefix, rest = match.groups()
                if prefix == "origin":
                    if "/" not in rest:
                        continue
                    prefix, rest = rest.split("/", 1)
                if FILE_SUFFIX.search(rest):
                    continue  # a file path, not a branch
                candidates.append((prefix, f"{prefix}/{rest}"))
        for prefix, matched in candidates:
            if _branch_namespace_allowed(
                prefix, branch_prefixes, declared_namespaces
            ):
                continue
            emit(
                n, "branch-namespace",
                f"branch prefix '{prefix}/' is not a role; new branches are "
                f"<role>/<scope> for {sorted(branch_prefixes)}",
                matched=matched.strip("`"),
            )

        # A branch token whose namespace itself prefixes a declared role is
        # unambiguously provider-shaped even when prose omits the word
        # "branch" (for example, ``claude-decomper/fix-123``). Keep the
        # ordinary context requirement above for generic paths such as
        # ``acme/some-scope``.
        if not BRANCH_LINE.search(line):
            for match in role_branch_re.finditer(line):
                if match.group(1) in branch_prefixes:
                    continue
                emit(
                    n, "branch-namespace",
                    f"branch prefix '{match.group(1)}/' is not a role; new "
                    f"branches are <role>/<scope> for {sorted(branch_prefixes)}",
                    matched=match.group(0).strip("`"),
                )

        if queue_re is not None:
            for match in queue_re.finditer(line):
                stem = match.group(1)
                if stem not in role_set:
                    emit(
                        n, "queue-identity",
                        f"canonical queue '{stem}' is not a role queue; live "
                        f"queues are {roles}",
                        matched=match.group(0),
                    )

        if max_lanes is not None:
            for match in LANE_COUNT.finditer(line):
                tok = match.group(1)
                value = _WORD_TO_INT.get(tok.lower()) or (
                    int(tok) if tok.isdigit() else None
                )
                if value is not None and value > max_lanes:
                    emit(
                        n, "lane-count",
                        f"topology says '{tok}' standing lanes where there are "
                        f"{max_lanes}; a provider never adds a lane",
                        matched=match.group(0),
                    )

    for start, body in blocks:
        inner = scan_counterexample(
            body, roles,
            source=f"{source}#counterexample@{start}",
            coordinator=coordinator,
            branch_namespaces=declared_namespaces,
            queue_pattern=queue_pattern,
            max_lanes=max_lanes,
        )
        result.counterexamples.append(
            Counterexample(source, start, body, tuple(inner))
        )

    return result


_COUNTEREXAMPLE_DECLARATION = re.compile(
    r'^\s*<!--\s*guard:violation\s+'
    r'(?P<rule>[a-z][a-z0-9-]*)\s+'
    r'roles=(?P<roles>[a-z0-9][a-z0-9_-]*(?:\s*,\s*[a-z0-9][a-z0-9_-]*)*)\s+'
    r'text="(?P<text>[^"]+)"\s*-->\s*$'
)


def _normalise_counterexample_match(text: str) -> str:
    """Return the comparison form for a declared scanner match.

    Declarations are written by people and scanner matches are assembled from
    tokens, so insignificant whitespace and presentation backticks should not
    create a false mismatch. Nothing else is normalised: this does not strip
    words from a sentence or compare substrings. Keeping the scanner's complete
    ``Finding.matched`` token as the key prevents a short declaration such as
    ``builder`` from exempting ``nebula-builder``.
    """
    value = " ".join(text.split())
    while len(value) >= 2 and value[0] == value[-1] == "`":
        value = " ".join(value[1:-1].strip().split())
    return value


def _same_counterexample_match(found: str, declared: str) -> bool:
    """Whether a declaration names precisely the scanner's matched token."""
    return _normalise_counterexample_match(found) == _normalise_counterexample_match(
        declared
    )


def _counterexample_declarations(text: str) -> list[tuple[str, tuple[str, ...], str]]:
    """Parse exact declarations without inferring anything from nearby prose."""
    declarations: list[tuple[str, tuple[str, ...], str]] = []
    for line in text.splitlines():
        match = _COUNTEREXAMPLE_DECLARATION.match(line)
        if match:
            declared_roles = tuple(
                role.strip() for role in match.group("roles").split(",")
            )
            declarations.append(
                (match.group("rule"), declared_roles, match.group("text"))
            )
    return declarations


def _counterexample_scan_text(text: str) -> str:
    """Remove only counterexample metadata while keeping every body line.

    Markers and declarations describe an exemption; they are not normative
    prose. The body must remain in the scan so an undeclared finding cannot
    hide behind a neighbouring declaration. Blank replacements preserve the
    physical line numbers used in findings.
    """
    lines = text.splitlines()
    for index, line in enumerate(lines):
        stripped = line.strip()
        if stripped in {COUNTEREXAMPLE_OPEN, COUNTEREXAMPLE_CLOSE}:
            lines[index] = ""
        elif _COUNTEREXAMPLE_DECLARATION.match(line):
            lines[index] = ""
    return "\n".join(lines)


def _counterexample_exemptions(
    text: str,
    roles: Sequence[str],
    *,
    coordinator: str,
    branch_namespaces: Sequence[str],
    queue_pattern: str | None,
    max_lanes: int | None,
) -> list[tuple[int, int, tuple[tuple[str, str], ...]]]:
    """Return validated ``(start, end, rule/text)`` exemptions.

    A declaration earns an exemption only after the real probe accepts the
    whole block. Matching is intentionally exact at the structural level:
    both the declared rule and the scanner's matched text must agree. This
    makes a block that demonstrates one defect unable to shelter another.
    """
    exemptions: list[tuple[int, int, tuple[tuple[str, str], ...]]] = []
    for start, body in counterexample_blocks(text)[0]:
        declarations = _counterexample_declarations(body)
        if not declarations:
            continue
        if not scan_counterexample(
            body, roles, source=f"<counterexample@{start}>",
            coordinator=coordinator, branch_namespaces=branch_namespaces,
            queue_pattern=queue_pattern, max_lanes=max_lanes,
        ):
            continue
        body_lines = body.splitlines()
        if not body_lines:
            continue
        exemptions.append(
            (start + 1, start + len(body_lines),
             tuple((rule, text) for rule, _, text in declarations))
        )
    return exemptions


def scan_counterexample(
    text: str,
    roles: Iterable[str],
    *,
    source: str = "<text>",
    coordinator: str = "brain",
    branch_namespaces: Iterable[str] = (),
    queue_pattern: str | None = None,
    max_lanes: int | None = None,
) -> list[Finding]:
    """Check declarations against the real scanner, independently of ``roles``.

    The old implementation guessed role-shaped tokens from surrounding words.
    That cannot distinguish harmless prose from a provider-shaped lane. A block
    is non-inert only when every declaration is present in the body and its
    declared rule is emitted by ``scan`` with the declaration's roles.
    """
    del roles
    declarations = _counterexample_declarations(text)
    if any("guard:violation" in line for line in text.splitlines()) and not all(
        _COUNTEREXAMPLE_DECLARATION.match(line)
        for line in text.splitlines()
        if "guard:violation" in line
    ):
        return []
    if not declarations:
        return []

    declaration_lines = {
        line for line in text.splitlines()
        if _COUNTEREXAMPLE_DECLARATION.match(line)
    }
    body = "\n".join(
        line for line in text.splitlines() if line not in declaration_lines
    )
    findings: list[Finding] = []
    for rule, declared_roles, offending_text in declarations:
        if (
            not offending_text
            or _normalise_counterexample_match(offending_text)
            not in _normalise_counterexample_match(body)
        ):
            return []
        try:
            result = scan(
                body, declared_roles, source=source,
                coordinator=coordinator, queue_pattern=queue_pattern,
                branch_namespaces=branch_namespaces,
                max_lanes=max_lanes,
            )
        except ValueError:
            return []
        matching = [
            finding
            for finding in result.findings
            if finding.rule == rule
            and _same_counterexample_match(finding.matched, offending_text)
        ]
        if not matching:
            return []
        findings.extend(matching)
    return findings


def scan_adapter_blocks(text: str, *, source: str = "<text>") -> list[Finding]:
    """An OPTIONAL provider block may add launch mechanics and nothing else."""
    problems: list[Finding] = []
    lines = text.splitlines()
    _, suppressed = counterexample_blocks(text)
    for n, line in enumerate(lines):
        if (n + 1) in suppressed:
            continue
        marker = ADAPTER_MARKER.search(line)
        if not marker:
            continue
        # The block is the marker's own paragraph: marker line through the next
        # blank line. Scanning to end-of-file would attribute the whole rest of
        # the document to the adapter, which is how this first cried wolf.
        for offset, body in enumerate(lines[n:], start=n + 1):
            if offset > n + 1 and not body.strip():
                break
            if offset in suppressed:
                continue
            hit = ADAPTER_FORBIDDEN.search(body)
            # "no queue, no gate" prohibits; it does not define. Same negation
            # rule the authority guard uses, for the same reason.
            if hit and not negated(body, hit.start()):
                problems.append(
                    Finding(
                        source, offset, "adapter-overreach",
                        f"adapter block for '{marker.group(1)}' contains "
                        f"'{hit.group(1)}' — an adapter may never touch the "
                        f"role, queue, branch, authority or gate",
                    )
                )
    return problems


def adapter_policy_hits(text: str) -> list[str]:
    """Policy vocabulary an adapter may not use, ignoring prohibitions of it."""
    return [
        m.group(1) for line in text.splitlines()
        for m in ADAPTER_FORBIDDEN.finditer(line)
        if not negated(line, m.start())
    ]


# --- Command line -----------------------------------------------------------
#
# See the note in `authority.py`: the path walk is duplicated there rather than
# shared, because both files are copied standalone into other repositories and
# a scanner that needs a private helper module breaks when only it is copied.


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
    """Scan files or directories for provider-shaped lane identity.

    `--roles` is required and has no default. That is the same fail-closed
    decision `scan` makes by raising on an empty role set: every rule here is
    expressed over the caller's declared roles, so guessing them would make the
    scan quietly meaningless rather than loudly wrong.

    Exit 0 clean, 1 findings, 2 nothing scanned.
    """
    import argparse

    ap = argparse.ArgumentParser(
        prog="neutrality.py",
        description=(
            "Detect provider-shaped lane identity -- roles, branch namespaces, "
            "queues and topology that derive from a vendor rather than a role."
        ),
        epilog=(
            "Scans exactly what it is pointed at. Selecting the normative "
            "surface is the caller's job -- a historical document that names "
            "the tool that actually ran will report findings, correctly. "
            "Exit status: 0 clean, 1 findings found, 2 nothing was scanned."
        ),
    )
    ap.add_argument(
        "paths", nargs="+",
        help="files, or directories to scan recursively for *.md",
    )
    ap.add_argument(
        "--roles", required=True,
        help="comma-separated executor roles this project declares, e.g. "
             "'worker,verifier' -- the single source of truth for lane identity",
    )
    ap.add_argument(
        "--coordinator", default="brain",
        help="the coordinating role, which may also own branches "
             "(default: brain)",
    )
    ap.add_argument(
        "--queue-pattern", default=None,
        help="optional regex with one capture group yielding a queue stem; "
             "only for projects that keep such files",
    )
    ap.add_argument(
        "--max-lanes", type=int, default=None,
        help="optional; prose claiming more standing lanes than this is a "
             "violation. Leave unset for documents discussing several topologies",
    )
    ap.add_argument(
        "--quiet", action="store_true",
        help="print nothing; use the exit status only",
    )
    args = ap.parse_args(argv)

    roles = tuple(r.strip() for r in args.roles.split(",") if r.strip())
    if not roles:
        print("neutrality: --roles must name at least one role; an empty set "
              "would make every rule vacuous", file=sys.stderr)
        return 2

    try:
        files = _iter_files(args.paths)
    except OSError as exc:
        print(f"neutrality: cannot scan requested path: {exc}", file=sys.stderr)
        return 2
    if not files:
        print("neutrality: no files matched; refusing to report success",
              file=sys.stderr)
        return 2

    try:
        discovered_namespaces = branch_namespaces_for_paths(
            args.paths, roles=roles, coordinator=args.coordinator,
        )
    except (OSError, ValueError) as exc:
        print(f"neutrality: cannot read branch namespace declaration: {exc}", file=sys.stderr)
        return 2
    branch_namespaces = discovered_namespaces

    findings: list[Finding] = []
    inert: list[str] = []
    for path in files:
        try:
            text = path.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError) as exc:
            print(f"neutrality: cannot read {path}: {exc}", file=sys.stderr)
            return 2
        try:
            result = scan(
                text, roles,
                source=str(path),
                coordinator=args.coordinator,
                branch_namespaces=branch_namespaces,
                queue_pattern=args.queue_pattern,
                max_lanes=args.max_lanes,
            )
        except ValueError as exc:
            print(f"neutrality: {exc}", file=sys.stderr)
            return 2
        findings += result.findings
        findings += scan_adapter_blocks(text, source=str(path))
        # An exemption that protects nothing is a silent widening of the guard.
        inert += [
            f"{path}:{c.line} counterexample block suppresses nothing"
            for c in result.inert_counterexamples()
        ]

    if not args.quiet:
        for finding in findings:
            print(finding)
        for line in inert:
            print(line)
        print(
            f"neutrality: {len(findings) + len(inert)} finding(s) in "
            f"{len(files)} file(s)",
            file=sys.stderr,
        )
    return 1 if (findings or inert) else 0


if __name__ == "__main__":
    sys.exit(main())
