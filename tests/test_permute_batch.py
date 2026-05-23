"""Unit tests for `tools/permute_batch.py` (brief 196).

The batch wrapper drives `tools/permute.py` against a worklist
JSON, aggregating per-pick outcomes (match / no_match / timeout /
stub_missing / import_failed / budget_exhausted). Tests use a
fake subprocess runner so we don't depend on a real permuter
installation or live decomp-permuter clone.
"""

from __future__ import annotations

import json
import subprocess
import sys
import time
import unittest
from pathlib import Path
from unittest.mock import patch

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from permute_batch import (  # noqa: E402
    STATUS_BUDGET_EXHAUSTED,
    STATUS_IMPORT_FAILED,
    STATUS_MATCH,
    STATUS_NO_MATCH,
    STATUS_STUB_MISSING,
    STATUS_TIMEOUT,
    SUBPROCESS_TIMEOUT_GRACE_SECONDS,
    PickResult,
    _classify_subprocess_outcome,
    _parse_subprocess_output,
    build_permute_command,
    load_worklist,
    run_one_pick,
    run_worklist,
    stub_path,
    summarise,
    write_results,
)


def _make_pick(
    *,
    id: str = "B-08",
    module: str = "main",
    address: str = "0x0205da2c",
    name: str = "func_0205da2c",
    cluster: str = "B",
    hint: str = "test hint",
) -> dict:
    return {
        "id": id,
        "module": module,
        "address": address,
        "name": name,
        "size": 28,
        "cluster": cluster,
        "hint": hint,
    }


def _make_completed(
    *,
    stdout: str = "",
    stderr: str = "",
    returncode: int = 0,
) -> subprocess.CompletedProcess:
    return subprocess.CompletedProcess(
        ["fake"], returncode=returncode,
        stdout=stdout, stderr=stderr,
    )


class TestLoadWorklist(unittest.TestCase):
    """Worklist JSON schema validation."""

    def test_valid_worklist(self):
        import tempfile
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json", delete=False,
        ) as f:
            json.dump({
                "_schema": "test",
                "_doc": "some doc",
                "picks": [_make_pick(), _make_pick(id="B-22")],
            }, f)
            path = Path(f.name)
        try:
            picks, meta = load_worklist(path)
            self.assertEqual(len(picks), 2)
            self.assertEqual(picks[0]["id"], "B-08")
            self.assertIn("_schema", meta)
            self.assertNotIn("picks", meta)
        finally:
            path.unlink()

    def test_empty_picks_array(self):
        import tempfile
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json", delete=False,
        ) as f:
            json.dump({"picks": []}, f)
            path = Path(f.name)
        try:
            picks, _ = load_worklist(path)
            self.assertEqual(picks, [])
        finally:
            path.unlink()

    def test_missing_required_field(self):
        import tempfile
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json", delete=False,
        ) as f:
            pick = _make_pick()
            del pick["name"]
            json.dump({"picks": [pick]}, f)
            path = Path(f.name)
        try:
            with self.assertRaisesRegex(ValueError, "missing.*name"):
                load_worklist(path)
        finally:
            path.unlink()

    def test_address_without_0x_prefix_rejected(self):
        import tempfile
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json", delete=False,
        ) as f:
            pick = _make_pick(address="0205da2c")  # missing 0x
            json.dump({"picks": [pick]}, f)
            path = Path(f.name)
        try:
            with self.assertRaisesRegex(ValueError, "0x prefix"):
                load_worklist(path)
        finally:
            path.unlink()

    def test_non_hex_address_rejected(self):
        import tempfile
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json", delete=False,
        ) as f:
            pick = _make_pick(address="0xnothex")
            json.dump({"picks": [pick]}, f)
            path = Path(f.name)
        try:
            with self.assertRaises(ValueError):
                load_worklist(path)
        finally:
            path.unlink()

    def test_top_level_picks_must_be_array(self):
        import tempfile
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".json", delete=False,
        ) as f:
            json.dump({"picks": "not an array"}, f)
            path = Path(f.name)
        try:
            with self.assertRaisesRegex(ValueError, "expected.*array"):
                load_worklist(path)
        finally:
            path.unlink()


class TestStubPath(unittest.TestCase):
    """Stub-path resolution mirrors the project's src/ layout
    convention used by the decomper.
    """

    def test_main_module(self):
        p = stub_path(_make_pick(
            module="main", address="0x0205da2c",
        ), root=Path("/tmp/fake"))
        self.assertEqual(
            p, Path("/tmp/fake/src/main/func_0205da2c.c"),
        )

    def test_itcm_module(self):
        p = stub_path(_make_pick(
            module="itcm", address="0x01ff8770",
        ), root=Path("/tmp/fake"))
        self.assertEqual(
            p, Path("/tmp/fake/src/main/itcm/func_01ff8770.c"),
        )

    def test_overlay_module(self):
        p = stub_path(_make_pick(
            module="ov011", address="0x021d2ca8",
        ), root=Path("/tmp/fake"))
        self.assertEqual(
            p, Path("/tmp/fake/src/overlay011/func_021d2ca8.c"),
        )

    def test_address_lowercase_in_filename(self):
        # Mixed-case input → filename uses lowercase.
        p = stub_path(_make_pick(
            module="main", address="0x0200B0C8",
        ), root=Path("/tmp/fake"))
        self.assertEqual(
            p, Path("/tmp/fake/src/main/func_0200b0c8.c"),
        )


class TestParseSubprocessOutput(unittest.TestCase):
    """Stdout marker scraping from `permute.py --run` output."""

    def test_match_found_marker(self):
        text = """
some lines
MATCH FOUND at iteration 1234
done
"""
        found, score, log = _parse_subprocess_output(text)
        self.assertTrue(found)
        # MATCH FOUND alone doesn't always carry a score line.
        self.assertIsNone(score)

    def test_best_score_parsed(self):
        text = "best score: 42\nbest score: 8\n"
        found, score, log = _parse_subprocess_output(text)
        self.assertFalse(found)
        self.assertEqual(score, 8)  # last seen wins

    def test_log_path_parsed(self):
        text = "Log: permute_log/func_xyz.log\n"
        found, score, log = _parse_subprocess_output(text)
        self.assertEqual(log, "permute_log/func_xyz.log")

    def test_no_markers(self):
        text = "just regular output, no permuter markers"
        found, score, log = _parse_subprocess_output(text)
        self.assertFalse(found)
        self.assertIsNone(score)
        self.assertIsNone(log)


class TestClassifySubprocessOutcome(unittest.TestCase):
    """Status assignment precedence."""

    def test_timed_out_takes_priority(self):
        # Even if MATCH FOUND appears in partial output, timeout
        # wins because we don't trust the partial run.
        completed = _make_completed(stdout="MATCH FOUND")
        status = _classify_subprocess_outcome(
            completed, timed_out=True,
        )
        self.assertEqual(status, STATUS_TIMEOUT)

    def test_import_failed_before_match(self):
        # import.py failure is more specific than no_match.
        completed = _make_completed(
            stdout="ERROR: import.py failed\n",
        )
        status = _classify_subprocess_outcome(
            completed, timed_out=False,
        )
        self.assertEqual(status, STATUS_IMPORT_FAILED)

    def test_match_found(self):
        completed = _make_completed(stdout="MATCH FOUND\n")
        status = _classify_subprocess_outcome(
            completed, timed_out=False,
        )
        self.assertEqual(status, STATUS_MATCH)

    def test_no_match_default(self):
        completed = _make_completed(stdout="permuter exited\n")
        status = _classify_subprocess_outcome(
            completed, timed_out=False,
        )
        self.assertEqual(status, STATUS_NO_MATCH)

    def test_completed_none_is_no_match(self):
        # Defensive: subprocess infrastructure failed; treat as
        # no_match rather than crashing.
        status = _classify_subprocess_outcome(
            None, timed_out=False,
        )
        self.assertEqual(status, STATUS_NO_MATCH)


class TestBuildPermuteCommand(unittest.TestCase):
    """argv shape for the subprocess invocation."""

    def test_includes_address_and_run_flag(self):
        cmd = build_permute_command(
            _make_pick(address="0x0205da2c"),
            per_pick_seconds=120,
            threads=None,
        )
        self.assertIn("0x0205da2c", cmd)
        self.assertIn("--run", cmd)
        self.assertIn("--max-seconds", cmd)
        idx = cmd.index("--max-seconds")
        self.assertEqual(cmd[idx + 1], "120")
        self.assertIn("--version", cmd)

    def test_threads_passed_through(self):
        cmd = build_permute_command(
            _make_pick(), per_pick_seconds=60, threads=4,
        )
        idx = cmd.index("--threads")
        self.assertEqual(cmd[idx + 1], "4")

    def test_threads_omitted_when_none(self):
        cmd = build_permute_command(
            _make_pick(), per_pick_seconds=60, threads=None,
        )
        self.assertNotIn("--threads", cmd)

    def test_extra_args_appended(self):
        cmd = build_permute_command(
            _make_pick(),
            per_pick_seconds=60,
            threads=None,
            extra_args=["--seed", "42"],
        )
        self.assertIn("--seed", cmd)
        self.assertIn("42", cmd)


class TestRunOnePick(unittest.TestCase):
    """Per-pick driver with injectable runner."""

    def test_stub_missing_skips_subprocess(self):
        # The stub path under stub_path() can't exist for an
        # arbitrary pick when run from outside the real repo —
        # gate fires immediately.
        called = []

        def fake_runner(*args, **kwargs):
            called.append((args, kwargs))
            return _make_completed()

        pick = _make_pick(
            module="main", address="0x0deadbeef",  # no .c at this addr
            name="func_0deadbeef",
        )
        result = run_one_pick(
            pick,
            per_pick_seconds=60,
            threads=None,
            runner=fake_runner,
        )
        self.assertEqual(result.status, STATUS_STUB_MISSING)
        self.assertEqual(called, [])  # runner never called

    def test_match_path(self):
        # When the stub exists, the runner is invoked and its
        # MATCH FOUND marker maps to STATUS_MATCH.
        import tempfile
        with tempfile.TemporaryDirectory() as td:
            tdp = Path(td)
            stub = tdp / "src" / "main" / "func_0205da2c.c"
            stub.parent.mkdir(parents=True)
            stub.write_text("int func_0205da2c(void) { return 0; }\n")
            pick = _make_pick(address="0x0205da2c")

            def fake_runner(cmd, **kwargs):
                return _make_completed(
                    stdout="Importing... done.\nMATCH FOUND in 45 attempts\n"
                           "Log: permute_log/func_0205da2c.log\n",
                )

            with patch("permute_batch.ROOT", tdp), patch(
                "permute_batch.stub_path",
                return_value=stub,
            ):
                result = run_one_pick(
                    pick,
                    per_pick_seconds=60,
                    threads=None,
                    runner=fake_runner,
                )
        self.assertEqual(result.status, STATUS_MATCH)
        self.assertEqual(result.best_score, 0)
        self.assertEqual(result.log_path, "permute_log/func_0205da2c.log")
        self.assertIn("MATCH FOUND", result.stdout_tail)

    def test_no_match_path(self):
        import tempfile
        with tempfile.TemporaryDirectory() as td:
            tdp = Path(td)
            stub = tdp / "stub.c"
            stub.write_text("/* stub */\n")
            pick = _make_pick()

            def fake_runner(cmd, **kwargs):
                return _make_completed(
                    stdout="best score: 12\nbest score: 8\n"
                           "permuter exited without match\n",
                )

            with patch("permute_batch.stub_path", return_value=stub):
                result = run_one_pick(
                    pick,
                    per_pick_seconds=60,
                    threads=None,
                    runner=fake_runner,
                )
        self.assertEqual(result.status, STATUS_NO_MATCH)
        self.assertEqual(result.best_score, 8)

    def test_timeout_path(self):
        import tempfile
        with tempfile.TemporaryDirectory() as td:
            tdp = Path(td)
            stub = tdp / "stub.c"
            stub.write_text("/* stub */\n")
            pick = _make_pick()

            def fake_runner(cmd, **kwargs):
                exc = subprocess.TimeoutExpired(
                    cmd=cmd, timeout=kwargs.get("timeout", 60),
                )
                # Python 3.13 dropped kw-args; set partial output
                # via the public attrs instead.
                exc.stdout = b"partial\n"
                exc.stderr = b""
                raise exc

            with patch("permute_batch.stub_path", return_value=stub):
                result = run_one_pick(
                    pick,
                    per_pick_seconds=60,
                    threads=None,
                    runner=fake_runner,
                )
        self.assertEqual(result.status, STATUS_TIMEOUT)
        self.assertIn("partial", result.stdout_tail)

    def test_import_failed_path(self):
        import tempfile
        with tempfile.TemporaryDirectory() as td:
            tdp = Path(td)
            stub = tdp / "stub.c"
            stub.write_text("/* stub */\n")
            pick = _make_pick()

            def fake_runner(cmd, **kwargs):
                return _make_completed(
                    stderr="ERROR: import.py failed (exit 1)\n",
                    returncode=1,
                )

            with patch("permute_batch.stub_path", return_value=stub):
                result = run_one_pick(
                    pick,
                    per_pick_seconds=60,
                    threads=None,
                    runner=fake_runner,
                )
        self.assertEqual(result.status, STATUS_IMPORT_FAILED)


class TestRunWorklistBudget(unittest.TestCase):
    """Per-pick + total budget enforcement."""

    def test_total_budget_marks_remaining_as_exhausted(self):
        # Three picks, but total budget exhausted partway through.
        # The injected runner sleeps long enough to chew the budget.
        picks = [_make_pick(id=f"X-{i}") for i in range(3)]

        call_count = {"n": 0}

        def fake_runner(cmd, **kwargs):
            call_count["n"] += 1
            time.sleep(0.05)
            return _make_completed(stdout="best score: 7\n")

        import tempfile
        with tempfile.TemporaryDirectory() as td:
            tdp = Path(td)
            stub = tdp / "stub.c"
            stub.write_text("/* stub */\n")

            with patch("permute_batch.stub_path", return_value=stub):
                # Very tight total budget: only first pick can run.
                results = run_worklist(
                    picks,
                    per_pick_seconds=10,
                    total_seconds=0,  # exhausted immediately
                    threads=None,
                    runner=fake_runner,
                )
        self.assertEqual(len(results), 3)
        for r in results:
            self.assertEqual(r.status, STATUS_BUDGET_EXHAUSTED)
        # No picks should have been invoked (budget exhausted
        # before each one starts).
        self.assertEqual(call_count["n"], 0)

    def test_dry_run_does_not_invoke_runner(self):
        picks = [_make_pick()]
        call_count = {"n": 0}

        def fake_runner(cmd, **kwargs):
            call_count["n"] += 1
            return _make_completed()

        import tempfile
        with tempfile.TemporaryDirectory() as td:
            tdp = Path(td)
            stub = tdp / "stub.c"
            stub.write_text("/* stub */\n")
            with patch("permute_batch.ROOT", tdp), patch(
                "permute_batch.stub_path", return_value=stub,
            ):
                results = run_worklist(
                    picks,
                    per_pick_seconds=60,
                    total_seconds=600,
                    threads=None,
                    dry_run=True,
                    runner=fake_runner,
                )
        self.assertEqual(call_count["n"], 0)
        self.assertEqual(len(results), 1)
        # Dry-run with present stub → no_match (the baseline).
        self.assertEqual(results[0].status, STATUS_NO_MATCH)
        self.assertIn("[dry-run]", results[0].stdout_tail)

    def test_dry_run_stub_missing(self):
        picks = [_make_pick(
            module="main", address="0x0deadbeef",
            name="func_0deadbeef",
        )]
        results = run_worklist(
            picks,
            per_pick_seconds=60,
            total_seconds=600,
            threads=None,
            dry_run=True,
            runner=lambda *a, **kw: _make_completed(),
        )
        self.assertEqual(len(results), 1)
        self.assertEqual(results[0].status, STATUS_STUB_MISSING)


class TestSummariseAndWrite(unittest.TestCase):
    """Result aggregation + JSON serialisation."""

    def test_summarise_counts_statuses(self):
        results = [
            PickResult(id="a", address="0x0", status=STATUS_MATCH),
            PickResult(id="b", address="0x1", status=STATUS_NO_MATCH),
            PickResult(id="c", address="0x2", status=STATUS_NO_MATCH),
            PickResult(id="d", address="0x3", status=STATUS_STUB_MISSING),
        ]
        s = summarise(results)
        self.assertEqual(s["total_picks"], 4)
        self.assertEqual(s[STATUS_MATCH], 1)
        self.assertEqual(s[STATUS_NO_MATCH], 2)
        self.assertEqual(s[STATUS_STUB_MISSING], 1)

    def test_write_results_round_trip(self):
        import tempfile
        results = [
            PickResult(
                id="B-08",
                address="0x0205da2c",
                status=STATUS_MATCH,
                elapsed_seconds=12.3,
                best_score=0,
                match_path="perm_work/...",
                log_path="permute_log/func_0205da2c.log",
                stdout_tail="...",
                metadata={"cluster": "B"},
            ),
        ]
        with tempfile.TemporaryDirectory() as td:
            tdp = Path(td)
            out = tdp / "results.json"
            wl = tdp / "worklist.json"
            wl.write_text("{}\n")
            now = time.time()
            write_results(
                out,
                results=results,
                worklist_path=wl,
                worklist_metadata={"_schema": "test"},
                started_at=now - 60,
                finished_at=now,
                per_pick_seconds=60,
                total_seconds=600,
                threads=4,
            )
            data = json.loads(out.read_text())
        self.assertEqual(data["_schema"], "permute_batch result (brief 196)")
        self.assertEqual(len(data["picks"]), 1)
        self.assertEqual(data["picks"][0]["status"], STATUS_MATCH)
        self.assertEqual(data["picks"][0]["best_score"], 0)
        self.assertEqual(data["summary"][STATUS_MATCH], 1)
        self.assertEqual(data["budget"]["threads"], 4)


class TestBriefWorklistRealFile(unittest.TestCase):
    """Smoke test against the brief 196 worklist itself, to catch
    schema breakage if the JSON is edited.
    """

    def test_real_worklist_loads(self):
        worklist = (
            Path(__file__).resolve().parent.parent
            / "docs" / "research"
            / "cluster-b-e-permuter-targets.json"
        )
        if not worklist.is_file():
            self.skipTest("brief 196 worklist not in tree yet")
        picks, meta = load_worklist(worklist)
        self.assertEqual(len(picks), 9)
        ids = {p["id"] for p in picks}
        self.assertEqual(
            ids,
            {
                "B-08", "B-18", "B-22", "B-24",
                "E-07", "E-08", "E-12", "E-13", "E-14",
            },
        )
        # Cluster tagging present and only B / E.
        clusters = {p["cluster"] for p in picks}
        self.assertEqual(clusters, {"B", "E"})


class TestConstants(unittest.TestCase):
    """Defensive: status enum strings + grace constant stay stable
    so external tools depending on the result JSON don't break on
    a refactor."""

    def test_grace_seconds_positive(self):
        self.assertGreater(SUBPROCESS_TIMEOUT_GRACE_SECONDS, 0)

    def test_status_strings_unique(self):
        statuses = {
            STATUS_MATCH, STATUS_NO_MATCH, STATUS_TIMEOUT,
            STATUS_STUB_MISSING, STATUS_IMPORT_FAILED,
            STATUS_BUDGET_EXHAUSTED,
        }
        self.assertEqual(len(statuses), 6)


if __name__ == "__main__":
    unittest.main()
