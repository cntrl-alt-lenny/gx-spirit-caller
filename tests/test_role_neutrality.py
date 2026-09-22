"""Provider neutrality for this project's normative surface.

Lane identity — roles, branch namespaces, queues, dispatch topology — must
derive from ROLES and never from whichever provider, model or tool happens to be
running a seat. This test enforces that STRUCTURALLY: every rule is a positive
invariant over ROLES below, and fails closed on anything unrecognised. A
provider that has never existed is rejected without editing this file.

Historical text is deliberately out of scope. Round logs, archived briefs and
research notes record which tool actually ran; that is a record of events, never
a lane definition. Only the normative surface is scanned.

Installed by the agentic project framework. `tools/neutrality.py` holds the
scanner and the reasoning behind each rule.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

import authority  # noqa: E402
import neutrality  # noqa: E402
import textblocks  # noqa: E402

#: The single source of truth for this project's lane identity. Changing the
#: topology is a deliberate act and goes to the owner — see AGENTS.md.
ROLES: tuple[str, ...] = ('decomper', 'scaffolder', 'verifier')
COORDINATOR = "brain"

# A project may declare the framework's bounded structural forms or a custom
# lower-case label with tracked project-structure evidence in AGENTS.md. The
# installed guard carries that declaration to every normative document. It
# checks syntax and evidence, not provider identity.
_BRANCH_NAMESPACE_ERROR = None
try:
    BRANCH_NAMESPACES = neutrality.branch_namespaces_for_paths(
        [str(ROOT)], roles=ROLES, coordinator=COORDINATOR
    )
except ValueError as exc:
    # Keep the guard as a unittest failure with a summary instead of aborting
    # test discovery before any result can be reported.
    BRANCH_NAMESPACES = ()
    _BRANCH_NAMESPACE_ERROR = str(exc)

#: A name that must appear nowhere else in this repository, so that "it gets
#: rejected" proves something about providers nobody has heard of yet.
NOVEL = "NebulaAI"


def normative_files() -> list[Path]:
    """The documents that define policy, as opposed to recording history.

    Derived from the tree rather than enumerated, so a new normative document
    cannot silently escape the scan by not being on a list.
    """
    paths = [ROOT / "AGENTS.md"]
    agents_dir = ROOT / "docs" / "agents"
    if agents_dir.is_dir():
        paths += sorted(
            p for p in agents_dir.rglob("*.md")
            # These two record what actually happened, including tool names.
            if p.name not in {"failure-catalogue.md", "case-studies.md"}
        )
    return [p for p in paths if p.is_file()]


class TestNormativeSurfaceIsRoleBased(unittest.TestCase):
    def test_branch_namespace_declaration_is_valid(self):
        self.assertIsNone(_BRANCH_NAMESPACE_ERROR, _BRANCH_NAMESPACE_ERROR)

    def test_scan_set_is_not_empty(self):
        # Fail closed: a guard that scanned nothing must not report success.
        self.assertTrue(
            normative_files(),
            "no normative documents found — this guard would pass vacuously",
        )

    def test_no_provider_shaped_lane_identity(self):
        problems: list[str] = []
        for path in normative_files():
            result = neutrality.scan(
                path.read_text(encoding="utf-8"), ROLES,
                source=path.relative_to(ROOT).as_posix(), coordinator=COORDINATOR,
                branch_namespaces=BRANCH_NAMESPACES,
            )
            problems += [str(f) for f in result.findings]
        self.assertEqual(problems, [], "\n".join(problems))

    def test_no_stale_authority_language(self):
        """No text routing a routine merge back to the owner.

        The owner sets direction and keeps veto and reversal; they do not
        approve each round. This is the single most likely thing to creep back
        in, because it reads as polite.
        """
        problems: list[str] = []
        for path in normative_files():
            problems += [
                str(f) for f in authority.scan(
                    path.read_text(encoding="utf-8"),
                    source=path.relative_to(ROOT).as_posix(),
                )
            ]
        self.assertEqual(problems, [], "\n".join(problems))

    def test_counterexample_blocks_are_not_inert(self):
        """An exemption that protects nothing is a silent widening.

        A `guard:counterexample` block must declare offending text and roles
        that the real structural scanner rejects — otherwise either the text is
        not actually a violation, or the rule that used to catch it has
        regressed.
        """
        inert: list[str] = []
        for path in normative_files():
            rel = path.relative_to(ROOT).as_posix()
            blocks, _ = textblocks.counterexample_blocks(
                path.read_text(encoding="utf-8")
            )
            for line, body in blocks:
                caught = (
                    neutrality.scan_counterexample(
                        body, ROLES, coordinator=COORDINATOR
                    )
                    or authority.scan(body)
                )
                if not caught:
                    inert.append(f"{rel}:{line} — no guard rejects this block")
        self.assertEqual(inert, [], "\n".join(inert))

    def test_adapters_do_not_redefine_the_contract(self):
        problems: list[str] = []
        for path in normative_files():
            rel = path.relative_to(ROOT).as_posix()
            problems += [
                str(f) for f in neutrality.scan_adapter_blocks(
                    path.read_text(encoding="utf-8"), source=rel
                )
            ]
        self.assertEqual(problems, [], "\n".join(problems))


class TestNovelProviderIsRejected(unittest.TestCase):
    """The demonstration. None of these names appear in any detector."""

    def test_the_novel_name_is_absent_from_the_scanner(self):
        source = (ROOT / "tools" / "neutrality.py").read_text(encoding="utf-8")
        self.assertNotIn(
            NOVEL.lower(), source.lower(),
            "the scanner must not know this name; if it does, this test proves "
            "nothing about future providers",
        )

    def test_compound_lane_is_rejected(self):
        role = ROLES[0].capitalize()
        result = neutrality.scan(
            f"Hand the brief to the {NOVEL} {role} this round.",
            ROLES, coordinator=COORDINATOR,
            branch_namespaces=BRANCH_NAMESPACES,
        )
        self.assertTrue(
            any(f.rule == "compound-lane" for f in result.findings),
            f"'{NOVEL} {role}' was not rejected: {result.report()}",
        )

    def test_prefixed_lane_token_is_rejected(self):
        result = neutrality.scan(
            f"The queue is nebula-{ROLES[0]} for now.",
            ROLES, coordinator=COORDINATOR,
            branch_namespaces=BRANCH_NAMESPACES,
        )
        self.assertTrue(
            any(f.rule == "prefixed-lane" for f in result.findings),
            f"a provider-shaped lane token was not rejected: {result.report()}",
        )

    def test_provider_branch_namespace_is_rejected(self):
        result = neutrality.scan(
            f"Cut your branch: git switch -c nebula/{ROLES[0]}-task origin/main",
            ROLES, coordinator=COORDINATOR,
            branch_namespaces=BRANCH_NAMESPACES,
        )
        self.assertTrue(
            any(f.rule == "branch-namespace" for f in result.findings),
            f"a provider branch namespace was not rejected: {result.report()}",
        )

    def test_a_role_lane_on_any_tool_is_ACCEPTED(self):
        # The positive half: an unknown future tool holding a role is fine and
        # needs no framework change. Only provider-SHAPED lanes are rejected.
        role = ROLES[0]
        accepted = (
            f"You are the **{role.capitalize()}**. Cut your branch: "
            f"git switch -c {role}/some-scope origin/main"
        )
        result = neutrality.scan(
            accepted, ROLES, coordinator=COORDINATOR,
            branch_namespaces=BRANCH_NAMESPACES,
        )
        self.assertEqual(
            [str(f) for f in result.findings], [],
            "a role-named lane must be accepted no matter which tool runs it",
        )


if __name__ == "__main__":
    unittest.main()
