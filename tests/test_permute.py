"""Unit tests for tools/permute.py.

Coverage for the pure path-mapping / delinks-parsing functions.
find_function / stage_work_dir pull from filesystem; they're smoke-
tested via temp trees.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from permute import (  # noqa: E402
    PERMUTER_ARM_PRELUDE,
    PERMUTER_PINNED_COMMIT,
    PERMUTER_REPO_URL,
    PERMUTER_VENDOR_DIR,
    PERMUTER_VENDOR_PATCH_GUARD,
    PERMUTER_VENDOR_PATCHES,
    PermuterRunResult,
    best_output,
    collect_output_dirs,
    copy_match_to_perm_work,
    ensure_permuter_installed,
    expected_disasm_path,
    expected_object_path,
    install_permuter_deps,
    module_delinks_path,
    module_symbols_path,
    normalize_disasm_for_permuter,
    parse_tu_ranges,
    patch_permuter_vendor,
    render_readme,
    render_run_sh,
    run_permuter,
    stage_work_dir,
    strip_compile_sh_ampersand,
    tu_containing,
)


class TestModulePathMapping(unittest.TestCase):
    def test_symbols_main(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_symbols_path(root, "main"),
            root / "arm9" / "symbols.txt",
        )

    def test_symbols_itcm(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_symbols_path(root, "itcm"),
            root / "arm9" / "itcm" / "symbols.txt",
        )

    def test_symbols_overlay(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_symbols_path(root, "ov023"),
            root / "arm9" / "overlays" / "ov023" / "symbols.txt",
        )

    def test_delinks_main(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_delinks_path(root, "main"),
            root / "arm9" / "delinks.txt",
        )

    def test_delinks_overlay(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_delinks_path(root, "ov005"),
            root / "arm9" / "overlays" / "ov005" / "delinks.txt",
        )


class TestParseTuRanges(unittest.TestCase):
    """delinks.txt's TU entries carry .text start/end ranges — the
    permuter wrapper uses those to locate which .c file a target
    function is inside."""

    def _write(self, content: str) -> Path:
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as f:
            f.write(content)
            return Path(f.name)

    def test_missing_file_empty(self):
        self.assertEqual(parse_tu_ranges(Path("/nonexistent")), [])

    def test_single_tu(self):
        p = self._write(
            "src/overlay005/foo.c:\n"
            "    complete\n"
            "    .text start:0x021aa4a0 end:0x021aa4ac kind:code align:4\n"
        )
        try:
            out = parse_tu_ranges(p)
            self.assertEqual(out, [
                ("src/overlay005/foo.c", 0x021aa4a0, 0x021aa4ac),
            ])
        finally:
            p.unlink(missing_ok=True)

    def test_multiple_tus(self):
        p = self._write(
            "src/overlay005/a.c:\n"
            "    complete\n"
            "    .text start:0x021aa4a0 end:0x021aa4ac\n"
            "\n"
            "src/overlay005/b.c:\n"
            "    complete\n"
            "    .text start:0x021aa4ac end:0x021aa4b0\n"
        )
        try:
            out = parse_tu_ranges(p)
            self.assertEqual(len(out), 2)
            self.assertEqual(out[0][0], "src/overlay005/a.c")
            self.assertEqual(out[1][0], "src/overlay005/b.c")
        finally:
            p.unlink(missing_ok=True)

    def test_only_text_sections_collected(self):
        # .rodata / .data / .ctor should be ignored — parse_tu_ranges
        # exists to answer "which .c covers this code address?"
        p = self._write(
            "src/overlay005/foo.c:\n"
            "    complete\n"
            "    .text start:0x021aa4a0 end:0x021aa4ac\n"
            "    .rodata start:0x021b1568 end:0x021b16e4\n"
            "    .data start:0x021b17e0 end:0x021b1d40\n"
        )
        try:
            out = parse_tu_ranges(p)
            self.assertEqual(len(out), 1)
            _src, start, end = out[0]
            self.assertEqual((start, end), (0x021aa4a0, 0x021aa4ac))
        finally:
            p.unlink(missing_ok=True)

    def test_comments_and_blanks_ignored(self):
        p = self._write(
            "# leading comment\n"
            "\n"
            "src/x.c:\n"
            "    complete\n"
            "    .text start:0x100 end:0x200\n"
        )
        try:
            self.assertEqual(parse_tu_ranges(p), [("src/x.c", 0x100, 0x200)])
        finally:
            p.unlink(missing_ok=True)


class TestTuContaining(unittest.TestCase):
    def _write_two_tus(self) -> Path:
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as f:
            f.write(
                "src/overlay005/a.c:\n"
                "    complete\n"
                "    .text start:0x021aa4a0 end:0x021aa4c0\n"
                "\n"
                "src/overlay005/b.c:\n"
                "    complete\n"
                "    .text start:0x021aa4c0 end:0x021aa500\n"
            )
            return Path(f.name)

    def test_exact_start(self):
        p = self._write_two_tus()
        try:
            self.assertEqual(tu_containing(p, 0x021aa4a0), "src/overlay005/a.c")
        finally:
            p.unlink(missing_ok=True)

    def test_middle_of_range(self):
        p = self._write_two_tus()
        try:
            self.assertEqual(tu_containing(p, 0x021aa4b0), "src/overlay005/a.c")
        finally:
            p.unlink(missing_ok=True)

    def test_end_is_exclusive(self):
        # 0x021aa4c0 is the *end* of a.c and *start* of b.c — end is
        # exclusive (matches how dsd .text ranges work).
        p = self._write_two_tus()
        try:
            self.assertEqual(tu_containing(p, 0x021aa4c0), "src/overlay005/b.c")
        finally:
            p.unlink(missing_ok=True)

    def test_address_not_in_any_tu(self):
        p = self._write_two_tus()
        try:
            self.assertIsNone(tu_containing(p, 0x021aa600))
            self.assertIsNone(tu_containing(p, 0x02000000))
        finally:
            p.unlink(missing_ok=True)


class TestExpectedPaths(unittest.TestCase):
    def test_object_from_c_source(self):
        build = Path("/fake/build/eur")
        self.assertEqual(
            expected_object_path(build, "ov005", "src/overlay005/foo.c"),
            build / "src" / "overlay005" / "foo.o",
        )

    def test_object_from_cpp_source(self):
        build = Path("/fake/build/eur")
        self.assertEqual(
            expected_object_path(build, "main", "src/main/bar.cpp"),
            build / "src" / "main" / "bar.o",
        )

    def test_object_none_when_source_missing(self):
        build = Path("/fake/build/eur")
        self.assertIsNone(expected_object_path(build, "main", None))

    def test_disasm_main(self):
        build = Path("/fake/build/eur")
        self.assertEqual(
            expected_disasm_path(build, "main", 0x02000800),
            build / "disasm" / "main_02000800.s",
        )

    def test_disasm_overlay(self):
        build = Path("/fake/build/eur")
        self.assertEqual(
            expected_disasm_path(build, "ov005", 0x021aa4a0),
            build / "disasm" / "ov005_021aa4a0.s",
        )


class TestRenderRunSh(unittest.TestCase):
    """PR #161: run.sh auto-generated alongside the copy staging."""

    def test_contains_import_and_permuter_commands(self):
        out = render_run_sh(
            function_name="func_02000800",
            permuter_path=Path("/home/user/decomp-permuter"),
            source_c=Path("/home/user/gx-spirit-caller/src/main/entry.c"),
            target_s=Path("/home/user/gx-spirit-caller/build/eur/disasm/main_02000800.s"),
        )
        # Shebang is bash for portability (works on macOS/Linux).
        self.assertIn("#!/usr/bin/env bash", out)
        # Both key commands are referenced.
        self.assertIn("./import.py", out)
        self.assertIn("./permuter.py", out)
        # Function name appears so grep-forward is easy.
        self.assertIn("func_02000800", out)

    def test_idempotent_import_guard(self):
        # Re-running run.sh should be safe: it checks for the
        # nonmatchings/<fn>/ dir before re-importing.
        out = render_run_sh(
            function_name="sinit_ov005_021b16e4",
            permuter_path=Path("/p"),
            source_c=Path("/s.c"),
            target_s=Path("/s.s"),
        )
        self.assertIn(
            "if [ ! -d", out,
            "should guard import.py against re-running",
        )
        self.assertIn("nonmatchings/sinit_ov005_021b16e4", out)

    def test_uses_set_euo_pipefail(self):
        # Catch upstream config errors early rather than let the
        # permuter swallow them.
        out = render_run_sh(
            function_name="x",
            permuter_path=Path("/p"),
            source_c=Path("/s.c"),
            target_s=Path("/s.s"),
        )
        self.assertIn("set -euo pipefail", out)


class TestRenderReadme(unittest.TestCase):
    def test_mentions_target_and_paths(self):
        md = render_readme(
            function_name="func_02000800",
            module="main",
            addr=0x02000800,
            source_c=Path("src/main/entry.c"),
            target_s=Path("build/eur/disasm/main_02000800.s"),
        )
        self.assertIn("func_02000800", md)
        self.assertIn("main", md)
        self.assertIn("0x02000800", md)
        # POSIX-normalize the rendered markdown for Windows-host
        # runs — `render_readme` interpolates the Path arguments
        # via str(...) which uses backslashes on Windows. The
        # logical content is correct on either platform; the
        # normalisation just makes the substring assertion match.
        md_posix = md.replace("\\", "/")
        self.assertIn("src/main/entry.c", md_posix)
        self.assertIn("build/eur/disasm/main_02000800.s", md_posix)

    def test_includes_followup_steps(self):
        md = render_readme(
            function_name="x", module="main", addr=0x1000,
            source_c=Path("s.c"), target_s=Path("s.s"),
        )
        # Referenced workflow should cover ninja + delinks update.
        self.assertIn("ninja rom", md)
        self.assertIn("delinks.txt", md)

    def test_run_command_is_prominent(self):
        md = render_readme(
            function_name="x", module="main", addr=0x1000,
            source_c=Path("s.c"), target_s=Path("s.s"),
        )
        self.assertIn("./run.sh", md)


class TestStageWorkDir(unittest.TestCase):
    """End-to-end: stage_work_dir produces the expected files."""

    def test_staging_creates_all_files(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            src = tmp / "entry.c"
            src.write_text("/* source */", encoding="utf-8")
            obj = tmp / "entry.o"
            obj.write_bytes(b"\x7fELF")
            s_file = tmp / "entry.s"
            s_file.write_text("# disasm", encoding="utf-8")

            work_dir = stage_work_dir(
                function_name="test_fn",
                module="main",
                addr=0x02000800,
                source_c=src,
                target_o=obj,
                target_s=s_file,
                permuter_path=Path("/fake/permuter"),
            )
            try:
                self.assertTrue(
                    (work_dir / "base.c").is_file(),
                    "base.c should be copied",
                )
                self.assertTrue(
                    (work_dir / "base.o").is_file(),
                    "base.o should be copied",
                )
                self.assertTrue(
                    (work_dir / "run.sh").is_file(),
                    "run.sh should be generated",
                )
                self.assertTrue(
                    (work_dir / "README.md").is_file(),
                    "README.md should be generated",
                )
                # run.sh must be executable. Skip on Windows —
                # Unix exec-bits don't exist there; the install/
                # invocation flow is `bash ./run.sh` regardless.
                if sys.platform != "win32":
                    import stat as _stat
                    mode = (work_dir / "run.sh").stat().st_mode
                    self.assertTrue(
                        mode & _stat.S_IXUSR,
                        "run.sh must have S_IXUSR set",
                    )
            finally:
                # Clean up the artifact — stage_work_dir writes to
                # the repo root, not the tmp dir.
                import shutil as _shutil
                _shutil.rmtree(work_dir, ignore_errors=True)

    def test_legacy_call_skips_run_sh_and_readme(self):
        # Pre-#161 callers pass only source_c + target_o (no
        # target_s, no permuter_path). stage_work_dir must still
        # work (no crashes) but won't generate run.sh / README.
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            src = tmp / "entry.c"
            src.write_text("/* source */", encoding="utf-8")
            obj = tmp / "entry.o"
            obj.write_bytes(b"")

            work_dir = stage_work_dir(
                function_name="legacy_fn",
                module="main",
                addr=0x02001000,
                source_c=src,
                target_o=obj,
            )
            try:
                self.assertTrue((work_dir / "base.c").is_file())
                self.assertFalse((work_dir / "run.sh").exists())
                self.assertFalse((work_dir / "README.md").exists())
            finally:
                import shutil as _shutil
                _shutil.rmtree(work_dir, ignore_errors=True)


# ---------------------------------------------------------------------------
# Brief 063 — auto-runner mode tests.
#
# We can't actually run decomp-permuter from cloud (no toolchain, no
# baserom, no permuter clone in CI). The tests below cover the
# wrapper logic — auto-install command shapes, output-dir scanning,
# subprocess invocation building, byte-match detection, stdout
# streaming, wall-clock cap — by mocking `git` / `pip` / `Popen` and
# the filesystem. Production end-to-end verification is brain's job
# on a host with a working toolchain.
# ---------------------------------------------------------------------------


class TestPermuterConstants(unittest.TestCase):
    """Pin the version-controlled inputs to the auto-installer so a
    typo in the URL or commit doesn't go un-noticed."""

    def test_repo_url_points_at_upstream(self):
        self.assertEqual(
            PERMUTER_REPO_URL,
            "https://github.com/simonlindholm/decomp-permuter.git",
        )

    def test_pinned_commit_is_sha_shaped(self):
        # Full 40-char hex sha. Bumping is fine; nonsense isn't.
        self.assertEqual(len(PERMUTER_PINNED_COMMIT), 40)
        int(PERMUTER_PINNED_COMMIT, 16)  # raises if non-hex

    def test_vendor_dir_under_tools_vendor(self):
        # Path matches the project's tools/_vendor/ convention so the
        # existing .gitignore entry covers it without changes.
        parts = PERMUTER_VENDOR_DIR.parts
        self.assertEqual(parts[-3:], ("tools", "_vendor", "decomp-permuter"))


class TestEnsurePermuterInstalled(unittest.TestCase):
    """Auto-install logic — cold-clone path and idempotent re-pin path."""

    def test_cold_clone_invokes_git_clone_and_checkout(self):
        # Vendor dir doesn't exist yet → clone + checkout.
        calls = []
        def fake_git(args, cwd=None):
            calls.append((tuple(args), cwd))
            class R: stdout = ""
            return R()
        logs = []
        with tempfile.TemporaryDirectory() as td:
            vendor = Path(td) / "decomp-permuter"
            # vendor doesn't exist; permuter.py doesn't exist either.
            ensure_permuter_installed(
                vendor_dir=vendor,
                commit="deadbeef" * 5,
                run_git=fake_git,
                apply_patches=lambda *a, **kw: None,
                log=logs.append,
            )
        # Expect a clone followed by a checkout — exact arg shape:
        self.assertEqual(len(calls), 2)
        clone_args, clone_cwd = calls[0]
        self.assertEqual(clone_args[0], "clone")
        self.assertEqual(clone_args[1], PERMUTER_REPO_URL)
        self.assertIsNone(clone_cwd)
        checkout_args, checkout_cwd = calls[1]
        self.assertEqual(checkout_args, ("checkout", "deadbeef" * 5))
        # checkout runs INSIDE the cloned dir.
        self.assertEqual(checkout_cwd, vendor)

    def test_already_at_pinned_commit_is_noop(self):
        # Vendor dir exists and HEAD already matches → no git fetch /
        # checkout. Fast-path branch.
        calls = []
        commit = "abcdef01" * 5
        def fake_git(args, cwd=None):
            calls.append(tuple(args))
            class R:
                stdout = commit + "\n"
            return R()
        with tempfile.TemporaryDirectory() as td:
            vendor = Path(td) / "decomp-permuter"
            vendor.mkdir()
            (vendor / "permuter.py").write_text("# stub\n")
            ensure_permuter_installed(
                vendor_dir=vendor,
                commit=commit,
                run_git=fake_git,
                apply_patches=lambda *a, **kw: None,
                log=lambda m: None,
            )
        # Only the HEAD check ran — no fetch, no checkout.
        self.assertEqual(calls, [("rev-parse", "HEAD")])

    def test_existing_but_wrong_commit_repins(self):
        # Vendor dir exists, HEAD ≠ pinned → fetch + checkout.
        commit = "11111111" * 5
        calls = []
        def fake_git(args, cwd=None):
            calls.append(tuple(args))
            class R:
                stdout = "deadbeefdeadbeefdeadbeefdeadbeefdeadbeef\n"
            return R()
        with tempfile.TemporaryDirectory() as td:
            vendor = Path(td) / "decomp-permuter"
            vendor.mkdir()
            (vendor / "permuter.py").write_text("# stub\n")
            ensure_permuter_installed(
                vendor_dir=vendor,
                commit=commit,
                run_git=fake_git,
                apply_patches=lambda *a, **kw: None,
                log=lambda m: None,
            )
        self.assertEqual(calls[0], ("rev-parse", "HEAD"))
        self.assertIn(("fetch", "origin"), calls)
        self.assertIn(("checkout", commit), calls)

    def test_apply_patches_called_by_default(self):
        # When apply_patches isn't injected, the cold path calls
        # patch_permuter_vendor on the cloned dir. Stub git so the
        # clone is a no-op + capture the patcher invocation.
        def fake_git(args, cwd=None):
            class R: stdout = ""
            return R()
        patcher_invocations = []
        def fake_patcher(vendor_dir, *, log=None):
            patcher_invocations.append(vendor_dir)
        with tempfile.TemporaryDirectory() as td:
            vendor = Path(td) / "decomp-permuter"
            ensure_permuter_installed(
                vendor_dir=vendor,
                commit="deadbeef" * 5,
                run_git=fake_git,
                apply_patches=fake_patcher,
                log=lambda m: None,
            )
        self.assertEqual(patcher_invocations, [vendor])


class TestInstallPermuterDeps(unittest.TestCase):
    def test_pip_command_is_python_m_pip_install(self):
        captured = []
        def fake_pip(cmd):
            captured.append(cmd)
        install_permuter_deps(
            deps=("toml", "Levenshtein"),
            python_exe="/fake/python",
            run_pip=fake_pip,
            log=lambda m: None,
        )
        self.assertEqual(len(captured), 1)
        cmd = captured[0]
        self.assertEqual(
            cmd,
            ["/fake/python", "-m", "pip", "install", "toml", "Levenshtein"],
        )

    def test_empty_deps_is_noop(self):
        # Defensive — if the deps list is wiped to empty, the call
        # must not invoke pip at all.
        captured = []
        install_permuter_deps(
            deps=(),
            run_pip=lambda c: captured.append(c),
            log=lambda m: None,
        )
        self.assertEqual(captured, [])


class TestCollectOutputDirs(unittest.TestCase):
    """Permuter writes `<input_dir>/output-<score>-<ctr>/source.c`.
    The wrapper scans this layout after a run to find the best
    permutation (or detect a byte-match at score 0)."""

    def test_empty_nonmatchings_returns_empty(self):
        with tempfile.TemporaryDirectory() as td:
            self.assertEqual(collect_output_dirs(Path(td)), [])

    def test_missing_nonmatchings_returns_empty(self):
        self.assertEqual(
            collect_output_dirs(Path("/definitely/not/here")), [],
        )

    def test_sorted_by_score_ascending(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "output-12-0").mkdir()
            (root / "output-0-0").mkdir()
            (root / "output-5-3").mkdir()
            # Non-matching dirs are ignored.
            (root / "settings.toml").write_text("")
            (root / "base.c").write_text("")
            (root / "scrap").mkdir()
            dirs = collect_output_dirs(root)
            names = [d.name for d in dirs]
            self.assertEqual(names, ["output-0-0", "output-5-3", "output-12-0"])

    def test_best_output_picks_lowest_score(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "output-12-0").mkdir()
            (root / "output-0-2").mkdir()
            (root / "output-3-1").mkdir()
            best, score = best_output(root)
            self.assertEqual(best.name, "output-0-2")
            self.assertEqual(score, 0)

    def test_best_output_empty_returns_nones(self):
        with tempfile.TemporaryDirectory() as td:
            best, score = best_output(Path(td))
            self.assertIsNone(best)
            self.assertIsNone(score)


class _FakePermuterProcess:
    """Minimal stand-in for `subprocess.Popen`. Streams a fixed
    canned-stdout, exits with `exit_code`, supports terminate()/wait()
    so the wall-clock branch can be exercised too."""

    def __init__(self, lines: list[str], exit_code: int = 0,
                 hang_after: int | None = None):
        from io import StringIO
        # Each "line" must already end in \n. readline() returns ""
        # at EOF.
        self.stdout = StringIO("".join(lines))
        self._exit = exit_code
        self._poll_returned = False
        self._terminated = False
        self._hang_after = hang_after
        self._lines_read = 0

    def readline(self) -> str:
        # readline() on StringIO works fine — returns "" at EOF.
        line = self.stdout.readline()
        if line:
            self._lines_read += 1
        return line

    def poll(self):
        # Only signal "done" once readline returns "" (i.e. all canned
        # lines consumed). Lets the wrapper's drain loop terminate
        # naturally.
        if self.stdout.tell() == len(self.stdout.getvalue()):
            return self._exit
        return None

    def terminate(self):
        self._terminated = True

    def kill(self):
        self._terminated = True

    def wait(self, timeout=None):
        return self._exit


class TestRunPermuter(unittest.TestCase):
    """Subprocess invocation + stdout streaming + outcome detection.
    Permuter itself is mocked — we verify the wrapper builds the
    right command, captures stdout to the right log path, and
    reports the right `PermuterRunResult` shape."""

    def test_builds_expected_command_with_defaults(self):
        captured_cmd = {}
        def fake_popen(cmd, **kwargs):
            captured_cmd["cmd"] = cmd
            captured_cmd["kwargs"] = kwargs
            return _FakePermuterProcess(lines=[], exit_code=0)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            vendor = tmp / "vendor"
            vendor.mkdir()
            (vendor / "permuter.py").write_text("# stub")
            nonmatchings = tmp / "nm"
            nonmatchings.mkdir()
            log_dir = tmp / "logs"
            res = run_permuter(
                vendor_dir=vendor,
                nonmatchings_dir=nonmatchings,
                function_name="func_x",
                log_dir=log_dir,
                threads=4,
                max_seconds=10,
                popen=fake_popen,
                console_print=lambda m: None,
                sleep=lambda s: None,
            )
            cmd = captured_cmd["cmd"]
            # Argv[0] is sys.executable; argv[1] is the script path.
            self.assertEqual(cmd[1], str(vendor / "permuter.py"))
            self.assertEqual(cmd[2], str(nonmatchings))
            self.assertIn("-j", cmd)
            self.assertEqual(cmd[cmd.index("-j") + 1], "4")
            # Default: --stop-on-zero is on.
            self.assertIn("--stop-on-zero", cmd)
            # No seed by default.
            self.assertNotIn("--seed", cmd)
            # Log file exists after run — assertion is inside the
            # tempdir context so the log path is still valid.
            self.assertTrue(res.log_path.is_file())
            self.assertEqual(res.log_path.parent, log_dir)
            self.assertFalse(res.timed_out)
            self.assertEqual(res.exit_code, 0)

    def test_seed_propagates_to_command(self):
        captured = {}
        def fake_popen(cmd, **_kw):
            captured["cmd"] = cmd
            return _FakePermuterProcess(lines=[], exit_code=0)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            vendor = tmp / "vendor"
            vendor.mkdir()
            (vendor / "permuter.py").write_text("# stub")
            nm = tmp / "nm"
            nm.mkdir()
            run_permuter(
                vendor_dir=vendor, nonmatchings_dir=nm,
                function_name="f", log_dir=tmp / "logs",
                threads=2, seed=42, max_seconds=5,
                popen=fake_popen,
                console_print=lambda m: None,
                sleep=lambda s: None,
            )
        cmd = captured["cmd"]
        self.assertIn("--seed", cmd)
        self.assertEqual(cmd[cmd.index("--seed") + 1], "42")

    def test_no_stop_on_zero_when_disabled(self):
        captured = {}
        def fake_popen(cmd, **_kw):
            captured["cmd"] = cmd
            return _FakePermuterProcess(lines=[], exit_code=0)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            vendor = tmp / "vendor"
            vendor.mkdir()
            (vendor / "permuter.py").write_text("# stub")
            nm = tmp / "nm"
            nm.mkdir()
            run_permuter(
                vendor_dir=vendor, nonmatchings_dir=nm,
                function_name="f", log_dir=tmp / "logs",
                threads=1, max_seconds=5, stop_on_zero=False,
                popen=fake_popen,
                console_print=lambda m: None,
                sleep=lambda s: None,
            )
        self.assertNotIn("--stop-on-zero", captured["cmd"])

    def test_match_detection_via_output_dir_glob(self):
        # Permuter "found" a match (output-0-0/ created during the
        # mocked run). Wrapper should see it and report match_found.
        lines = [
            "iteration 1, 0 errors, score = 50\n",
            "found new best score! (10 vs 50)\n",
            "found new best score! (0 vs 10)\n",
            "wrote to /tmp/nm/output-0-0\n",
        ]
        def fake_popen(cmd, **_kw):
            return _FakePermuterProcess(lines=lines, exit_code=0)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            vendor = tmp / "vendor"
            vendor.mkdir()
            (vendor / "permuter.py").write_text("# stub")
            nm = tmp / "nm"
            nm.mkdir()
            # Pre-populate the output dir that the mocked run "would
            # have created" — same effect as if real permuter had run.
            (nm / "output-0-0").mkdir()
            (nm / "output-0-0" / "source.c").write_text(
                "/* matched permutation */\nvoid f(void) {}\n"
            )
            res = run_permuter(
                vendor_dir=vendor, nonmatchings_dir=nm,
                function_name="f", log_dir=tmp / "logs",
                threads=1, max_seconds=5,
                popen=fake_popen,
                console_print=lambda m: None,
                sleep=lambda s: None,
            )
            self.assertTrue(res.match_found)
            self.assertEqual(res.best_score, 0)
            self.assertIsNotNone(res.result_c_path)
            self.assertEqual(res.result_c_path.name, "source.c")
            self.assertTrue(res.result_c_path.is_file())

    def test_no_match_reports_best_score(self):
        # Permuter ran but didn't find a match — best score is non-
        # zero. match_found stays False.
        def fake_popen(cmd, **_kw):
            return _FakePermuterProcess(lines=[], exit_code=0)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            vendor = tmp / "vendor"
            vendor.mkdir()
            (vendor / "permuter.py").write_text("# stub")
            nm = tmp / "nm"
            nm.mkdir()
            (nm / "output-12-0").mkdir()
            (nm / "output-7-3").mkdir()
            res = run_permuter(
                vendor_dir=vendor, nonmatchings_dir=nm,
                function_name="f", log_dir=tmp / "logs",
                threads=1, max_seconds=5,
                popen=fake_popen,
                console_print=lambda m: None,
                sleep=lambda s: None,
            )
        self.assertFalse(res.match_found)
        self.assertEqual(res.best_score, 7)
        self.assertIsNone(res.result_c_path)

    def test_log_captures_full_stdout(self):
        lines = [
            "iteration 1, 0 errors, score = 50\n",
            "found new best score! (10 vs 50)\n",
            "iteration 2, 0 errors, score = 10\n",
        ]
        def fake_popen(cmd, **_kw):
            return _FakePermuterProcess(lines=lines, exit_code=0)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            vendor = tmp / "vendor"
            vendor.mkdir()
            (vendor / "permuter.py").write_text("# stub")
            nm = tmp / "nm"
            nm.mkdir()
            res = run_permuter(
                vendor_dir=vendor, nonmatchings_dir=nm,
                function_name="func_x", log_dir=tmp / "logs",
                threads=1, max_seconds=5,
                popen=fake_popen,
                console_print=lambda m: None,
                sleep=lambda s: None,
            )
            contents = res.log_path.read_text()
            for L in lines:
                self.assertIn(L.rstrip("\n"), contents)

    def test_tail_print_only_emits_progress_lines(self):
        # Verify the wrapper's tail-print filter — `iteration X` lines
        # should NOT be echoed to the console (would be too noisy);
        # `found new best`, `tied best`, `found a better`, `wrote to`
        # SHOULD be. Brief 063's "tail-print the most recent best
        # score line" intent.
        lines = [
            "iteration 1, 0 errors, score = 50\n",
            "found new best score! (10 vs 50)\n",
            "iteration 2, 0 errors, score = 10\n",
            "tied best score! (10 vs 10)\n",
            "iteration 3, 0 errors, score = 10\n",
            "found a better score! (5 vs 10)\n",
            "wrote to /tmp/nm/output-5-0\n",
        ]
        echoed = []
        def fake_popen(cmd, **_kw):
            return _FakePermuterProcess(lines=lines, exit_code=0)
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            vendor = tmp / "vendor"
            vendor.mkdir()
            (vendor / "permuter.py").write_text("# stub")
            nm = tmp / "nm"
            nm.mkdir()
            run_permuter(
                vendor_dir=vendor, nonmatchings_dir=nm,
                function_name="f", log_dir=tmp / "logs",
                threads=1, max_seconds=5,
                popen=fake_popen,
                console_print=lambda m: echoed.append(m),
                sleep=lambda s: None,
            )
        # Banner lines (command/log/cap/threads) come first; then the
        # progress markers. Filter to just the progress prefix.
        progress = [e for e in echoed if "permuter:" in e]
        # 4 progress markers expected; `iteration` lines suppressed.
        self.assertEqual(len(progress), 4)
        self.assertTrue(any("found new best" in p for p in progress))
        self.assertTrue(any("tied best" in p for p in progress))
        self.assertTrue(any("found a better" in p for p in progress))
        self.assertTrue(any("wrote to" in p for p in progress))


class TestCopyMatchToPermWork(unittest.TestCase):
    def test_copies_source_c_to_result_c(self):
        with tempfile.TemporaryDirectory() as td:
            tmp = Path(td)
            src = tmp / "output-0-0" / "source.c"
            src.parent.mkdir(parents=True)
            src.write_text("/* matched */\nvoid f(void) {}\n", encoding="utf-8")
            work_dir = tmp / "perm_work" / "main_f_02000000"
            dst = copy_match_to_perm_work(
                result_c=src, perm_work_dir=work_dir,
            )
            self.assertEqual(dst, work_dir / "result.c")
            self.assertTrue(dst.is_file())
            self.assertEqual(dst.read_text(), src.read_text())


class TestPermuterRunResultDefaults(unittest.TestCase):
    """Empty PermuterRunResult — defensive shape pin so future
    callers can rely on the field defaults."""

    def test_defaults(self):
        r = PermuterRunResult()
        self.assertFalse(r.match_found)
        self.assertIsNone(r.best_score)
        self.assertIsNone(r.result_c_path)
        self.assertIsNone(r.log_path)
        self.assertFalse(r.timed_out)
        self.assertIsNone(r.exit_code)
        self.assertEqual(r.output_dirs, [])


# --------------------------------------------------------------------------- #
# Brief 096 — permuter wrapper for macOS Apple Silicon
# --------------------------------------------------------------------------- #


class TestNormalizeDisasmForPermuter(unittest.TestCase):
    """dsd-dis → permuter-acceptable .s transformation."""

    DSD_SAMPLE = """    .include "macros/function.inc"

    .text
    .global func_02009758
    arm_func_start func_02009758
func_02009758: ; 0x02009758
    stmdb sp!, {r3, lr}
    mov r1, r0, asr #4 ; comment after instr
    ldmia sp!, {r3, pc}
    arm_func_end func_02009758
"""

    def test_strips_dsd_include(self):
        out = normalize_disasm_for_permuter(self.DSD_SAMPLE)
        self.assertNotIn("macros/function.inc", out)
        self.assertNotIn(".include", out)

    def test_strips_arm_func_start_end(self):
        out = normalize_disasm_for_permuter(self.DSD_SAMPLE)
        self.assertNotIn("arm_func_start", out)
        self.assertNotIn("arm_func_end", out)

    def test_rewrites_global_to_globl(self):
        out = normalize_disasm_for_permuter(self.DSD_SAMPLE)
        self.assertNotIn(".global ", out)
        self.assertIn(".globl func_02009758", out)

    def test_preserves_instructions(self):
        # Body instructions + label survive verbatim.
        out = normalize_disasm_for_permuter(self.DSD_SAMPLE)
        self.assertIn("func_02009758:", out)
        self.assertIn("stmdb sp!, {r3, lr}", out)
        self.assertIn("ldmia sp!, {r3, pc}", out)

    def test_strips_semicolon_annotations(self):
        # dsd-dis uses `;` for NASM-style comments; ARM GNU as
        # treats `;` as junk-at-end-of-line and refuses. The
        # normaliser strips them.
        out = normalize_disasm_for_permuter(self.DSD_SAMPLE)
        self.assertNotIn("; 0x02009758", out)
        self.assertNotIn("comment after instr", out)
        # Label and instruction body still present.
        self.assertIn("func_02009758:", out)
        self.assertIn("mov r1, r0, asr #4", out)

    def test_idempotent(self):
        # Running the normaliser twice produces the same output.
        once = normalize_disasm_for_permuter(self.DSD_SAMPLE)
        twice = normalize_disasm_for_permuter(once)
        self.assertEqual(once, twice)

    def test_globl_in_input_is_preserved(self):
        # If the input already uses `.globl`, leave it alone.
        already_globl = self.DSD_SAMPLE.replace(".global", ".globl")
        out = normalize_disasm_for_permuter(already_globl)
        self.assertIn(".globl func_02009758", out)
        self.assertNotIn(".global ", out)


class TestStripCompileShAmpersand(unittest.TestCase):
    """compile.sh → strip the `&& transform_dep.py …` chunk while
    preserving `"$INPUT" -o "$OUTPUT"`."""

    NINJA_DERIVED = """#!/usr/bin/env bash
INPUT="$(realpath "$1")"
OUTPUT="$(realpath "$3")"
cd /Users/leo/Dev/gx-spirit-caller
wine ./tools/mwccarm/2.0/sp1p5/mwccarm.exe -O4,p -enum int -lang=c -d eur -c '&&' /opt/homebrew/opt/python@3.13/bin/python3.13 tools/transform_dep.py build/eur/src/main/foo.d build/eur/src/main/foo.d "$INPUT" -o "$OUTPUT"
"""

    def test_strips_ampersand_chain(self):
        out = strip_compile_sh_ampersand(self.NINJA_DERIVED)
        self.assertNotIn("&&", out)
        self.assertNotIn("transform_dep.py", out)
        # Header lines + mwccarm invocation survive.
        self.assertIn("#!/usr/bin/env bash", out)
        self.assertIn("wine ./tools/mwccarm", out)

    def test_preserves_input_output_placeholders(self):
        # The `"$INPUT" -o "$OUTPUT"` markers must land in mwccarm's
        # arg list (they were originally pushed to the END by import.py
        # because of the `&&` chain). After the strip, the line should
        # end with `-c "$INPUT" -o "$OUTPUT"`.
        out = strip_compile_sh_ampersand(self.NINJA_DERIVED)
        self.assertIn('"$INPUT"', out)
        self.assertIn('"$OUTPUT"', out)
        # They appear AFTER `-c` so mwccarm can find the source.
        wine_line = next(line for line in out.splitlines()
                         if line.startswith("wine "))
        self.assertRegex(wine_line, r'-c\s+"\$INPUT"\s+-o\s+"\$OUTPUT"')

    def test_idempotent(self):
        once = strip_compile_sh_ampersand(self.NINJA_DERIVED)
        twice = strip_compile_sh_ampersand(once)
        self.assertEqual(once, twice)

    def test_no_ampersand_no_change(self):
        # File without `&&` passes through.
        no_amp = "#!/usr/bin/env bash\nwine mwccarm.exe foo.c\n"
        self.assertEqual(strip_compile_sh_ampersand(no_amp), no_amp)


class TestPatchPermuterVendor(unittest.TestCase):
    """patch_permuter_vendor applies the 3 import.py edits + the
    prelude.inc replacement, idempotently."""

    def setUp(self):
        self.tmpdir = tempfile.TemporaryDirectory()
        self.vendor = Path(self.tmpdir.name)
        # Synthesise a pristine `import.py` with the exact search
        # strings from the pinned commit. The patches use these as
        # substring anchors.
        (self.vendor / "import.py").write_text(
            'def homebrew_gcc_cpp() -> str:\n'
            '    lookup_paths = ["/usr/local/bin", "/opt/homebrew/bin"]\n'
            '\n'
            '    for lookup_path in lookup_paths:\n'
            '        try:\n'
            '            return max(f for f in os.listdir(lookup_path) if f.startswith("cpp-"))\n'
            '        except ValueError:\n'
            '            pass\n'
            '\n'
            '\n'
            'DEFAULT_AS_CMDLINE: List[str] = ["mips-linux-gnu-as", "-march=vr4300", "-mabi=32"]\n'
            '\n'
            '    for arg in compiler:\n'
            '        if include_next > 0:\n'
            '            include_next -= 1\n'
            '            cpp_command.append(arg)\n'
            '            continue\n'
            '        if arg in ["-D", "-U", "-I"]:\n'
            '            cpp_command.append(arg)\n'
            '            include_next = 1\n'
            '            continue\n'
            '        if (\n'
            '            arg.startswith("-D")\n'
            '        ):\n'
            '            pass\n',
            encoding="utf-8",
        )
        (self.vendor / "prelude.inc").write_text(
            ".set noat\n.set noreorder\n.set gp=64\n", encoding="utf-8",
        )

    def tearDown(self):
        self.tmpdir.cleanup()

    def test_applies_all_three_import_patches(self):
        patch_permuter_vendor(self.vendor, log=lambda *a, **k: None)
        text = (self.vendor / "import.py").read_text(encoding="utf-8")
        # Patch 1: FileNotFoundError catch.
        self.assertIn("(ValueError, FileNotFoundError)", text)
        # Patch 2: lowercase `-i` handling.
        self.assertIn('if arg == "-i":', text)
        # Patch 3: ARM assembler default.
        self.assertIn("arm-none-eabi-as", text)
        self.assertNotIn("mips-linux-gnu-as", text)
        # Guard substring present in each patched location.
        self.assertGreaterEqual(
            text.count(PERMUTER_VENDOR_PATCH_GUARD), 3,
        )

    def test_replaces_prelude(self):
        patch_permuter_vendor(self.vendor, log=lambda *a, **k: None)
        prelude = (self.vendor / "prelude.inc").read_text(encoding="utf-8")
        self.assertEqual(prelude, PERMUTER_ARM_PRELUDE)
        self.assertIn(PERMUTER_VENDOR_PATCH_GUARD, prelude)
        self.assertNotIn(".set noat", prelude)

    def test_idempotent(self):
        # Second invocation must not double-patch.
        patch_permuter_vendor(self.vendor, log=lambda *a, **k: None)
        once = (self.vendor / "import.py").read_text(encoding="utf-8")
        patch_permuter_vendor(self.vendor, log=lambda *a, **k: None)
        twice = (self.vendor / "import.py").read_text(encoding="utf-8")
        self.assertEqual(once, twice)
        # Guard count stays the same (3 import.py + 1 prelude is the
        # expected total for an applied vendor).
        self.assertEqual(
            once.count(PERMUTER_VENDOR_PATCH_GUARD),
            twice.count(PERMUTER_VENDOR_PATCH_GUARD),
        )

    def test_missing_search_string_raises(self):
        # Tampered file → patch.py can't find the anchor → loud
        # failure rather than silent corruption.
        (self.vendor / "import.py").write_text(
            "# completely different content\n", encoding="utf-8",
        )
        with self.assertRaises(ValueError) as ctx:
            patch_permuter_vendor(self.vendor, log=lambda *a, **k: None)
        self.assertIn("brief 096 patch", str(ctx.exception))

    def test_missing_file_raises(self):
        # No import.py → fail loud rather than silently skip.
        (self.vendor / "import.py").unlink()
        with self.assertRaises(ValueError):
            patch_permuter_vendor(self.vendor, log=lambda *a, **k: None)


class TestPatchRegistry(unittest.TestCase):
    """Sanity: the patch table is well-formed."""

    def test_three_import_patches(self):
        filenames = {p[0] for p in PERMUTER_VENDOR_PATCHES}
        self.assertEqual(filenames, {"import.py"})

    def test_guard_in_every_replacement(self):
        for _filename, _search, replacement in PERMUTER_VENDOR_PATCHES:
            self.assertIn(PERMUTER_VENDOR_PATCH_GUARD, replacement)

    def test_arm_prelude_uses_percent_function_not_at(self):
        # ELF/ARM uses `%function`; upstream MIPS prelude used
        # `@function`. Regression guard against drift on prelude
        # bumps.
        self.assertIn("%function", PERMUTER_ARM_PRELUDE)
        self.assertNotIn("@function", PERMUTER_ARM_PRELUDE)


if __name__ == "__main__":
    unittest.main()
