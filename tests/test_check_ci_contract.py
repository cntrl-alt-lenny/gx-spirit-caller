"""Tests for tools/check_ci_contract.py.

Synthetic workflow fixtures only — no network, no `gh`, no toolchain. The one
real-repo assertion reads this repository's own committed workflows, which are
always present in a checkout.

The regression anchor is `test_paths_filtered_required_check_is_an_error`: that
is the PR #1365 deadlock (a required check carrying a `paths:` filter never
reports, so the PR blocks forever). It failed against a pre-fix
generated-files-drift.yml and passes after.
"""
from __future__ import annotations

import sys
import tempfile
import textwrap
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))

import check_ci_contract as cc  # noqa: E402


def _write(directory: Path, name: str, body: str) -> None:
    (directory / name).write_text(textwrap.dedent(body).lstrip(), encoding="utf-8")


class _Base(unittest.TestCase):
    def setUp(self) -> None:
        self._tmp = tempfile.TemporaryDirectory()
        self.dir = Path(self._tmp.name)
        self.addCleanup(self._tmp.cleanup)

    def index_for(self, **workflows: str) -> dict:
        for name, body in workflows.items():
            _write(self.dir, f"{name}.yml", body)
        return cc.resolve_contexts(cc.load_workflows(self.dir))


class TestFilterDetection(_Base):
    def test_paths_filtered_required_check_is_an_error(self):
        # PR #1365 regression anchor. A required check whose workflow is
        # paths-filtered never reports, so the PR blocks forever.
        index = self.index_for(drift="""
            name: Generated files drift
            on:
              pull_request:
                paths:
                  - 'tools/**.py'
            jobs:
              drift-check:
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        problems = cc.check(["drift-check"], index)
        self.assertEqual(len(problems), 1, problems)
        self.assertIn("CONDITIONAL", problems[0])
        self.assertIn("blocks forever", problems[0])

    def test_unfiltered_required_check_passes(self):
        index = self.index_for(drift="""
            on:
              pull_request:
            jobs:
              drift-check:
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        self.assertEqual(cc.check(["drift-check"], index), [])

    def test_empty_pull_request_body_means_every_pr_not_absent(self):
        # `pull_request:` with no body parses to None. Treating that as
        # "absent" instead of "unconditional" is the exact confusion this
        # tool exists to catch, so it gets its own test.
        doc = {"on": {"pull_request": None}}
        self.assertEqual(cc._pr_filters(doc), (True, []))

    def test_bare_on_key_parsed_as_yaml_boolean_is_handled(self):
        # PyYAML resolves an unquoted `on:` to True (YAML 1.1 booleans).
        doc = {True: {"pull_request": None}, "jobs": {}}
        self.assertEqual(cc._pr_filters(doc), (True, []))

    def test_branches_filter_also_counts_as_conditional(self):
        index = self.index_for(w="""
            on:
              pull_request:
                branches: [release]
            jobs:
              gate:
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        problems = cc.check(["gate"], index)
        self.assertTrue(any("CONDITIONAL" in p for p in problems), problems)

    def test_workflow_without_pull_request_supplies_no_context(self):
        index = self.index_for(w="""
            on:
              push:
                branches: [main]
            jobs:
              gate:
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        self.assertNotIn("gate", index)
        problems = cc.check(["gate"], index)
        self.assertTrue(any("NEVER REPORTS" in p for p in problems), problems)


class TestContextResolution(_Base):
    def test_job_id_is_the_context_when_no_name(self):
        index = self.index_for(w="""
            on: {pull_request: null}
            jobs:
              unittest:
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        self.assertIn("unittest", index)

    def test_name_overrides_job_id(self):
        index = self.index_for(w="""
            on: {pull_request: null}
            jobs:
              python:
                name: Python (ruff)
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        self.assertIn("Python (ruff)", index)
        self.assertNotIn("python", index)

    def test_matrix_expands_to_one_context_per_combination(self):
        index = self.index_for(w="""
            on: {pull_request: null}
            jobs:
              compile:
                name: Compile changed C (${{ matrix.region }})
                strategy:
                  matrix:
                    region: [eur, usa, jpn]
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        for region in ("eur", "usa", "jpn"):
            self.assertIn(f"Compile changed C ({region})", index)

    def test_renamed_job_orphans_its_required_context(self):
        index = self.index_for(w="""
            on: {pull_request: null}
            jobs:
              python:
                name: Python (ruff-v2)
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        problems = cc.check(["Python (ruff)"], index)
        self.assertEqual(len(problems), 1, problems)
        self.assertIn("NEVER REPORTS", problems[0])

    def test_case_mismatch_gets_an_explicit_hint(self):
        index = self.index_for(w="""
            on: {pull_request: null}
            jobs:
              drift-check:
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        problems = cc.check(["Drift-Check"], index)
        self.assertIn("case-sensitive", problems[0])

    def test_unresolvable_expression_is_reported_not_guessed(self):
        index = self.index_for(w="""
            on: {pull_request: null}
            jobs:
              gate:
                name: Gate ${{ github.event.number }}
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
        """)
        ctx = next(iter(index))
        problems = cc.check([ctx], index)
        self.assertTrue(any("UNRESOLVABLE" in p for p in problems), problems)


class TestAmbiguity(_Base):
    def test_same_context_from_two_workflows_is_ambiguous(self):
        index = self.index_for(
            a="""
            on: {pull_request: null}
            jobs:
              main-baseline:
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
            """,
            b="""
            on: {pull_request: null}
            jobs:
              main-baseline:
                runs-on: ubuntu-latest
                steps: [{run: echo hi}]
            """,
        )
        problems = cc.check(["main-baseline"], index)
        self.assertTrue(any("AMBIGUOUS" in p for p in problems), problems)


class TestContractLoading(_Base):
    def test_comments_and_blanks_ignored(self):
        p = self.dir / "required.txt"
        p.write_text("# a comment\n\nPython (ruff)  # trailing\n\ndrift-check\n",
                     encoding="utf-8")
        self.assertEqual(cc.load_contract(p), ["Python (ruff)", "drift-check"])

    def test_empty_contract_refuses_to_pass_vacuously(self):
        p = self.dir / "required.txt"
        p.write_text("# nothing but comments\n", encoding="utf-8")
        with self.assertRaises(cc.ContractError) as ctx:
            cc.load_contract(p)
        self.assertIn("vacuous", str(ctx.exception))

    def test_missing_contract_is_a_loud_error(self):
        with self.assertRaises(cc.ContractError):
            cc.load_contract(self.dir / "does-not-exist.txt")

    def test_unparseable_workflow_is_a_loud_error(self):
        _write(self.dir, "bad.yml", "on: {pull_request:\n  broken: [")
        with self.assertRaises(cc.ContractError):
            cc.load_workflows(self.dir)

    def test_empty_workflow_dir_is_a_loud_error(self):
        with self.assertRaises(cc.ContractError):
            cc.load_workflows(self.dir)


class TestRealRepo(unittest.TestCase):
    """This repository's own CI configuration must be coherent."""

    def test_committed_contract_is_satisfiable(self):
        index = cc.resolve_contexts(cc.load_workflows())
        problems = cc.check(cc.load_contract(), index)
        self.assertEqual(
            problems, [],
            msg="This repo's required checks cannot all report — every PR will "
                "block. Details:\n  " + "\n  ".join(problems),
        )

    def test_every_required_context_comes_from_an_unfiltered_workflow(self):
        index = cc.resolve_contexts(cc.load_workflows())
        for ctx in cc.load_contract():
            for provider in index.get(ctx, []):
                self.assertTrue(
                    provider["unconditional"],
                    f"required check {ctx!r} is filtered on "
                    f"{provider['filters']} in {provider['workflow']}",
                )


if __name__ == "__main__":
    unittest.main()
