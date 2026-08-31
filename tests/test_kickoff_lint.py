"""Tests for tools/kickoff_lint.py (R&D r8 §4).

Pure text analysis — no build, CI-safe. A known-good kickoff (modeled on the
brief-610 naming campaign: preflight + canary + explicit effort + paste-a-real-
artifact + worktree retry-loop) must lint clean; kickoffs missing each guard
must fail the corresponding required check.
"""

from __future__ import annotations

import shutil
import subprocess
import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from kickoff_lint import (  # noqa: E402
    check_platform_coherence,
    check_preflight,
    check_referenced_commits,
    check_referenced_paths,
    lint,
)


# A well-formed kickoff (indented code blocks, no triple-backticks).
GOOD = """
Brief 610 — name the SDK layer. SET YOUR REASONING EFFORT TO HIGH.
Setup + PREFLIGHT:
    ls tools/nitro_suggest_renames.py && echo PREFLIGHT-OK || { echo "preflight failed"; exit 1; }
    for i in 1 2 3 4 5; do git worktree add ../codex-610 -b codex/naming-610 origin/main && break || { echo retry; sleep 3; }; done
    cd "$HOME/Dev/spirit-caller/codex-610"
    EXPECT="$HOME/Dev/spirit-caller/codex-610"
    [ "$(git rev-parse --show-toplevel)" = "$EXPECT" ] || { echo "WRONG WORKTREE"; exit 1; }
CANARY: rename ONE function, then run dsd check — it MUST stay green.
Finish: paste the total names added + the final dsd check green line for all 3 regions.
Reply with the PR URL + the sha1 result.
"""


ROOT = Path(__file__).resolve().parents[1]


def _reconstruction_commit(tool_path: str) -> str:
    result = subprocess.run(
        ["git", "log", "-1", "--format=%H", "--", tool_path],
        cwd=ROOT,
        capture_output=True,
        text=True,
        check=False,
    )
    return result.stdout.strip() if result.returncode == 0 else ""


def _round_0818b_dispatches(test_case: unittest.TestCase):
    for label, tool_path in (
        ("cm-restock-carve-9", "tools/wall_aware_headroom.py"),
        ("cm-main-wall-filtered-sweep-1", "tools/wall_prefilter.py"),
        ("ledger-ship-coverage", "tools/validate_attempts.py"),
        ("stdlib-unittest-fix", "tools/kickoff_lint.py"),
    ):
        commit = _reconstruction_commit(tool_path)
        if not commit:
            test_case.skipTest(f"no committed reconstruction source for {tool_path}")
        yield GOOD.replace(
            "Brief 610 — name the SDK layer.",
            f"Round 0818b reconstruction — {label}.",
        ).replace(
            "tools/nitro_suggest_renames.py",
            tool_path,
        ).replace(
            "CANARY: rename ONE function, then run dsd check — it MUST stay green.",
            f"CANARY: run git show {commit} --stat and paste the result.",
        )


class TestGoodKickoff(unittest.TestCase):
    def test_all_required_pass(self):
        failed = [c for c in lint(GOOD) if c.required and not c.ok]
        self.assertEqual(failed, [], f"good kickoff should lint clean, got: {[c.key for c in failed]}")

    def test_no_advisory_warnings(self):
        warns = [c for c in lint(GOOD) if not c.required and not c.ok]
        self.assertEqual(warns, [], f"good kickoff tripped advisories: {[c.key for c in warns]}")

    def test_reconstructed_round_0818b_dispatches_still_pass(self):
        for kickoff in _round_0818b_dispatches(self):
            with self.subTest(kickoff=kickoff.splitlines()[1]):
                self.assertEqual(
                    [check.key for check in lint(kickoff) if check.required and not check.ok],
                    [],
                )


class TestPowerShellLocationGuard(unittest.TestCase):
    """The Codex lanes run PowerShell, not bash.

    Accepting only the POSIX spelling made the linter a void-work generator:
    on 2026-08-08 a lane handed a bash-only guard transliterated it into
    PowerShell, Windows-ified the path to backslashes, and stopped after 17
    seconds -- while sitting in the CORRECT worktree. `git rev-parse
    --show-toplevel` always emits forward slashes on Windows.
    """

    _PWSH = (
        "PREFLIGHT — STOP-and-report on any failure:\n"
        "    Set-Location 'C:/Users/leona/Dev/gx-spirit-caller/kb-map'\n"
        "    $EXPECT = 'C:/Users/leona/Dev/gx-spirit-caller/kb-map'\n"
        "    if ((git rev-parse --show-toplevel) -ne $EXPECT) "
        "{ Write-Output 'WRONG WORKTREE'; exit 1 }\n"
        "CANARY: first item verified before the batch\n"
        "Effort: MEDIUM\n"
        "paste the real pytest tail\n"
    )

    def _fail_keys(self, text: str) -> set[str]:
        return {c.key for c in lint(text) if c.required and not c.ok}

    def test_powershell_form_is_accepted(self):
        self.assertNotIn("location-guard", self._fail_keys(self._PWSH))

    def test_powershell_replace_normalisation_is_accepted(self):
        text = self._PWSH.replace(
            "(git rev-parse --show-toplevel) -ne $EXPECT",
            "(git rev-parse --show-toplevel).Replace('\\','/') -ne $EXPECT",
        )
        self.assertNotIn("location-guard", self._fail_keys(text))

    def test_backslash_expect_path_is_rejected(self):
        """The exact shape that stopped the lane: a Windows-ified EXPECT."""
        text = self._PWSH.replace(
            "'C:/Users/leona/Dev/gx-spirit-caller/kb-map'",
            "'C:\\Users\\leona\\Dev\\gx-spirit-caller\\kb-map'",
        )
        self.assertIn("location-guard", self._fail_keys(text))

    def test_backslash_rejected_in_posix_form_too(self):
        text = GOOD.replace(
            '"$HOME/Dev/spirit-caller/codex-610"',
            '"C:\\Users\\leona\\Dev\\gx-spirit-caller\\decomper"',
        )
        self.assertIn("location-guard", self._fail_keys(text))

    def test_location_guard_requires_prior_establishment(self):
        text = self._PWSH.replace(
            "    Set-Location 'C:/Users/leona/Dev/gx-spirit-caller/kb-map'\n",
            "",
        )
        self.assertIn("location-guard", self._fail_keys(text))

    def test_location_guard_accepts_preceding_set_location(self):
        self.assertNotIn("location-guard", self._fail_keys(self._PWSH))


ROUND_0822_CODEX_KICKOFF = """
PREFLIGHT — STOP-and-report on any failure.
    $EXPECT = 'C:/Users/leona/Dev/gx-spirit-caller/kb-types'
    if ((git rev-parse --show-toplevel) -ne $EXPECT) { Write-Output 'WRONG WORKTREE'; exit 1 }
    if (-not (Test-Path tools/kickoff_lint.py)) { Write-Output 'MISSING TOOL'; exit 1 }
CANARY: run the first check and paste the pytest result.
SET YOUR REASONING EFFORT TO HIGH.
Reply with the pytest tail.
"""


class TestLocationGuardEstablishmentIncident(unittest.TestCase):
    def _fail_keys(self, text: str) -> set[str]:
        return {c.key for c in lint(text) if c.required and not c.ok}

    def test_round_0822_kickoff_as_sent_is_red(self):
        self.assertIn("location-guard", self._fail_keys(ROUND_0822_CODEX_KICKOFF))

    def test_round_0822_kickoff_with_set_location_is_green(self):
        fixed = (
            "Set-Location 'C:/Users/leona/Dev/gx-spirit-caller/kb-types'\n"
            + ROUND_0822_CODEX_KICKOFF
        )
        self.assertNotIn("location-guard", self._fail_keys(fixed))


class TestMissingGuards(unittest.TestCase):
    def _fail_keys(self, text: str) -> set[str]:
        return {c.key for c in lint(text) if c.required and not c.ok}

    def test_missing_canary(self):
        self.assertIn("canary", self._fail_keys(GOOD.replace("CANARY", "note")))

    def test_negated_canary_does_not_satisfy_the_check(self):
        """A kickoff that DECLINES a canary must not pass the canary check.

        Round 0828's scaffolder kickoff shipped with the literal sentence
        "No canary this round." and linted clean, because the check only
        looked for the word. A stated refusal is the opposite of a guard.
        """
        for phrasing in (
            "No canary this round -- just start batching.",
            "We will skip the canary entirely.",
            "There is no CANARY needed here.",
            "Do not bother with a canary.",
        ):
            with self.subTest(phrasing=phrasing):
                text = GOOD.replace(
                    "CANARY: rename ONE function, then run dsd check — it MUST stay green.",
                    phrasing,
                )
                self.assertIn("canary", self._fail_keys(text))

    def test_unrelated_negation_does_not_void_a_real_canary(self):
        """A negation about something else must not void the canary.

        Scoping negation to the canary's own sentence keeps
        "DO NOT USE SUB-AGENTS. CANARY: ..." passing.
        """
        text = GOOD.replace(
            "CANARY: rename ONE function, then run dsd check — it MUST stay green.",
            "DO NOT USE SUB-AGENTS.\n\nCANARY: rename ONE function, then run "
            "dsd check — it MUST stay green.",
        )
        self.assertNotIn("canary", self._fail_keys(text))

    def test_negated_preflight_does_not_satisfy_the_check(self):
        """A kickoff that DECLINES a preflight must not pass the preflight check.

        `check_preflight` required a PREFLIGHT mention plus any hard stop, and
        every kickoff contains an `exit 1` somewhere — so "No preflight this
        round" passed on an unrelated stop. The preflight guard is what
        prevents the wrong-worktree class that cost round 0822 two lanes.
        """
        for phrasing in (
            "No preflight this round -- the worktree is known good.",
            "We are skipping the preflight.",
            "There is no PREFLIGHT needed here.",
        ):
            with self.subTest(phrasing=phrasing):
                text = phrasing + chr(10) + "    [ -d x ] || { echo NOPE; exit 1; }"
                self.assertFalse(check_preflight(text)[0])

    def test_unrelated_negation_does_not_void_a_real_preflight(self):
        text = ("DO NOT USE SUB-AGENTS." + chr(10) + chr(10)
                + "PREFLIGHT -- STOP on any failure." + chr(10)
                + "    [ -d x ] || { echo NOPE; exit 1; }")
        self.assertTrue(check_preflight(text)[0])

    def test_missing_location_guard(self):
        self.assertIn("location-guard", self._fail_keys(GOOD.replace(
            '    EXPECT="$HOME/Dev/spirit-caller/codex-610"\n'
            '    [ "$(git rev-parse --show-toplevel)" = "$EXPECT" ] || '
            '{ echo "WRONG WORKTREE"; exit 1; }\n',
            "")))

    def test_location_probe_without_hard_stop_fails(self):
        text = ("PREFLIGHT: ls || exit 1\n"
                "pwd; echo current directory\n"
                "CANARY first check\nHIGH effort\npaste the sha1 line")
        self.assertIn("location-guard", self._fail_keys(text))

    def test_pwd_probe_with_stop_fails(self):
        text = GOOD.replace(
            '    EXPECT="$HOME/Dev/spirit-caller/codex-610"\n'
            '    [ "$(git rev-parse --show-toplevel)" = "$EXPECT" ] || '
            '{ echo "WRONG WORKTREE"; exit 1; }',
            "    pwd || exit 1",
        )
        self.assertIn("location-guard", self._fail_keys(text))

    def test_repo_root_probe_with_stop_fails(self):
        text = GOOD.replace(
            '    EXPECT="$HOME/Dev/spirit-caller/codex-610"\n'
            '    [ "$(git rev-parse --show-toplevel)" = "$EXPECT" ] || '
            '{ echo "WRONG WORKTREE"; exit 1; }',
            "    git rev-parse --show-toplevel || exit 1",
        )
        self.assertIn("location-guard", self._fail_keys(text))

    def test_wrong_expected_path_fails(self):
        text = GOOD.replace("$HOME/Dev/spirit-caller/codex-610", "$HOME/Dev/spirit-caller/wrong-lane")
        self.assertIn("location-guard", self._fail_keys(text))

    def test_assigned_path_equality_passes(self):
        self.assertNotIn("location-guard", self._fail_keys(GOOD))

    def test_base_check_alone_does_not_count_as_location_guard(self):
        text = ("PREFLIGHT: grep queue-file || exit 1\n"
                "CANARY first check\nHIGH effort\npaste the sha1 line")
        self.assertIn("location-guard", self._fail_keys(text))

    def test_missing_effort(self):
        self.assertIn("effort-tag", self._fail_keys(GOOD.replace("SET YOUR REASONING EFFORT TO HIGH", "go")))

    def test_preflight_without_hard_stop_fails(self):
        # PREFLIGHT mentioned but no `exit 1` / `|| {…}` guard → not a real stop.
        text = "PREFLIGHT: check the files exist.\nCANARY: first rename dsd check.\nHIGH effort. paste the sha1."
        self.assertIn("preflight", self._fail_keys(text))

    def test_self_report_without_artifact_fails(self):
        # A reply requested, but not tied to a tool-derived artifact → self-report.
        text = ("PREFLIGHT: ls tool || exit 1\nCANARY first item check\nHIGH effort\n"
                "Reply with a summary of what you did.")
        self.assertIn("paste-control", self._fail_keys(text))

    def test_worktree_add_without_retry_fails(self):
        text = ("PREFLIGHT: ls || exit 1\nCANARY first check\nHIGH effort\npaste the sha1\n"
                "git worktree add ../w -b br origin/main")
        self.assertIn("worktree-retry", self._fail_keys(text))

    def test_worktree_retry_not_required_when_absent(self):
        # No worktree add → the retry check does not apply, must not fail.
        text = "PREFLIGHT: ls || exit 1\nCANARY first check\nHIGH effort\npaste the sha1 line"
        self.assertNotIn("worktree-retry", self._fail_keys(text))


class TestReferencedCanaryInputs(unittest.TestCase):
    _INCIDENT_CANARY = GOOD.replace(
        "CANARY: rename ONE function, then run dsd check — it MUST stay green.",
        "CANARY: run python3.13 tools/kickoff_lint.py src/main/func_0209e628.s and paste the result.",
    )

    def _fail_keys(self, text: str) -> set[str]:
        return {c.key for c in lint(text) if c.required and not c.ok}

    def test_real_incident_live_s_path_fails(self):
        self.assertFalse((Path(__file__).resolve().parents[1] / "src/main/func_0209e628.s").exists())
        self.assertIn("referenced-paths", self._fail_keys(self._INCIDENT_CANARY))

    def test_real_incident_git_show_history_escape_passes(self):
        # `010616b65^` is deep history. CI checks out at depth 1
        # (`actions/checkout@v4` with no `fetch-depth`), so the commit is absent
        # there and `referenced-commits` fails for a reason that has nothing to
        # do with the behaviour under test. Skip rather than assert against
        # repo state that is not universally available — the same choice this
        # file already makes for missing reconstruction sources above.
        # (Brain fix at merge, round 0822c: green locally, red in CI.)
        if subprocess.run(
            ["git", "cat-file", "-e", "010616b65"],
            cwd=Path(__file__).resolve().parents[1],
            capture_output=True,
        ).returncode:
            self.skipTest("shallow clone: historical commit 010616b65 not present")
        text = self._INCIDENT_CANARY.replace(
            "python3.13 tools/kickoff_lint.py src/main/func_0209e628.s",
            "git show 010616b65^:src/main/func_0209e628.s",
        )
        self.assertNotIn("referenced-paths", self._fail_keys(text))
        self.assertNotIn("referenced-commits", self._fail_keys(text))

    def test_bad_commit_reference_fails(self):
        text = GOOD.replace("origin/main", "deadbeef1234567")
        self.assertIn("referenced-commits", self._fail_keys(text))

    def test_prose_path_and_sha_are_not_commands(self):
        text = GOOD + (
            "\nThe prose mentions src/does-not-exist.s and deadbeef1234567, "
            "but it is not an instruction.\n"
        )
        self.assertEqual(check_referenced_paths(text)[0], True)
        self.assertEqual(check_referenced_commits(text)[0], True)

    def test_cross_machine_mac_path_with_bare_python_fails(self):
        text = GOOD.replace(
            '"$HOME/Dev/spirit-caller/codex-610"',
            '"/Users/leo/Dev/spirit-caller/codex-610"',
        ).replace(
            "CANARY: rename ONE function, then run dsd check — it MUST stay green.",
            "CANARY: run python tools/kickoff_lint.py and paste the result.",
        )
        self.assertEqual(check_platform_coherence(text)[0], False)

    def test_cross_machine_windows_path_with_python313_fails(self):
        text = TestPowerShellLocationGuard._PWSH + (
            "python3.13 tools/kickoff_lint.py\n"
        )
        self.assertEqual(check_platform_coherence(text)[0], False)


class TestAdvisory(unittest.TestCase):
    def test_nested_backticks_warn_but_dont_fail(self):
        text = GOOD + "\n```\ncode\n```\n"
        checks = lint(text)
        bt = next(c for c in checks if c.key == "no-nested-backticks")
        self.assertFalse(bt.ok)
        self.assertFalse(bt.required)  # advisory only
        # still no *required* failure
        self.assertEqual([c.key for c in checks if c.required and not c.ok], [])



class TestCommitMustBeReachableFromARemote(unittest.TestCase):
    """A SHA that exists only locally must fail — the PR #1520 class.

    `git cat-file -e` proves the object is in THIS clone. #1520 hardcoded a
    commit that resolved on the machine that wrote it and was a bad object in
    the shared repo: green locally, broken for every lane. The check now also
    requires the commit to be reachable from a remote-tracking branch.
    """

    def _repo_with_local_only_commit(self):
        import subprocess
        import tempfile
        from pathlib import Path
        tmp = Path(tempfile.mkdtemp(prefix="sha-reach-"))
        self.addCleanup(shutil.rmtree, tmp, ignore_errors=True)
        run = lambda *a: subprocess.run(a, cwd=tmp, capture_output=True, text=True)
        run("git", "init", "-q")
        run("git", "config", "user.email", "t@example.invalid")
        run("git", "config", "user.name", "t")
        (tmp / "f.txt").write_text("x", encoding="utf-8")
        run("git", "add", "f.txt")
        run("git", "commit", "-q", "-m", "local only")
        sha = run("git", "rev-parse", "HEAD").stdout.strip()
        return tmp, sha

    def test_local_only_commit_is_rejected(self):
        tmp, sha = self._repo_with_local_only_commit()
        ok, detail = check_referenced_commits(
            f"    git show {sha} --stat" + chr(10), root=tmp
        )
        self.assertFalse(ok, f"local-only SHA accepted: {detail}")
        self.assertIn("only locally", detail)

    def test_commit_on_a_remote_branch_is_accepted(self):
        import subprocess
        from pathlib import Path
        root = Path(__file__).resolve().parent.parent
        sha = subprocess.run(
            ["git", "rev-parse", "origin/main"],
            cwd=root, capture_output=True, text=True,
        ).stdout.strip()
        if not sha:
            self.skipTest("no origin/main in this clone")
        ok, detail = check_referenced_commits(
            f"    git show {sha} --stat" + chr(10), root=root
        )
        self.assertTrue(ok, detail)

if __name__ == "__main__":
    unittest.main()
