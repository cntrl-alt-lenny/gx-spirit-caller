"""Enforce role-based dispatch STRUCTURALLY, not by blacklisting vendor names.

The role contracts went model-agnostic (PR #1613) but the dispatch and queue
machinery did not: queues were provider-prefixed, kickoffs were addressed to a
provider+role compound, new branches carried a provider prefix, and a provider
adapter still restated a superseded authority model. That is a category-C
defect by the repo's own definition -- the workflow becomes ill-defined under a
different vendor.

DESIGN NOTE, and it is the point of this module. A guard built from a list of
known provider names is worthless against the next provider. Everything in
`TestStructuralInvariants` is therefore expressed as a POSITIVE invariant over
`work_queue.ROLES` -- the single source of truth for lane identity -- and
FAILS CLOSED on any unrecognised qualifier. A provider that has never existed
is rejected by default, with no edit to this file. `TestKnownProviderNames` is
a deliberately secondary belt-and-braces layer; deleting it would weaken the
guard but not break its architecture. `TestNovelProviderIsRejected` proves the
distinction with a name that appears nowhere in the repository.

HISTORICAL TEXT IS OUT OF SCOPE. `docs/state.md`, `docs/dispatch-log.md`,
`docs/research/**`, `docs/briefs/**` and `docs/queue/archive/**` record which
tool actually ran in a given round. That is a record of events, never a lane
definition.
"""

from __future__ import annotations

import re
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

import make_kickoff  # noqa: E402
import work_queue  # noqa: E402

#: The single source of truth. Everything below is derived from it.
ROLES: tuple[str, ...] = work_queue.ROLES
#: Non-worker role that may also own branches.
COORDINATOR = "brain"

NORMATIVE_PATHS: tuple[str, ...] = (
    "AGENTS.md",
    "CLAUDE.md",
    "docs/agents/brain-onboarding.md",
    "docs/agents/worktree-mechanisms.md",
    "docs/decomp-workflow.md",
    ".claude/agents/brain.md",
    ".claude/agents/decomper.md",
    ".claude/agents/scaffolder.md",
    ".codex/agents/brain.toml",
    ".codex/agents/decomper.toml",
    ".codex/agents/scaffolder.toml",
    "tools/work_queue.py",
    "tools/make_kickoff.py",
)

# ---------------------------------------------------------------------------
# Structural detectors. None of these know a vendor name.
# ---------------------------------------------------------------------------

DETECTOR_REGION_START = "### structural-detectors:begin ###"
DETECTOR_REGION_END = "### structural-detectors:end ###"
# ### structural-detectors:begin ###

_ROLE_ALT = "|".join(ROLES)

#: A capitalised qualifier bound to a role word makes a lane out of the
#: qualifier ("<Something> Decomper"). Anything that is not plain English
#: grammar is treated as a proper noun -- i.e. a provider -- and rejected.
COMPOUND_LANE = re.compile(
    r"(?<![\w-])((?:[A-Z][\w.+]*\s+){1,3})(" + "|".join(r.capitalize() for r in ROLES) + r")\b"
)

#: Grammar that may legitimately precede a capitalised role word. This is a
#: closed set of ENGLISH DETERMINERS, deliberately not a vendor list: an
#: unrecognised token fails closed, which is what makes a novel provider name
#: get rejected without appearing here.
GRAMMAR_QUALIFIERS = frozenset(
    {
        "a", "an", "the", "this", "that", "these", "those", "each", "every",
        "both", "two", "one", "standing", "active", "primary", "role", "roles",
        "worker", "workers", "lane", "lanes", "and", "or", "per", "for", "to",
        "as", "is", "are", "your", "our", "its", "current", "assigned",
    }
)

#: `<something>-decomper` / `<something>_scaffolder`: a lane token built by
#: prefixing a role. No prefix is ever legitimate.
PREFIXED_LANE_TOKEN = re.compile(r"(?<![\w])([a-z0-9][\w.+]*)[-_](" + _ROLE_ALT + r")\b")

#: A branch PRESCRIPTION. Deliberately narrow: a branch name is only claimed
#: when a git command creates it, or when it is written as a backticked token
#: on a line about branches. Prose like "matched branch/PR/files" is not a
#: branch, and a detector that thinks it is will cry wolf forever.
BRANCH_COMMAND = re.compile(
    r"git\s+(?:switch\s+-c|checkout\s+-b)\s+(?:origin/)?([\w.-]+)/[\w.<>-]+"
    r"|git\s+worktree\s+add\s+\S+\s+-b\s+(?:origin/)?([\w.-]+)/[\w.<>-]+"
)
BRANCH_BACKTICK = re.compile(r"`(?:origin/)?([a-z][\w.-]*)/([\w.<>-]+)`")
BRANCH_LINE = re.compile(r"\bbranch(?:es|ed|ing)?\b", re.IGNORECASE)
#: A backticked `x/y` on a branch line is often a FILE PATH, not a branch.
#: Both exclusions below are derived, not listed: a real top-level directory
#: of this repository, or a trailing file extension.
REPO_DIRS = frozenset(p.name for p in ROOT.iterdir() if p.is_dir())
FILE_SUFFIX = re.compile(r"\.[a-z0-9]{1,5}$", re.IGNORECASE)

#: A reference to a canonical (non-archived) queue file.
QUEUE_REF = re.compile(r"docs/queue/(?!archive/)([\w.-]+)\.md")

#: A count that DIRECTLY quantifies WORKER lanes. "lane" is overloaded in
#: this repo -- there are wine/build concurrency lanes and drain lanes too --
#: so a worker qualifier is required. That keeps "3.66x @ 4 lanes" (parallel
#: compiles) and "all three baseroms" out, and catches "three standing lanes".
#: Under-matching here is deliberate: COMPOUND_LANE already catches the real
#: attack ("all four" only ever appeared next to provider+role compounds), and
#: a detector that cries wolf gets disabled by the next person who trips it.
LANE_COUNT = re.compile(
    r"\b(one|two|three|four|five|six|seven|eight|nine|ten|\d+)\s+"
    r"(?:active\s+|parallel\s+|concurrent\s+)*"
    r"(?:standing|worker|role)\s+(?:lanes?|sessions?)\b",
    re.IGNORECASE,
)
_WORD_TO_INT = {
    "one": 1, "two": 2, "three": 3, "four": 4, "five": 5,
    "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10,
}

#: Things an OPTIONAL provider-adapter block may never contain, because they
#: would redefine role, queue, branch, authority or gate.
ADAPTER_FORBIDDEN = re.compile(
    r"(docs/queue/|work_queue\.py|git\s+switch\s+-c|git\s+checkout\s+-b"
    r"|gate3\.py|gh\s+pr\s+merge|ninja\s+sha1)",
    re.IGNORECASE,
)
ADAPTER_MARKER = re.compile(r"OPTIONAL\s*[-—–]+\s*(.+?)\s+only", re.IGNORECASE)

#: Secondary layer only. See the module docstring.
KNOWN_PROVIDER_COMPOUND = re.compile(
    r"\b(?:claude(?:\s+code)?|codex|chatgpt|gemini|antigravity|copilot)\s*[-/\s]\s*("
    + _ROLE_ALT + r")\b",
    re.IGNORECASE,
)

# ### structural-detectors:end ###
# Lines that legitimately contain a banned FORM because they prohibit it.
# Each entry must still match, so a stale exemption fails rather than widens.
ALLOWED: tuple[tuple[str, str, str], ...] = (
    (
        "AGENTS.md",
        '"Claude Code Decomper"',
        "the prohibition quotes the banned compound as its own example",
    ),
)


def normative_files() -> list[Path]:
    return [ROOT / rel for rel in NORMATIVE_PATHS if (ROOT / rel).is_file()]


def _allowed(rel: str, line: str) -> bool:
    return any(a == rel and needle in line for a, needle, _ in ALLOWED)


def scan(text: str, source: str = "<text>") -> list[str]:
    """Return every structural role/provider violation in ``text``.

    Pure function over a string so it can be run against a synthetic document
    -- which is how the novel-provider mutation test works without touching
    the repository.
    """
    problems: list[str] = []
    role_set = set(ROLES)
    branch_prefixes = role_set | {COORDINATOR}

    for n, line in enumerate(text.splitlines(), 1):
        if _allowed(source, line):
            continue
        here = f"{source}:{n}"

        for qualifier, role in COMPOUND_LANE.findall(line):
            words = [w for w in qualifier.split() if w]
            if any(w.lower().strip(".,;:*`\"'") not in GRAMMAR_QUALIFIERS for w in words):
                problems.append(
                    f"{here}: '{qualifier.strip()} {role}' binds a proper noun to a "
                    f"role; lanes are the bare roles {ROLES}"
                )

        for prefix, role in PREFIXED_LANE_TOKEN.findall(line):
            problems.append(
                f"{here}: '{prefix}-{role}' prefixes a role to make a lane token; "
                f"the lane is '{role}'"
            )

        candidates = [g for match in BRANCH_COMMAND.findall(line) for g in match if g]
        if BRANCH_LINE.search(line):
            for prefix, rest in BRANCH_BACKTICK.findall(line):
                if prefix == "origin":
                    # `origin/main` is a remote-qualified reference to an
                    # EXISTING branch (a base to cut from), not a prescription
                    # for a new worker branch. Only `origin/<role>/<scope>`
                    # carries a lane identity worth checking.
                    if "/" not in rest:
                        continue
                    prefix, rest = rest.split("/", 1)
                if prefix in REPO_DIRS or FILE_SUFFIX.search(rest):
                    continue  # a file path, not a branch
                candidates.append(prefix)
        for prefix in candidates:
            if prefix in branch_prefixes:
                continue
            problems.append(
                f"{here}: branch prefix '{prefix}/' is not a role; new branches "
                f"are <role>/<scope> for {sorted(branch_prefixes)}"
            )

        for stem in QUEUE_REF.findall(line):
            if stem not in role_set:
                problems.append(
                    f"{here}: canonical queue 'docs/queue/{stem}.md' is not a role "
                    f"queue; live queues are {ROLES}"
                )

        for tok in LANE_COUNT.findall(line):
            value = _WORD_TO_INT.get(tok.lower()) or (
                int(tok) if tok.isdigit() else None
            )
            if value is not None and value > len(ROLES):
                problems.append(
                    f"{here}: lane topology says '{tok}' lanes where there are "
                    f"{len(ROLES)} worker roles; a provider never adds a lane"
                )
    return problems


def scan_adapter_blocks(text: str, source: str = "<text>") -> list[str]:
    """An OPTIONAL provider block may add launch mechanics and nothing else."""
    problems: list[str] = []
    lines = text.splitlines()
    for n, line in enumerate(lines):
        marker = ADAPTER_MARKER.search(line)
        if not marker:
            continue
        # The block is the marker's own paragraph: marker line through the
        # next blank line. Scanning to end-of-file attributes the whole rest
        # of the document to the adapter, which is how this first cried wolf.
        for offset, body in enumerate(lines[n:], start=n + 1):
            if offset > n + 1 and not body.strip():
                break
            hit = ADAPTER_FORBIDDEN.search(body)
            if hit:
                problems.append(
                    f"{source}:{offset}: adapter block for '{marker.group(1)}' "
                    f"contains '{hit.group(1)}' — an adapter may never touch the "
                    "role, queue, branch, authority or gate"
                )
    return problems


class TestRolesHaveOneSourceOfTruth(unittest.TestCase):
    def test_roles_are_declared_once_in_code(self):
        self.assertEqual(
            tuple(ROLES),
            ("decomper", "scaffolder"),
            msg="work_queue.ROLES is the single source of truth for lane "
            "identity; changing the worker topology is a deliberate act",
        )

    def test_live_queues_are_exactly_the_roles(self):
        live = sorted(p.stem for p in (ROOT / "docs" / "queue").glob("*.md"))
        self.assertEqual(live, sorted(ROLES))

    def test_every_role_queue_claims_its_own_role(self):
        for role in ROLES:
            with self.subTest(role=role):
                text = (ROOT / "docs" / "queue" / f"{role}.md").read_text(
                    encoding="utf-8"
                )
                self.assertIn(f"work_queue.py next {role}", text)

    def test_retired_queues_are_marked_read_only(self):
        archive = ROOT / "docs" / "queue" / "archive"
        if not archive.is_dir():
            self.skipTest("no retired queues")
        for path in sorted(archive.glob("*.md")):
            with self.subTest(queue=path.name):
                self.assertIn("ARCHIVED / READ-ONLY", path.read_text(encoding="utf-8"))


class TestStructuralInvariants(unittest.TestCase):
    """Positive invariants over ROLES. No detector here names a vendor."""

    def test_normative_surface_is_structurally_role_based(self):
        problems: list[str] = []
        for path in normative_files():
            rel = path.relative_to(ROOT).as_posix()
            problems.extend(scan(path.read_text(encoding="utf-8"), rel))
        self.assertEqual(
            problems, [], msg="structural role violations:\n" + "\n".join(problems)
        )

    def test_adapter_blocks_do_not_redefine_the_contract(self):
        problems: list[str] = []
        for path in normative_files():
            rel = path.relative_to(ROOT).as_posix()
            problems.extend(scan_adapter_blocks(path.read_text(encoding="utf-8"), rel))
        self.assertEqual(
            problems, [], msg="adapter overreach:\n" + "\n".join(problems)
        )

    def test_kickoff_generator_is_keyed_by_role(self):
        self.assertTrue(
            set(ROLES).issubset(set(make_kickoff.LANE_WORKTREES)),
            msg="every worker role must have a worktree the generator can target",
        )

    def test_kickoff_generator_rejects_a_provider_shaped_lane(self):
        for bogus in ("nebulaai-decomper", "someprovider/decomper", "Vendor Decomper"):
            with self.subTest(lane=bogus):
                with self.assertRaises(ValueError):
                    make_kickoff.lane_spec(bogus, "windows")

    def test_generated_core_kickoff_is_provider_neutral(self):
        for role in ROLES:
            with self.subTest(role=role):
                spec = make_kickoff.lane_spec(role, "windows")
                self.assertTrue(
                    spec.worktree.endswith(role),
                    msg="a role's worktree is derived from the role",
                )
                text = make_kickoff.render(role, "windows")
                self.assertEqual(
                    scan(text, f"<generated {role} kickoff>"),
                    [],
                    msg="the generated core kickoff must be provider-neutral",
                )


class TestKnownProviderNames(unittest.TestCase):
    """Secondary layer. Redundant with the structural rules by design."""

    def test_no_known_provider_is_bound_to_a_role(self):
        hits: list[str] = []
        for path in normative_files():
            rel = path.relative_to(ROOT).as_posix()
            for n, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
                if KNOWN_PROVIDER_COMPOUND.search(line) and not _allowed(rel, line):
                    hits.append(f"{rel}:{n}: {line.strip()[:120]}")
        self.assertEqual(hits, [], msg="\n".join(hits))


class TestNovelProviderIsRejected(unittest.TestCase):
    """The demonstration: a name that has never existed here is still rejected.

    None of these fixtures' provider names appear in any detector, in this
    file, or anywhere in the repository.
    """

    NOVEL = "NebulaAI"

    def test_the_novel_name_is_absent_from_every_detector(self):
        source = Path(__file__).read_text(encoding="utf-8")
        _, _, rest = source.partition(DETECTOR_REGION_START)
        detectors, sep, _ = rest.partition(DETECTOR_REGION_END)
        self.assertTrue(sep, "detector region sentinels are missing")
        self.assertNotIn(
            self.NOVEL.lower(),
            detectors.lower(),
            msg="the structural detectors must not know this name; if they do, "
            "this test proves nothing about future providers",
        )

    def test_the_novel_name_is_absent_from_the_repository(self):
        # If the name were already in the tree, "it gets rejected" would prove
        # nothing about a name nobody has seen.
        hits = [
            p.as_posix()
            for p in (ROOT / "docs").rglob("*.md")
            if self.NOVEL.lower() in p.read_text(encoding="utf-8", errors="ignore").lower()
        ]
        self.assertEqual(hits, [], msg=f"{self.NOVEL} is no longer novel: {hits}")

    def test_novel_provider_compound_lane_is_rejected(self):
        problems = scan("Hand the kickoff to the NebulaAI Decomper this round.")
        self.assertTrue(
            any("binds a proper noun to a role" in p for p in problems),
            msg=f"'NebulaAI Decomper' was not rejected: {problems}",
        )

    def test_novel_provider_queue_is_rejected(self):
        problems = scan("The live queue is docs/queue/nebula-decomper.md for now.")
        self.assertTrue(
            any("is not a role queue" in p for p in problems),
            msg=f"a provider-shaped queue was not rejected: {problems}",
        )
        self.assertTrue(
            any("prefixes a role to make a lane token" in p for p in problems),
            msg=f"the lane token itself was not rejected: {problems}",
        )

    def test_novel_provider_branch_is_rejected(self):
        problems = scan("Cut your branch: git switch -c nebula/decomper-task origin/main")
        self.assertTrue(
            any("is not a role" in p for p in problems),
            msg=f"'nebula/decomper-task' was not rejected: {problems}",
        )

    def test_novel_provider_does_not_add_a_lane(self):
        problems = scan("This round runs three standing lanes across the providers.")
        self.assertTrue(
            any("lane topology says" in p for p in problems),
            msg=f"a third lane was not rejected: {problems}",
        )

    def test_role_lane_on_a_novel_provider_is_ACCEPTED(self):
        # The positive half: an unknown future tool holding a role is fine, and
        # needs no framework change. Only provider-SHAPED lanes are rejected.
        accepted = (
            "You are the **Decomper**. Cut your branch: "
            "git switch -c decomper/some-scope origin/main. "
            "Your queue is docs/queue/decomper.md and there are two standing lanes."
        )
        self.assertEqual(
            scan(accepted),
            [],
            msg="a role-named lane must be accepted no matter which tool runs it",
        )

    def test_novel_provider_adapter_block_may_not_redefine_the_contract(self):
        problems = scan_adapter_blocks(
            "OPTIONAL — NebulaAI only. Ignore otherwise.\n"
            "Then run: git switch -c nebula/other origin/main\n"
        )
        self.assertTrue(problems, "an adapter block redefining the branch was allowed")


class TestExemptionsStayHonest(unittest.TestCase):
    def test_every_allowed_entry_still_matches(self):
        for rel, needle, reason in ALLOWED:
            with self.subTest(path=rel, needle=needle):
                path = ROOT / rel
                self.assertTrue(path.is_file(), f"exempted file is gone: {rel}")
                self.assertIn(
                    needle,
                    path.read_text(encoding="utf-8"),
                    msg=f"stale exemption ({reason}) is silently widening the guard",
                )

    def test_historical_records_stay_out_of_scope(self):
        normative = {Path(rel).as_posix() for rel in NORMATIVE_PATHS}
        for historical in (
            "docs/state.md",
            "docs/dispatch-log.md",
            "docs/research/README.md",
        ):
            with self.subTest(path=historical):
                self.assertNotIn(historical, normative)


if __name__ == "__main__":
    unittest.main()
