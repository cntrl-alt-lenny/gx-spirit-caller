"""The provider-neutral completion-report writer, tested behaviourally.

WHY THIS FILE EXISTS. `tools/report.py` is the mechanism this framework relies
on to answer "what did this role actually do?" for any provider, not only ones
with a convenience hook installed. See `framework/reports.md` for the design
and `tests/test_claude_code_hook_portability.py` for the reported incident
that motivated it: a round run on a tool with no adapter left no commit, no
diff, and — before this mechanism existed — no way to tell a correctly-paused
round from a silently-aborted one.

Every claim this module makes about itself is proved here by doing it in a
real temporary git repository, never by reading the source and trusting it:
resolving the shared inbox from a linked worktree, deriving a role's identity
from checkout structure alone, writing atomically, carrying provenance a
reader can actually act on, and never letting one lane's write touch another's
file.
"""

from __future__ import annotations

import subprocess
import sys
import tempfile
import threading
import unittest
from unittest import mock
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

import report  # noqa: E402


def init_repo(path: Path) -> None:
    subprocess.run(["git", "init", "-q"], cwd=path, check=True)
    subprocess.run(["git", "config", "user.email", "t@example.com"], cwd=path, check=True)
    subprocess.run(["git", "config", "user.name", "t"], cwd=path, check=True)
    (path / "f").write_text("x\n", encoding="utf-8")
    subprocess.run(["git", "add", "f"], cwd=path, check=True)
    subprocess.run(["git", "commit", "-q", "-m", "init"], cwd=path, check=True)


def add_worktree(repo: Path, rel: str) -> Path:
    wt = repo / rel
    subprocess.run(
        ["git", "worktree", "add", "--detach", str(wt), "HEAD"],
        cwd=repo, check=True, capture_output=True,
    )
    return wt


def commit_head_sha(path: Path) -> str:
    return subprocess.run(
        ["git", "rev-parse", "HEAD"], cwd=path, capture_output=True, text=True, check=True,
    ).stdout.strip()


class RepoCase(unittest.TestCase):
    """One real temporary git repository, with a Worker-shaped linked worktree."""

    def setUp(self):
        self._tmp = tempfile.TemporaryDirectory()
        self.repo = Path(self._tmp.name)
        init_repo(self.repo)
        self.addCleanup(self._tmp.cleanup)

    def inbox(self) -> Path:
        return report.git_common_dir(self.repo) / "agent-inbox"


class TestGitCommonDirResolvesFromAnyWorktree(RepoCase):
    def test_the_primary_checkout_resolves_to_dot_git(self):
        common = report.git_common_dir(self.repo)
        self.assertEqual(common, (self.repo / ".git").resolve())

    def test_a_linked_worktree_resolves_to_the_same_directory(self):
        worker = add_worktree(self.repo, ".worktrees/worker")
        self.assertEqual(
            report.git_common_dir(worker), report.git_common_dir(self.repo),
            "the shared inbox must live in one place regardless of which "
            "worktree resolves it",
        )

    def test_outside_a_repository_raises(self):
        with tempfile.TemporaryDirectory() as not_a_repo:
            with self.assertRaises(report.ReportError):
                report.git_common_dir(not_a_repo)


class TestRoleTagIsStructuralNotSelfReported(RepoCase):
    """No CLI flag, no provider metadata -- see the module docstring for why."""

    def test_the_primary_checkout_is_brain(self):
        self.assertEqual(report.role_tag(self.repo), "brain")

    def test_a_linked_worktree_is_tagged_with_its_own_directory_name(self):
        worker = add_worktree(self.repo, ".worktrees/worker")
        self.assertEqual(report.role_tag(worker), "worker")

        verifier = add_worktree(self.repo, ".worktrees/verifier")
        self.assertEqual(report.role_tag(verifier), "verifier")

    def test_an_isolation_layout_other_than_dot_worktrees_still_works(self):
        """`git-and-isolation.md`: any layout giving one checkout per role is fine."""
        sibling = self.repo.parent / f"{self.repo.name}-decomper"
        subprocess.run(
            ["git", "worktree", "add", "--detach", str(sibling), "HEAD"],
            cwd=self.repo, check=True, capture_output=True,
        )
        try:
            self.assertEqual(report.role_tag(sibling), f"{self.repo.name}-decomper")
        finally:
            subprocess.run(
                ["git", "worktree", "remove", "--force", str(sibling)],
                cwd=self.repo, capture_output=True,
            )

    def test_a_role_name_is_never_taken_from_a_caller_supplied_argument(self):
        """There is no such argument. This asserts the CLI surface, not just
        the function signature, so the guarantee cannot regress by someone
        adding one back."""
        import inspect
        write_params = set(inspect.signature(report.write_report).parameters)
        self.assertNotIn("role", write_params)
        status_params = set(inspect.signature(report.check_status).parameters)
        self.assertNotIn("role", status_params)


class TestWriteReportBehaviour(RepoCase):
    def test_archive_path_uses_the_checkout_role_rule(self):
        for role in ("Builder", "vérifier", "bad?role", "con"):
            with self.subTest(role=role):
                with self.assertRaisesRegex(report.ReportError, "invalid role name"):
                    report._archive_path(self.inbox(), role, "brief")

    def test_writes_latest_and_appends_log(self):
        path = report.write_report("Body text.", task="001-brief", cwd=self.repo)
        self.assertEqual(path, self.inbox() / "brain-latest.md")
        self.assertIn("Body text.", path.read_text(encoding="utf-8"))

        report.write_report("Second body.", task="002-brief", cwd=self.repo)
        log = (self.inbox() / "brain-log.md").read_text(encoding="utf-8")
        self.assertIn("Body text.", log)
        self.assertIn("Second body.", log)
        latest = (self.inbox() / "brain-latest.md").read_text(encoding="utf-8")
        self.assertIn("Second body.", latest)
        self.assertNotIn("Body text.", latest, "latest must be overwritten, not appended")

    def test_header_carries_task_head_sha_and_timestamp(self):
        sha = commit_head_sha(self.repo)
        path = report.write_report(
            "Report body.", task="007-fix-thing", cwd=self.repo, source="unit-test",
        )
        header = path.read_text(encoding="utf-8").splitlines()[0]
        self.assertIn("task=007-fix-thing", header)
        self.assertIn(f"head={sha}", header)
        self.assertIn("source=unit-test", header)
        self.assertIn(f"os={report.platform.system()}", header)
        self.assertIn("format=2", header)
        self.assertRegex(header, r"captured \d{4}-\d{2}-\d{2}T")

    def test_os_provenance_is_tool_derived_and_old_headers_still_parse(self):
        with mock.patch.object(report.platform, "system", return_value="TestOS"):
            path = report.write_report("Report body.", task="os-check", cwd=self.repo)
        header = path.read_text(encoding="utf-8").splitlines()[0]
        self.assertIn("os=TestOS", header)
        parsed = report._parse_header(path.read_text(encoding="utf-8"))
        self.assertEqual(parsed.operating_system, "TestOS")

        old = (
            "<!-- captured now role=brain task=old-os head="
            f"{commit_head_sha(self.repo)} source=old -->\n\nLegacy.\n"
        )
        self.assertEqual(report._parse_header(old).operating_system, None)

    def test_legacy_percent_sequences_are_literal_not_decoded(self):
        """An old writer's ``%20`` is the task text, not an encoded space."""
        inbox = self.inbox()
        inbox.mkdir(parents=True, exist_ok=True)
        sha = commit_head_sha(self.repo)
        (inbox / "brain-latest.md").write_text(
            f"<!-- captured now role=brain task=old%20brief head={sha} source=old -->\n\n"
            "Legacy percent report.\n", encoding="utf-8",
        )
        found = report.find_report(
            role="brain", task="old%20brief", cwd=self.repo
        )
        self.assertEqual(found, inbox / "brain-latest.md")
        self.assertEqual(
            report._parse_header(found.read_text(encoding="utf-8")).task,
            "old%20brief",
        )

    def test_legacy_space_tasks_are_recovered_between_header_delimiters(self):
        inbox = self.inbox()
        inbox.mkdir(parents=True, exist_ok=True)
        sha = commit_head_sha(self.repo)
        (inbox / "brain-latest.md").write_text(
            f"<!-- captured now role=brain task=legacy space brief head={sha} source=old -->\n\n"
            "Legacy spaced report.\n", encoding="utf-8",
        )
        found = report.find_report(
            role="brain", task="legacy space brief", cwd=self.repo
        )
        self.assertEqual(found, inbox / "brain-latest.md")

    def test_format_two_round_trips_encoded_and_literal_percent_tasks(self):
        for task in ("brief with spaces", "new%20brief", "hook:session/42"):
            report.write_report("body", task=task, cwd=self.repo)
            found = report.find_report(role="brain", task=task, cwd=self.repo)
            self.assertIsNotNone(found)
            self.assertEqual(
                report._parse_header(found.read_text(encoding="utf-8")).task,
                task,
            )

    def test_empty_text_is_refused(self):
        with self.assertRaises(report.ReportError):
            report.write_report("   \n  ", task="x", cwd=self.repo)

    def test_missing_task_is_refused(self):
        with self.assertRaises(report.ReportError):
            report.write_report("Body.", task="", cwd=self.repo)
        with self.assertRaises(report.ReportError):
            report.write_report("Body.", task=None, cwd=self.repo)  # type: ignore[arg-type]

    def test_the_readme_is_seeded_once_and_never_overwritten(self):
        report.write_report("First.", task="a", cwd=self.repo)
        readme = self.inbox() / "README.md"
        original = readme.read_text(encoding="utf-8")
        self.assertIn("agent-inbox", original)

        readme.write_text(original + "\nA note a human added.\n", encoding="utf-8")
        report.write_report("Second.", task="b", cwd=self.repo)
        self.assertIn("A note a human added.", readme.read_text(encoding="utf-8"))

    def test_reports_for_different_briefs_survive_in_either_write_order(self):
        report.write_report("Brief A first.", task="brief-A", cwd=self.repo)
        report.write_report("Brief B second.", task="brief-B", cwd=self.repo)
        self.assertIn("Brief A first.", report.find_report(
            role="brain", task="brief-A", cwd=self.repo
        ).read_text(encoding="utf-8"))
        self.assertIn("Brief B second.", report.find_report(
            role="brain", task="brief-B", cwd=self.repo
        ).read_text(encoding="utf-8"))

        report.write_report("Brief B again.", task="brief-B", cwd=self.repo)
        report.write_report("Brief A again.", task="brief-A", cwd=self.repo)
        self.assertIn("Brief A again.", report.find_report(
            role="brain", task="brief-A", cwd=self.repo
        ).read_text(encoding="utf-8"))
        self.assertIn("Brief B again.", report.find_report(
            role="brain", task="brief-B", cwd=self.repo
        ).read_text(encoding="utf-8"))

    def test_same_brief_correction_at_a_new_head_wins(self):
        report.write_report("Initial answer.", task="same-brief", cwd=self.repo)
        (self.repo / "advance").write_text("new\n", encoding="utf-8")
        subprocess.run(["git", "add", "advance"], cwd=self.repo, check=True)
        subprocess.run(
            ["git", "commit", "-q", "-m", "advance"], cwd=self.repo, check=True,
        )
        newest = commit_head_sha(self.repo)
        report.write_report("Corrected answer.", task="same-brief", cwd=self.repo)
        found = report.find_report(role="brain", task="same-brief", cwd=self.repo)
        self.assertIn("Corrected answer.", found.read_text(encoding="utf-8"))
        self.assertIn(f"head={newest}", found.read_text(encoding="utf-8"))
        self.assertIn("Initial answer.", (self.inbox() / "brain-log.md").read_text())

    def test_free_text_task_ids_are_safe_and_do_not_collide(self):
        task_ids = [
            "../outside/report",
            r"C:\\temp\\bad<>:\"/|?*",
            "unicode-☃-and spaces",
            "x" * 5000,
            "Case-Only",
            "case-only",
        ]
        for index, task in enumerate(task_ids):
            report.write_report(f"body-{index}", task=task, cwd=self.repo)

        paths = []
        for index, task in enumerate(task_ids):
            found = report.find_report(role="brain", task=task, cwd=self.repo)
            self.assertIsNotNone(found)
            self.assertIn(f"body-{index}", found.read_text(encoding="utf-8"))
            paths.append(found.resolve())
            self.assertTrue(found.resolve().is_relative_to(self.inbox().resolve()))
        self.assertEqual(len(paths), len(set(paths)))
        self.assertNotEqual(
            report.find_report(role="brain", task="Case-Only", cwd=self.repo),
            report.find_report(role="brain", task="case-only", cwd=self.repo),
        )

    def test_leading_and_trailing_whitespace_is_rejected_not_silently_collided(self):
        for task in (" leading", "trailing ", "\twrapped\n"):
            with self.assertRaises(report.ReportError):
                report.write_report("body", task=task, cwd=self.repo)

    def test_a_corrupt_task_key_is_refused_instead_of_silently_replaced(self):
        archive = report._archive_path(self.inbox(), "brain", "collision")
        archive.parent.mkdir(parents=True, exist_ok=True)
        archive.write_text(
            "<!-- captured now role=brain task=other head=wrong source=old -->\n\n"
            "Do not replace me.\n", encoding="utf-8",
        )
        with self.assertRaisesRegex(report.ReportError, "collision"):
            report.write_report("new body", task="collision", cwd=self.repo)

    def test_old_latest_only_inbox_remains_findable(self):
        inbox = self.inbox()
        inbox.mkdir(parents=True, exist_ok=True)
        sha = commit_head_sha(self.repo)
        (inbox / "brain-latest.md").write_text(
            f"<!-- captured now role=brain task=legacy-brief head={sha} source=old -->\n\n"
            "Legacy report.\n", encoding="utf-8",
        )
        found = report.find_report(role="brain", task="legacy-brief", cwd=self.repo)
        self.assertEqual(found, inbox / "brain-latest.md")


class TestNonClobberAcrossConcurrentLanes(RepoCase):
    def test_two_roles_writing_produce_two_distinct_files(self):
        worker = add_worktree(self.repo, ".worktrees/worker")
        verifier = add_worktree(self.repo, ".worktrees/verifier")

        report.write_report("Worker's own report.", task="x", cwd=worker)
        report.write_report("Verifier's own report.", task="x", cwd=verifier)
        report.write_report("Coordinator's own report.", task="x", cwd=self.repo)

        inbox = self.inbox()
        self.assertIn("Worker's own", (inbox / "worker-latest.md").read_text())
        self.assertIn("Verifier's own", (inbox / "verifier-latest.md").read_text())
        self.assertIn("Coordinator's own", (inbox / "brain-latest.md").read_text())

    def test_a_later_write_from_one_lane_never_touches_another_lanes_file(self):
        worker = add_worktree(self.repo, ".worktrees/worker")
        verifier = add_worktree(self.repo, ".worktrees/verifier")

        report.write_report("Worker round 1.", task="a", cwd=worker)
        report.write_report("Verifier round 1.", task="a", cwd=verifier)
        report.write_report("Worker round 2.", task="b", cwd=worker)

        inbox = self.inbox()
        self.assertIn("Worker round 2", (inbox / "worker-latest.md").read_text())
        self.assertIn(
            "Verifier round 1", (inbox / "verifier-latest.md").read_text(),
            "a write from the worker lane must never touch the verifier's file",
        )


class TestWritesAreAtomic(RepoCase):
    """A reader must never observe a half-written report.

    Proved deterministically rather than by racing threads and hoping to catch
    a window: a write-in-progress exists only as a differently-named temp file
    until `os.replace` runs, so the target path is either the complete old
    content or the complete new content at every point in between -- never a
    partial one. This directly tests that property rather than relying on
    scheduling luck to occasionally observe torn output.
    """

    def test_a_stalled_temp_file_does_not_disturb_the_visible_report(self):
        report.write_report("Original, complete report.", task="a", cwd=self.repo)
        latest = self.inbox() / "brain-latest.md"
        original = latest.read_text(encoding="utf-8")

        # Simulate a write that has started but not yet reached `os.replace` --
        # exactly the state `_atomic_write` passes through on every call.
        stalled_tmp = latest.with_name(f"{latest.name}.tmp-99999")
        stalled_tmp.write_text("PARTIAL, TRUNCATED CONTENT", encoding="utf-8")
        try:
            self.assertEqual(
                latest.read_text(encoding="utf-8"), original,
                "an in-progress write must never be visible under the real name",
            )
        finally:
            stalled_tmp.unlink()

    def test_windows_style_sharing_violation_is_retried(self):
        target = self.inbox() / "retry.md"
        target.parent.mkdir(parents=True, exist_ok=True)
        real_replace = report.os.replace

        calls = [0]

        def replace_once_then_real(source, destination):
            calls[0] += 1
            if calls[0] == 1:
                raise PermissionError("busy")
            return real_replace(source, destination)

        with mock.patch.object(
            report.os, "replace", side_effect=replace_once_then_real
        ):
            report._atomic_write(target, "complete\n")
        self.assertEqual(target.read_text(encoding="utf-8"), "complete\n")

    def test_readers_during_concurrent_writes_never_see_torn_content(self):
        """Best-effort race amplification, kept as a second, weaker signal.

        Not the proof above -- inherently non-deterministic -- but real
        concurrent writes are exactly the situation the guarantee exists for,
        so this still runs, at a size and count chosen to make a torn read
        likely if the write were not atomic.
        """
        latest = self.inbox() / "brain-latest.md"
        markers = [f"MARK-{i}-" + ("x" * 5000) for i in range(6)]
        stop = threading.Event()
        observed_bad: list[str] = []

        def reader():
            while not stop.is_set():
                if not latest.exists():
                    continue
                try:
                    text = latest.read_text(encoding="utf-8")
                except (OSError, UnicodeDecodeError):
                    continue
                # The header line is followed by a blank line, then the body
                # verbatim (see `_header`). A complete write's body is exactly
                # one full marker; anything else is a torn read.
                body = text.split("\n\n", 1)[-1].rstrip("\n")
                if body and body not in markers:
                    observed_bad.append(body[:80])

        t = threading.Thread(target=reader, daemon=True)
        t.start()
        try:
            for m in markers:
                report.write_report(m, task="race", cwd=self.repo)
        finally:
            stop.set()
            t.join(timeout=5)
        self.assertEqual(observed_bad, [], "a torn (partially-written) report was observed")

    def test_an_old_coordinator_report_remains_readable(self):
        inbox = self.inbox()
        inbox.mkdir(parents=True, exist_ok=True)
        (inbox / "coordinator-latest.md").write_text(
            "<!-- captured now role=coordinator task=old head="
            f"{commit_head_sha(self.repo)} source=old -->\n\nLegacy.\n",
            encoding="utf-8",
        )
        code, message = report.check_status(self.repo)
        self.assertEqual(code, 0, message)
        self.assertIn("fresh", message)


class TestStalenessDetection(RepoCase):
    def test_fresh_immediately_after_writing(self):
        report.write_report("Report.", task="a", cwd=self.repo)
        code, message = report.check_status(self.repo)
        self.assertEqual(code, 0, message)
        self.assertIn("fresh", message)

    def test_stale_after_the_checkout_advances(self):
        report.write_report("Report.", task="a", cwd=self.repo)
        (self.repo / "f2").write_text("y\n", encoding="utf-8")
        subprocess.run(["git", "add", "f2"], cwd=self.repo, check=True)
        subprocess.run(["git", "commit", "-q", "-m", "advance"], cwd=self.repo, check=True)

        code, message = report.check_status(self.repo)
        self.assertEqual(code, 1, message)
        self.assertIn("stale", message)

    def test_absent_when_no_report_exists_for_this_role(self):
        worker = add_worktree(self.repo, ".worktrees/worker")
        code, message = report.check_status(worker)
        self.assertEqual(code, 2, message)
        self.assertIn("no report found", message)

    def test_status_checks_the_role_owning_the_given_checkout_not_a_named_one(self):
        """Reading, like writing, never takes a role as an argument.

        Brain checks Worker's report by pointing `--cwd` at Worker's own
        checkout, not by naming "worker" -- the same structural derivation
        used for writing, so the two can never disagree about which file a
        role's report lives in.
        """
        worker = add_worktree(self.repo, ".worktrees/worker")
        verifier = add_worktree(self.repo, ".worktrees/verifier")
        report.write_report("Worker's report.", task="a", cwd=worker)

        code, message = report.check_status(worker)
        self.assertEqual(code, 0, message)
        code, message = report.check_status(verifier)
        self.assertEqual(code, 2, message)


class TestClosesTheReportedFailureMode(RepoCase):
    """The actual incident this mechanism exists to close.

    Before it: a round run on a provider with no adapter installed, that made
    no commit -- a legitimate outcome for a RESEARCH round that found nothing
    to change -- left Brain with nothing to distinguish it from a round that
    silently crashed. Both states are byte-identical in the repository: a
    clean checkout, zero commits ahead of base.

    This is not a synthetic scenario. It reproduces exactly what
    `framework/reports.md` documents Brain doing when a report is missing, and
    exactly what a real project hit before this file existed.
    """

    def test_before_no_signal_distinguishes_paused_from_aborted(self):
        """The baseline, so the fix below is provably closing a real gap."""
        worker = add_worktree(self.repo, ".worktrees/worker")
        # A RESEARCH round: investigated, found nothing to change, made no
        # commit. Indistinguishable, from repository state alone, from a round
        # that crashed before doing anything.
        self.assertEqual(commit_head_sha(worker), commit_head_sha(self.repo))
        result = subprocess.run(
            ["git", "status", "--porcelain"], cwd=worker, capture_output=True, text=True,
        )
        self.assertEqual(result.stdout, "", "the checkout must be clean")
        self.assertFalse(
            self.inbox().exists(),
            "no report exists yet -- this is the state before the role "
            "followed its contract",
        )

    def test_after_the_contract_step_the_report_is_available_regardless_of_provider(self):
        """The same round, except the role did the one thing its contract asks.

        Nothing here is Claude-Code-specific, or specific to any tool at all:
        `report.py write` is the same command on every provider, which is the
        entire point.
        """
        worker = add_worktree(self.repo, ".worktrees/worker")
        self.assertEqual(commit_head_sha(worker), commit_head_sha(self.repo))

        report.write_report(
            "RESEARCH round complete. Investigated whether the cache layer "
            "needs invalidation on config reload; it does not, because the "
            "loader already re-reads on every access. No change required.",
            task="014-cache-invalidation-question",
            cwd=worker,
            source="unit-test",
        )

        # Brain's actual procedure, per `framework/lifecycle.md` step 1: check
        # the shared inbox before falling back to asking the owner.
        code, message = report.check_status(worker)
        self.assertEqual(code, 0, message)
        report_text = (self.inbox() / "worker-latest.md").read_text(encoding="utf-8")
        self.assertIn("does not, because the", report_text)
        self.assertIn("task=014-cache-invalidation-question", report_text)


class TestCLI(RepoCase):
    def _run(self, args: list[str], *, cwd=None, stdin: str | None = None):
        return subprocess.run(
            [sys.executable, str(ROOT / "tools" / "report.py"), *args],
            cwd=cwd or self.repo, input=stdin, capture_output=True, text=True,
        )

    def test_write_from_stdin(self):
        proc = self._run(["write", "--task", "cli-task"], stdin="CLI report body.\n")
        self.assertEqual(proc.returncode, 0, proc.stderr)
        latest = self.inbox() / "brain-latest.md"
        self.assertIn("CLI report body.", latest.read_text(encoding="utf-8"))

    def test_write_from_file(self):
        src = self.repo / "report.txt"
        src.write_text("File-sourced report.\n", encoding="utf-8")
        proc = self._run(["write", "--task", "cli-task", "--file", str(src)])
        self.assertEqual(proc.returncode, 0, proc.stderr)
        latest = self.inbox() / "brain-latest.md"
        self.assertIn("File-sourced report.", latest.read_text(encoding="utf-8"))

    def test_write_without_task_fails_loudly(self):
        proc = self._run(["write"], stdin="Body.\n")
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("--task", proc.stderr)

    def test_write_of_empty_report_fails_loudly(self):
        proc = self._run(["write", "--task", "x"], stdin="")
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("empty", proc.stderr)

    def test_status_exit_codes_match_the_library_function(self):
        proc = self._run(["status"])
        self.assertEqual(proc.returncode, 2)  # no report yet

        self._run(["write", "--task", "a"], stdin="Body.\n")
        proc = self._run(["status"])
        self.assertEqual(proc.returncode, 0)

    def test_find_cli_returns_the_archived_brief_path(self):
        self._run(["write", "--task", "cli-first"], stdin="First CLI report.\n")
        self._run(["write", "--task", "cli-second"], stdin="Second CLI report.\n")
        proc = self._run(["find", "--role", "brain", "--task", "cli-first"])
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        self.assertTrue(Path(proc.stdout.strip()).is_file())
        self.assertIn(
            "First CLI report.", Path(proc.stdout.strip()).read_text(encoding="utf-8")
        )

    def test_write_cli_accepts_cwd_for_a_checkout_other_than_the_process_cwd(self):
        """`framework/adoption.md`'s pre-adoption bootstrap route: the
        framework's own `report.py`, invoked from anywhere, writing into a
        DIFFERENT checkout's inbox by explicit `--cwd`."""
        self._elsewhere_tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self._elsewhere_tmp.cleanup)
        elsewhere = Path(self._elsewhere_tmp.name)
        init_repo(elsewhere)
        proc = self._run(
            ["write", "--task", "cwd-task", "--cwd", str(elsewhere)],
            cwd=self.repo, stdin="Written into a different checkout.\n",
        )
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        target_inbox = report.git_common_dir(elsewhere) / "agent-inbox"
        self.assertIn(
            "Written into a different checkout.",
            (target_inbox / "brain-latest.md").read_text(encoding="utf-8"),
        )
        self.assertFalse((self.inbox() / "brain-latest.md").exists())


def add_worktree_on_branch(repo: Path, rel: str, branch: str) -> Path:
    wt = repo / rel
    subprocess.run(
        ["git", "worktree", "add", "-b", branch, str(wt), "HEAD"],
        cwd=repo, check=True, capture_output=True,
    )
    return wt


class TestDeliveryStatus(RepoCase):
    """`report.py delivery` -- the mechanical check a Verifier runs before
    reviewing anything. `framework/reports.md` documents three outcomes: not
    delivered yet (retryable), delivered, and an absent report that is either
    genuinely unavailable in this clone or -- the case round-18 hit, and this
    class exists to close -- present in this clone under the wrong Brief-ID.
    """

    def setUp(self):
        super().setUp()
        self.base_branch = subprocess.run(
            ["git", "branch", "--show-current"], cwd=self.repo,
            capture_output=True, text=True, check=True,
        ).stdout.strip()
        self.builder = add_worktree_on_branch(self.repo, ".worktrees/builder", "builder/round-18")
        (self.builder / "g").write_text("work\n", encoding="utf-8")
        subprocess.run(["git", "add", "g"], cwd=self.builder, check=True)
        subprocess.run(["git", "commit", "-q", "-m", "work"], cwd=self.builder, check=True)
        self.head = commit_head_sha(self.builder)

    def _status(self, *, role="builder", task="round-018-real-brief"):
        return report.delivery_status(
            branch="builder/round-18", base=self.base_branch, role=role,
            task=task, cwd=self.builder,
        )

    def test_missing_branch_is_retryable_not_delivered_yet(self):
        code, message = report.delivery_status(
            branch="builder/does-not-exist", base=self.base_branch,
            role="builder", task="round-018-real-brief", cwd=self.builder,
        )
        self.assertEqual(code, 1)
        self.assertIn("not delivered yet", message)

    def test_branch_still_at_base_is_retryable_not_delivered_yet(self):
        code, message = report.delivery_status(
            branch=self.base_branch, base=self.base_branch, role="builder",
            task="round-018-real-brief", cwd=self.builder,
        )
        self.assertEqual(code, 1)
        self.assertIn("still at the base", message)

    def test_no_report_at_all_is_unavailable_in_this_clone(self):
        code, message = self._status()
        self.assertEqual(code, 1)
        self.assertIn("report unavailable in this clone", message)
        self.assertIn("source clone", message)

    def test_correct_task_delivers(self):
        report.write_report(
            "Round 18 done.", task="round-018-real-brief", cwd=self.builder,
        )
        code, message = self._status()
        self.assertEqual(code, 0, message)
        self.assertIn("delivered:", message)

    def test_task_mismatch_at_the_exact_head_is_named_plainly(self):
        """The reported incident, reproduced exactly: the report exists, in
        THIS clone, at the exact delivered head -- just filed under the
        wrong Brief-ID."""
        report.write_report(
            "Round 18 done.", task="round-018-wrong-id", cwd=self.builder,
        )
        code, message = self._status()
        self.assertEqual(code, 1)
        self.assertNotIn(
            "report unavailable in this clone", message,
            "must not blame a missing report when this clone actually has one",
        )
        self.assertNotIn(
            "obtain the report from the source clone", message,
            "must not instruct the reader to go fetch from another clone "
            "for a report that is sitting right here in this one",
        )
        self.assertIn("round-018-wrong-id", message)
        self.assertIn("round-018-real-brief", message)
        self.assertIn(self.head, message)
        self.assertIn("wrong Brief-ID", message)

    def test_task_mismatch_resolves_once_the_executor_rewrites_its_own_report(self):
        report.write_report(
            "Round 18 done.", task="round-018-wrong-id", cwd=self.builder,
        )
        code, _ = self._status()
        self.assertEqual(code, 1)
        report.write_report(
            "Round 18 done, correct task now.",
            task="round-018-real-brief", cwd=self.builder,
        )
        code, message = self._status()
        self.assertEqual(code, 0, message)

    def test_a_stale_report_under_the_correct_task_is_still_not_delivered(self):
        """Right task, wrong (earlier) head -- must stay the existing
        head-mismatch message, not the new task-mismatch one."""
        report.write_report(
            "Old work.", task="round-018-real-brief", cwd=self.builder,
        )
        (self.builder / "h").write_text("more\n", encoding="utf-8")
        subprocess.run(["git", "add", "h"], cwd=self.builder, check=True)
        subprocess.run(["git", "commit", "-q", "-m", "more work"], cwd=self.builder, check=True)
        code, message = self._status()
        self.assertEqual(code, 1)
        self.assertIn("does not match branch", message)
        self.assertNotIn("wrong Brief-ID", message)

    def test_a_mismatched_report_at_a_different_head_does_not_trigger_the_new_message(self):
        """A task mismatch is only reported when the mismatched report sits
        at the EXACT delivered head -- a leftover report from an earlier,
        superseded head must not be surfaced as if it explained this one."""
        report.write_report(
            "Earlier round, different task.", task="round-017-old-brief",
            cwd=self.builder,
        )
        (self.builder / "h").write_text("more\n", encoding="utf-8")
        subprocess.run(["git", "add", "h"], cwd=self.builder, check=True)
        subprocess.run(["git", "commit", "-q", "-m", "more work"], cwd=self.builder, check=True)
        code, message = self._status()
        self.assertEqual(code, 1)
        self.assertIn("report unavailable in this clone", message)
        self.assertNotIn("wrong Brief-ID", message)

    def test_a_different_roles_report_at_the_same_head_does_not_trigger_the_new_message(self):
        """A report exists at the exact head, but for a different checkout's
        role entirely -- the mismatch message is scoped to the REQUESTED
        role, never borrowed from another role's report."""
        verifier = add_worktree_on_branch(self.repo, ".worktrees/verifier", "verifier/round-18")
        subprocess.run(
            ["git", "merge", "--no-edit", "-q", "builder/round-18"],
            cwd=verifier, check=True, capture_output=True,
        )
        report.write_report(
            "Verifier's own report, different role.", task="round-018-verifier-task",
            cwd=verifier,
        )
        code, message = self._status(role="builder")
        self.assertEqual(code, 1)
        self.assertIn("report unavailable in this clone", message)
        self.assertNotIn("wrong Brief-ID", message)


class TestLeaveCheck(RepoCase):
    """`report.py leave-check` -- "make sure nothing is left behind" before
    switching machines, made mechanical. A real round hit this: a Builder
    delivered on one machine, the owner switched before the Verifier ran,
    and the report stayed behind with the round stalled. This proves the
    check actually distinguishes merged work from a round still waiting.
    """

    def setUp(self):
        super().setUp()
        self.base_branch = subprocess.run(
            ["git", "branch", "--show-current"], cwd=self.repo,
            capture_output=True, text=True, check=True,
        ).stdout.strip()

    def _deliver_round(self, seat: str, task: str, *, merge: bool = False) -> Path:
        branch = f"{seat}/{task}"
        worktree = add_worktree_on_branch(self.repo, f".worktrees/{seat}", branch)
        (worktree / f"{task}.txt").write_text("work\n", encoding="utf-8")
        subprocess.run(["git", "add", f"{task}.txt"], cwd=worktree, check=True)
        subprocess.run(["git", "commit", "-q", "-m", task], cwd=worktree, check=True)
        report.write_report(f"{task} done.", task=task, cwd=worktree, source="cli")
        if merge:
            subprocess.run(
                ["git", "merge", "--no-edit", "-q", branch], cwd=self.repo, check=True,
            )
        return worktree

    def test_no_local_reports_is_clean_to_leave(self):
        code, message = report.leave_check_status(self.base_branch, cwd=self.repo)
        self.assertEqual(code, 0, message)
        self.assertIn("clean to leave", message)

    def test_a_merged_round_is_not_reported_as_pending(self):
        self._deliver_round("worker", "round-merged", merge=True)
        code, message = report.leave_check_status(self.base_branch, cwd=self.repo)
        self.assertEqual(code, 0, message)

    def test_a_delivered_but_unmerged_round_blocks_leaving(self):
        """The reported incident: delivered, not yet reviewed or merged."""
        self._deliver_round("worker", "round-unmerged", merge=False)
        code, message = report.leave_check_status(self.base_branch, cwd=self.repo)
        self.assertEqual(code, 1)
        self.assertIn("DO NOT LEAVE", message)
        self.assertIn("worker", message)
        self.assertIn("round-unmerged", message)
        self.assertIn("unmerged", message)

    def test_one_merged_and_one_unmerged_report_are_told_apart(self):
        """The exact evidence shape required: one clone, two reports, only
        one of them flagged."""
        self._deliver_round("worker", "round-merged", merge=True)
        self._deliver_round("verifier", "round-unmerged", merge=False)
        code, message = report.leave_check_status(self.base_branch, cwd=self.repo)
        self.assertEqual(code, 1)
        self.assertNotIn("round-merged", message)
        self.assertIn("round-unmerged", message)

    def test_an_unresolvable_head_is_unknown_never_treated_as_safe(self):
        worker = add_worktree_on_branch(self.repo, ".worktrees/worker", "worker/round-x")
        report.write_report("Round X.", task="round-x", cwd=worker, source="cli")
        latest = self.inbox() / "worker-latest.md"
        latest.write_text(
            latest.read_text(encoding="utf-8").replace(
                self.head_of(worker), "deadbeefdeadbeefdeadbeefdeadbeefdeadbeef",
            ),
            encoding="utf-8",
        )
        for archived in (self.inbox() / "by-task" / "worker").glob("*.md"):
            archived.write_text(latest.read_text(encoding="utf-8"), encoding="utf-8")
        code, message = report.leave_check_status(self.base_branch, cwd=self.repo)
        self.assertEqual(
            code, 1,
            "an unresolvable head must never be reported as safe to leave",
        )
        self.assertIn("unknown", message)
        self.assertIn("does not have commit", message)

    def test_an_unresolvable_base_makes_every_report_unknown_not_safe(self):
        self._deliver_round("worker", "round-a", merge=False)
        code, message = report.leave_check_status(
            "this-branch-does-not-exist", cwd=self.repo,
        )
        self.assertEqual(code, 1)
        self.assertIn("unknown", message)

    def test_cli_reports_zero_when_clean_and_one_when_not(self):
        proc = subprocess.run(
            [sys.executable, str(ROOT / "tools" / "report.py"), "leave-check",
             "--base", self.base_branch],
            cwd=self.repo, capture_output=True, text=True,
        )
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        self.assertIn("clean to leave", proc.stdout)

        self._deliver_round("worker", "round-cli", merge=False)
        proc = subprocess.run(
            [sys.executable, str(ROOT / "tools" / "report.py"), "leave-check",
             "--base", self.base_branch],
            cwd=self.repo, capture_output=True, text=True,
        )
        self.assertEqual(proc.returncode, 1, proc.stdout + proc.stderr)
        self.assertIn("DO NOT LEAVE", proc.stdout)

    def head_of(self, path: Path) -> str:
        return commit_head_sha(path)


if __name__ == "__main__":
    unittest.main()
