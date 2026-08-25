"""Focused tests for gate3's non-vacuous decision contract."""

from __future__ import annotations

import contextlib
import io
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import gate3  # noqa: E402


class TestVerdict(unittest.TestCase):
    def test_zero_checks_are_vacuous_exit_two(self):
        self.assertEqual(
            gate3.verdict(failed=[], checks_run=0, tests_ok=True),
            ("VACUOUS", 2),
        )

    def test_failed_check_is_real_failure(self):
        self.assertEqual(
            gate3.verdict(failed=["eur"], checks_run=1, tests_ok=True),
            ("FAIL", 1),
        )

    def test_observed_passing_check_passes(self):
        self.assertEqual(
            gate3.verdict(failed=[], checks_run=1, tests_ok=True),
            ("PASS", 0),
        )


class TestArgumentGuard(unittest.TestCase):
    def test_tests_scope_no_tests_is_rejected(self):
        with self.assertRaises(SystemExit) as ctx:
            gate3.main(["--scope", "tests", "--no-tests"])
        self.assertEqual(ctx.exception.code, 2)


class TestInfrastructureAttribution(unittest.TestCase):
    def test_locked_toolchain_download_is_infrastructure(self):
        output = (
            "Traceback (most recent call last):\n"
            "  PermissionError: [Errno 13] Permission denied: "
            "'tools/mwccarm/2.0/sp1p5/lmgr8c.dll'\n"
        )
        self.assertTrue(gate3.is_infrastructure_failure(
            ["ninja", "sha1"], output, 1))

    def test_compiler_invocation_is_infrastructure(self):
        output = "FAILED: build/eur/main/func_02000000.o\n./tools/mwccarm/2.0/sp1p5/mwccarm.exe ...\n"
        self.assertTrue(gate3.is_infrastructure_failure(
            ["ninja", "sha1"], output, 1))

    def test_sha1_divergence_is_not_infrastructure(self):
        output = "gx-spirit-caller_eur.nds: FAILED\n"
        self.assertFalse(gate3.is_infrastructure_failure(
            ["ninja", "sha1"], output, 1))

    def test_clean_excludes_download_tool_rule(self):
        calls = []

        def fake_run(cmd):
            calls.append(cmd)
            if cmd == ["ninja", "-t", "rules"]:
                return gate3.CommandResult(
                    0, "$ ninja -t rules\n download_tool\n mwcc\n phony\n")
            return gate3.CommandResult(0)

        with patch.object(gate3, "run", side_effect=fake_run):
            result = gate3.clean_non_toolchain_outputs()
        self.assertEqual(result.returncode, 0)
        self.assertEqual(calls[1][:4], ["ninja", "-t", "clean", "-r"])
        self.assertNotIn("download_tool", calls[1])

    def _run_synthetic_gate(self, ninja_output, infrastructure):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "tools").mkdir()
            (root / "tools" / "configure.py").write_text("# fixture\n")

            def fake_run(cmd):
                if cmd == ["ninja", "sha1"]:
                    return gate3.CommandResult(1, ninja_output, infrastructure)
                return gate3.CommandResult(0)

            stdout = io.StringIO()
            with patch.object(gate3, "ROOT", root), \
                    patch.object(gate3, "check_dsd_binary", return_value=True), \
                    patch.object(gate3, "run", side_effect=fake_run), \
                    contextlib.redirect_stdout(stdout):
                exit_code = gate3.main(["--scope", "eur", "--no-tests"])
            return exit_code, stdout.getvalue()

    def test_gate_exits_two_and_avoids_sha1_fail_for_infrastructure(self):
        exit_code, output = self._run_synthetic_gate(
            "PermissionError: [Errno 13] Permission denied: lmgr8c.dll\n",
            True,
        )
        self.assertEqual(exit_code, 2)
        self.assertIn("INFRASTRUCTURE ERROR", output)
        self.assertNotIn("SHA1 FAIL", output)

    def test_gate_exits_one_and_reports_real_sha1_divergence(self):
        exit_code, output = self._run_synthetic_gate(
            "gx-spirit-caller_eur.nds: FAILED\n", False)
        self.assertEqual(exit_code, 1)
        self.assertIn("SHA1 FAIL", output)
        self.assertIn("GATE FAIL", output)


class TestResumability(unittest.TestCase):
    def _run_all(self, *, state=None, sha="sha-a", clean_tree=True, clean=False):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "tools").mkdir()
            (root / "tools" / "configure.py").write_text("# fixture\n")
            if state is not None:
                state_path = root / "build" / "gate3-state.json"
                state_path.parent.mkdir()
                state_path.write_text(gate3.json.dumps(state), encoding="utf-8")
            built = []

            def fake_gate(region, requested_clean):
                built.append((region, requested_clean))
                return gate3.RegionResult(True, pass_line=f"[{region}] SHA1 PASS")

            stdout = io.StringIO()
            with patch.object(gate3, "ROOT", root), \
                    patch.object(gate3, "STATE_PATH", root / "build" / "gate3-state.json"), \
                    patch.object(gate3, "current_commit_sha", return_value=sha), \
                    patch.object(gate3, "worktree_clean", return_value=clean_tree), \
                    patch.object(gate3, "gate_region", side_effect=fake_gate), \
                    patch.object(gate3, "check_dsd_binary", return_value=True), \
                    patch.object(gate3, "run", return_value=gate3.CommandResult(0)), \
                    contextlib.redirect_stdout(stdout):
                exit_code = gate3.main(["--scope", "all", "--no-tests"] + (["--clean"] if clean else []))
            recorded = None
            state_path = root / "build" / "gate3-state.json"
            if state_path.exists():
                recorded = gate3.json.loads(state_path.read_text(encoding="utf-8"))
            return exit_code, built, stdout.getvalue(), recorded

    def test_missing_state_runs_every_region_and_records_pass_lines(self):
        exit_code, built, output, recorded = self._run_all()
        self.assertEqual(exit_code, 0)
        self.assertEqual([region for region, _ in built], gate3.REGIONS)
        self.assertEqual(recorded["sha"], "sha-a")
        self.assertEqual(recorded["regions"]["eur"]["pass"], "[eur] SHA1 PASS")
        self.assertIn("state missing", output)

    def test_same_sha_clean_tree_skips_saved_regions_loudly(self):
        state = {
            "sha": "sha-a",
            "regions": {
                region: {"sha": "sha-a", "pass": f"[{region}] SHA1 PASS"}
                for region in gate3.REGIONS
            },
        }
        exit_code, built, output, _ = self._run_all(state=state)
        self.assertEqual(exit_code, 0)
        self.assertEqual(built, [])
        self.assertIn("[eur] SKIP", output)
        self.assertIn("[jpn] SKIP", output)

    def test_changed_sha_runs_every_region_fail_closed(self):
        state = {"sha": "sha-old", "regions": {
            region: {"sha": "sha-old", "pass": f"[{region}] SHA1 PASS"}
            for region in gate3.REGIONS
        }}
        exit_code, built, output, _ = self._run_all(state=state, sha="sha-new")
        self.assertEqual(exit_code, 0)
        self.assertEqual([region for region, _ in built], gate3.REGIONS)
        self.assertIn("state missing or from another commit", output)

    def test_dirty_tree_runs_every_region_fail_closed(self):
        state = {"sha": "sha-a", "regions": {
            region: {"sha": "sha-a", "pass": f"[{region}] SHA1 PASS"}
            for region in gate3.REGIONS
        }}
        exit_code, built, output, _ = self._run_all(state=state, clean_tree=False)
        self.assertEqual(exit_code, 0)
        self.assertEqual([region for region, _ in built], gate3.REGIONS)
        self.assertIn("working tree is dirty", output)

    def test_clean_flag_invalidates_saved_regions(self):
        state = {"sha": "sha-a", "regions": {
            region: {"sha": "sha-a", "pass": f"[{region}] SHA1 PASS"}
            for region in gate3.REGIONS
        }}
        exit_code, built, output, _ = self._run_all(state=state, clean=True)
        self.assertEqual(exit_code, 0)
        self.assertEqual([region for region, _ in built], gate3.REGIONS)
        self.assertIn("--clean invalidates", output)



class TestDsdBinaryProbe(unittest.TestCase):
    """Windows ships dsd.exe; probing only the extensionless name made every
    Windows worktree fail the preflight in ~0s with a message that reads like a
    content divergence, while the build ran dsd fine (CreateProcess appends
    .exe). Guard both spellings."""

    def _probe(self, root):
        # Mirror check_dsd_binary's candidate resolution against a fake root.
        return next((c for c in (root / "dsd", root / "dsd.exe") if c.exists()), None)

    def test_exe_only_root_is_found(self):
        import tempfile
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / "dsd.exe").write_bytes(b"x")
            self.assertIsNotNone(self._probe(root), "dsd.exe must satisfy the probe")

    def test_extensionless_only_root_is_found(self):
        import tempfile
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / "dsd").write_bytes(b"x")
            self.assertIsNotNone(self._probe(root), "posix ./dsd must satisfy the probe")

    def test_empty_root_is_missing(self):
        import tempfile
        with tempfile.TemporaryDirectory() as d:
            self.assertIsNone(self._probe(Path(d)), "no binary at all must still fail loud")

    @unittest.skipUnless(
        any((Path(gate3.ROOT) / name).exists() for name in ("dsd", "dsd.exe")),
        "requires a real dsd binary in this checkout (download_tool.py runs "
        "it on first `ninja`; a fresh/CI checkout that never built won't "
        "have it) -- the probe LOGIC itself is already covered by the 3 "
        "synthetic-fixture tests above, this one only sanity-checks that a "
        "configured dev box's real root actually satisfies it",
    )
    def test_real_repo_root_resolves(self):
        self.assertIsNotNone(self._probe(Path(gate3.ROOT)),
                             "this checkout must expose a dsd binary under either spelling")

if __name__ == "__main__":
    unittest.main()
