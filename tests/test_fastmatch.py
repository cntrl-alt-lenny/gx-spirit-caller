"""Tests for tools/fastmatch.py (brief 620).

fastmatch.py had zero test coverage before this brief. Scoped narrowly to
the one bug found and fixed while scale-validating cmatch_loop.py against
it: ninja_compile_one's error-summarizing took the FIRST n lines of a
failed compile's combined output, which on macOS is always wine/MoltenVK
startup noise, never the actual mwcc error -- every one of 70 real ov008
compile failures in one sweep showed nothing useful via the old behavior.
A position-based fix (take the LAST n lines instead) was a real
improvement but still incomplete: wine/MoltenVK prints not one but TWO
banners per compile (a ~150-line capability dump at startup, then a
second, shorter "Created VkInstance" banner later), so a fixed-size tail
can still land entirely inside noise for some candidates -- observed
directly across the same 70-candidate sweep, not a hypothetical. The
final fix filters out lines matching known noise patterns first, then
tails whatever real content remains. summarize_compile_error() is the
extracted, independently-testable pure function.

q-fastmatch-sweep-friction (brief, 2026-07-26) added narrower coverage
for three more real gaps cm-ov002-unknown-sweep's 5-worktree sweep
(#1363) hit and worked around instead of fixing: gap-object discovery
blind to individually-carved `.s` candidates (TestFindGapByDelinkedObject),
a ninja "multiple rules generate" fatal when a candidate's `.c` draft
and its still-`.s`-routed sibling coexist (TestSiblingSPath,
TestNinjaConfigErrorDetection, TestNinjaCompileOneSelfHeal -- the last
mocks subprocess.run rather than needing a real toolchain), and an
unhandled crash on an out-of-repo --gap path (TestDisplayPath). The
rest of fastmatch.py's real-subprocess-driven surface (match_one's own
end-to-end flow, real gap discovery against a real build tree) is still
exercised indirectly by tests/test_cmatch_loop.py's real-toolchain
integration tests instead, per the original scoping above.
"""

from __future__ import annotations

import contextlib
import io
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import fastmatch  # noqa: E402


def _mvk_capability_banner(n_extensions: int = 153) -> list[str]:
    """The large startup banner: MoltenVK version line, N supported
    Vulkan extensions, then a GPU capability block."""
    return [
        "[mvk-info] MoltenVK version 1.4.1, supporting Vulkan version 1.4.334.",
        f"\tThe following {n_extensions} Vulkan extensions are supported:",
        *(f"\tVK_KHR_ext_{i} v1" for i in range(n_extensions)),
        "\tmodel: Apple M1",
        "\ttype: Integrated",
        "\tvendorID: 0x106b",
        "\tdeviceID: 0x1a050207",
        "\tpipelineCacheUUID: DB445FF2-1A05-0207-0000-000100000000",
        "\tGPU memory available: 5461 MB",
        "\tGPU memory used: 0 MB",
        "\tMetal Shading Language 3.2",
        "\tsupports the following GPU Features:",
        "\t\tGPU Family Metal 3",
        "\t\tGPU Family Apple 7",
        "\t\tGPU Family Mac 2",
        "\t\tRead-Write Texture Tier 2",
    ]


def _mvk_instance_banner(n_extensions: int = 3) -> list[str]:
    """The SECOND, smaller banner wine/MoltenVK prints later, once the
    app actually creates a VkInstance -- confirmed real (not assumed):
    seen following the large capability banner in real captured ov008
    sweep output, close enough to the tail end that a fixed-size
    position-based tail alone was insufficient for some candidates."""
    return [
        "[mvk-info] Created VkInstance for Vulkan version 1.0.334, as requested "
        f"by app, with the following {n_extensions} Vulkan extensions enabled:",
        *(f"\tVK_KHR_ext_{i} v1" for i in range(n_extensions)),
    ]


def _wine_fixme_lines() -> list[str]:
    return [
        "0050:fixme:keyboard:NtUserActivateKeyboardLayout Changing user locale is not supported",
        "00a8:fixme:keyboard:NtUserActivateKeyboardLayout Changing user locale is not supported",
    ]


class TestSummarizeCompileError(unittest.TestCase):
    def test_filters_bare_vulkan_extension_lines(self):
        noise = [f"VK_KHR_extension_{i} v1" for i in range(150)]
        text = "\n".join(noise) + "\nsrc/foo.c:1: declaration syntax error\nErrors caused tool to abort.\n"
        result = fastmatch.summarize_compile_error(text)
        self.assertIn("declaration syntax error", result)
        self.assertIn("Errors caused tool to abort.", result)
        self.assertNotIn("VK_KHR_extension_0 ", result)

    def test_short_output_returned_whole(self):
        text = "src/foo.c:3: undefined identifier 'x'\n"
        result = fastmatch.summarize_compile_error(text)
        self.assertEqual(result, "src/foo.c:3: undefined identifier 'x'")

    def test_empty_input_falls_back_to_generic_message(self):
        self.assertEqual(fastmatch.summarize_compile_error(""), "ninja returned non-zero")

    def test_custom_n_respected(self):
        text = "\n".join(f"line{i}" for i in range(10))
        result = fastmatch.summarize_compile_error(text, n=3)
        self.assertEqual(result, "line7\nline8\nline9")

    def test_default_preserves_all_signal_lines(self):
        text = "\n".join(f"compiler line {i}" for i in range(20))
        result = fastmatch.summarize_compile_error(text)
        self.assertEqual(result, text)

    def test_all_noise_falls_back_to_raw_tail_not_blank(self):
        # If literally everything matches the noise filter (shouldn't
        # happen for a genuine compile error, but must never surface an
        # empty message when the process DID print something).
        text = "\n".join(_mvk_capability_banner(n_extensions=5))
        result = fastmatch.summarize_compile_error(text)
        self.assertTrue(result.strip())

    def test_single_banner_shape(self):
        lines = _mvk_capability_banner() + _wine_fixme_lines() + [
            r"src\overlay008\func_ov008_021b2200.c:1: declaration syntax error",
            r"src\overlay008\func_ov008_021b2200.c:2: undefined identifier 's32'",
            "Errors caused tool to abort.",
        ]
        result = fastmatch.summarize_compile_error("\n".join(lines))
        self.assertIn("declaration syntax error", result)
        self.assertIn("undefined identifier", result)
        self.assertIn("Errors caused tool to abort.", result)
        self.assertNotIn("mvk-info", result)
        self.assertNotIn("VK_KHR_ext_", result)

    def test_two_banner_shape_real_sweep_case(self):
        # The case a position-only fix (tail of a fixed size) missed:
        # TWO MoltenVK banners per compile, the second one close enough
        # to the real error that a small fixed-size tail can still land
        # entirely inside it for some candidates. Observed directly
        # across the real 70-candidate ov008 sweep, not constructed to
        # order -- this is why filtering by content, not just position,
        # was necessary.
        lines = (
            _mvk_capability_banner()
            + _mvk_instance_banner()
            + _wine_fixme_lines()
            + [
                r"src\overlay008\func_ov008_021b2268.c:4: illegal function definition",
                r"src\overlay008\func_ov008_021b2268.c:5: illegal function definition",
                "Errors caused tool to abort.",
            ]
        )
        result = fastmatch.summarize_compile_error("\n".join(lines))
        self.assertIn("illegal function definition", result)
        self.assertIn("Errors caused tool to abort.", result)
        self.assertNotIn("mvk-info", result)
        self.assertNotIn("VK_KHR_ext_", result)
        self.assertNotIn("fixme:", result)

    def test_default_n_holds_across_a_realistically_short_tail_window(self):
        # With the default n=15 and a SHORT real error (2 lines + abort
        # banner = 3 signal lines), the filtered signal must still be
        # exactly those 3 lines -- confirms the filter, not a generous n,
        # is what's doing the real work.
        lines = _mvk_capability_banner() + _mvk_instance_banner() + [
            "src/x.c:1: declaration syntax error",
            "Errors caused tool to abort.",
        ]
        result = fastmatch.summarize_compile_error("\n".join(lines))
        self.assertEqual(result, "src/x.c:1: declaration syntax error\nErrors caused tool to abort.")


class TestHelpDoesNotCrash(unittest.TestCase):
    """cm-ov002-unknown-sweep-3: two independent sweep batches hit
    `python tools/fastmatch.py --help` crashing with `ValueError:
    unsupported format character 'm'`. Cause: argparse's own help
    formatter treats a literal `%` in a help string as the start of a
    `%(...)s`-style substitution -- `--verbose`'s help text had a bare
    `100%% matches` (single `%`), and argparse's `_expand_help` blew up
    trying to interpret `% m` as a format spec. Fix: escape as `%%`."""

    def test_help_does_not_raise(self):
        with contextlib.redirect_stdout(io.StringIO()):
            with self.assertRaises(SystemExit) as cm:
                fastmatch.main(["--help"])
        # argparse's own --help path exits 0 after printing; the bug
        # was a ValueError raised INSIDE format_help(), never reaching
        # this clean exit at all.
        self.assertEqual(cm.exception.code, 0)


class TestMissingFile(unittest.TestCase):
    def setUp(self):
        # main() checks `(ROOT / "build.ninja").is_file()` BEFORE checking
        # whether the requested .c file exists, and bails with a DIFFERENT
        # stderr-only message if it's missing -- so on a worktree that
        # hasn't run configure.py (every CI checkout; this job never does),
        # these tests previously got empty stdout instead of the expected
        # FILE NOT FOUND line, while passing silently on any dev box that
        # happened to have already configured a build. The actual behavior
        # under test (missing-file reporting) has no real dependency on a
        # configured build graph, so isolate ROOT to a scratch dir with a
        # stub build.ninja instead of relying on whatever the ambient
        # worktree happens to have.
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        root = Path(tmp.name)
        (root / "build.ninja").write_text("")
        patcher = mock.patch("fastmatch.ROOT", root)
        patcher.start()
        self.addCleanup(patcher.stop)

    def test_stale_path_reports_cleanly_and_returns_exit_two(self):
        stdout = io.StringIO()
        stderr = io.StringIO()
        with contextlib.redirect_stdout(stdout), contextlib.redirect_stderr(stderr):
            rc = fastmatch.main(["eur", "src/main/func_stale.c"])

        self.assertEqual(rc, 2)
        self.assertIn("[eur] func_stale.c: FILE NOT FOUND", stdout.getvalue())
        self.assertIn("ERROR: not found: src/main/func_stale.c", stderr.getvalue())

    def test_missing_file_json_keeps_region_for_status_rendering(self):
        stdout = io.StringIO()
        with contextlib.redirect_stdout(stdout), contextlib.redirect_stderr(io.StringIO()):
            rc = fastmatch.main(["jpn", "src/main/func_stale.c", "--json"])

        self.assertEqual(rc, 2)
        result = json.loads(stdout.getvalue())[0]
        self.assertEqual(result["status"], "file_not_found")
        self.assertEqual(result["region"], "jpn")


class TestObjdumpExecution(unittest.TestCase):
    def test_launch_failure_is_not_reported_as_no_functions(self):
        completed = subprocess.CompletedProcess(
            args=["stub-objdump"],
            returncode=1,
            stdout="",
            stderr="Library not loaded: libzstd.1.dylib",
        )
        with mock.patch.object(fastmatch, "ninja_compile_one", return_value=(True, "")), \
             mock.patch.object(fastmatch, "_OBJDUMP", "stub-objdump"), \
             mock.patch.object(fastmatch.subprocess, "run", return_value=completed):
            result = fastmatch.match_one(Path("src/main/func_X.c"), "eur")

        self.assertEqual(result["status"], "objdump_error")
        self.assertIn("Library not loaded: libzstd.1.dylib", result["error"])
        self.assertNotEqual(result["status"], "no_functions")

    def test_successful_empty_objdump_output_is_an_execution_error(self):
        completed = subprocess.CompletedProcess(
            args=["stub-objdump"], returncode=0, stdout="", stderr=""
        )
        with mock.patch.object(fastmatch, "_OBJDUMP", "stub-objdump"), \
             mock.patch.object(fastmatch.subprocess, "run", return_value=completed):
            with self.assertRaises(fastmatch.ObjdumpError) as raised:
                fastmatch.list_funcs_in_obj(Path("func.o"))
        self.assertIn("produced no output", str(raised.exception))


class TestFindGapByDelinkedObject(unittest.TestCase):
    """q-fastmatch-sweep-friction gap (a): cm-ov002-unknown-sweep's 5-worktree
    sweep (PR #1363) found gap-object auto-discovery reliably empty-handed
    for an individually-carved `.s` candidate -- confirmed independently by
    3 of 5 sweep batches, none of which could rely on it. Root cause:
    find_gap_by_glob only matches `_dsd_gap@<module>_*.o`, which dsd emits
    ONLY for a genuinely-unassigned region -- never for a function that
    already has its own delinks.txt entry, which every whole-function-ship
    `.s` candidate does. Confirmed on the real eur tree (brief
    q-fastmatch-sweep-friction): `src/overlay002/func_ov002_021aa4a0.s`
    (still `.s` in config/eur/arm9/overlays/ov002/delinks.txt) has its
    reference object at build/eur/delinks/src/overlay002/func_ov002_
    021aa4a0.o -- no `_dsd_gap@` blob anywhere for it.
    """

    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = Path(tmp.name)
        patcher = mock.patch("fastmatch.ROOT", self.root)
        patcher.start()
        self.addCleanup(patcher.stop)

    def _touch(self, rel: str) -> Path:
        p = self.root / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_bytes(b"")
        return p

    def test_old_glob_path_finds_nothing_for_a_carved_single(self):
        # Reproduces the failure mode itself, independent of the fix:
        # a delinked reference object exists, but carries no `_dsd_gap@`
        # sibling anywhere in the region's delinks tree, so the
        # pre-existing discovery path comes back empty -- this is true
        # both before and after the fix (find_gap_by_glob is unchanged),
        # it just documents WHY the new path is necessary.
        self._touch("build/eur/delinks/src/overlay002/func_ov002_021aa4a0.o")
        found = fastmatch.find_gap_by_glob("func_ov002_021aa4a0", "overlay002", "eur")
        self.assertIsNone(found)

    def test_finds_the_delinked_reference_object_for_an_unconverted_candidate(self):
        expected = self._touch(
            "build/eur/delinks/src/overlay002/func_ov002_021aa4a0.o"
        )
        c_path = self.root / "src/overlay002/func_ov002_021aa4a0.c"
        c_path.parent.mkdir(parents=True, exist_ok=True)
        c_path.write_text("void func_ov002_021aa4a0(void) {}\n")

        found = fastmatch.find_gap_by_delinked_object(
            c_path, "func_ov002_021aa4a0", "eur"
        )
        self.assertEqual(found, expected)

    def test_falls_back_to_tier_suffixed_object_if_present(self):
        # An already-converted delinks.txt entry names its reference
        # object after the CURRENT (suffixed) source path, e.g.
        # "func_X.legacy.o" -- confirmed on the real tree for functions
        # already routed to the legacy tier.
        expected = self._touch(
            "build/usa/delinks/src/usa/main/func_X.legacy.o"
        )
        c_path = self.root / "src/usa/main/func_X.legacy.c"
        found = fastmatch.find_gap_by_delinked_object(c_path, "func_X", "usa")
        self.assertEqual(found, expected)

    def test_returns_none_when_nothing_matches(self):
        (self.root / "build/eur/delinks/src/overlay002").mkdir(parents=True)
        c_path = self.root / "src/overlay002/func_ov002_ffffffff.c"
        found = fastmatch.find_gap_by_delinked_object(
            c_path, "func_ov002_ffffffff", "eur"
        )
        self.assertIsNone(found)


class TestSiblingSPath(unittest.TestCase):
    """gap (b) helper: strips a routing-tier suffix down to the bare stem
    before swapping to `.s` -- a .s has no tier concept, so the sibling a
    tiered .c draft collides with is always the untiered name."""

    def test_plain_c(self):
        self.assertEqual(
            fastmatch._sibling_s_path(Path("src/main/func_X.c")),
            Path("src/main/func_X.s"),
        )

    def test_legacy_tier(self):
        self.assertEqual(
            fastmatch._sibling_s_path(Path("src/main/func_X.legacy.c")),
            Path("src/main/func_X.s"),
        )

    def test_legacy_sp3_tier(self):
        self.assertEqual(
            fastmatch._sibling_s_path(Path("src/overlay002/func_ov002_X.legacy_sp3.c")),
            Path("src/overlay002/func_ov002_X.s"),
        )

    def test_thumb_tier(self):
        self.assertEqual(
            fastmatch._sibling_s_path(Path("src/main/func_X.thumb.c")),
            Path("src/main/func_X.s"),
        )


class TestNinjaConfigErrorDetection(unittest.TestCase):
    def test_detects_multiple_rules_generate(self):
        output = (
            "ninja: error: build.ninja:56206: multiple rules generate "
            "build/eur/src/main/func_X.o\n"
        )
        err = fastmatch._ninja_config_error(output)
        self.assertIsNotNone(err)
        self.assertIn("multiple rules generate", err)

    def test_none_for_a_real_compile_error(self):
        # A genuine mwcc failure has no "ninja: error:" line -- ninja
        # itself ran the build graph fine, the COMPILER rejected the
        # source. Must never be mistaken for a config-level fatal.
        output = "src/main/func_X.c:3: declaration syntax error\n"
        self.assertIsNone(fastmatch._ninja_config_error(output))


class TestNinjaCompileOneSelfHeal(unittest.TestCase):
    """gap (b): configure.py adds a build rule for every .c AND every .s
    under src/, so a candidate .c draft sitting beside its own still-.s
    -routed sibling makes ninja refuse to build ANYTHING ("multiple rules
    generate <out>.o") until the collision is resolved. Same root cause
    batch_sha1.py's _displace_stale_sibling/_reconfigure already fixed
    (#1351) for its own multi-candidate, permanent-flip use case --
    ported here for fastmatch's single-file, read-only use (the sibling
    must always come back afterward, since fastmatch never edits
    delinks.txt). Mocks subprocess.run: no real ninja/toolchain needed to
    prove the retry-and-restore control flow itself.
    """

    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = Path(tmp.name)
        mock.patch("fastmatch.ROOT", self.root).start()
        self.addCleanup(mock.patch.stopall)

        self.c_path = self.root / "src/main/func_X.c"
        self.c_path.parent.mkdir(parents=True)
        self.c_path.write_text("void func_X(void) {}\n")

        self.s_path = self.root / "src/main/func_X.s"
        self.s_original_bytes = b"@ original .s bytes, must come back byte-exact\r\n"
        self.s_path.write_bytes(self.s_original_bytes)

        self.out_o = self.root / "build/eur/src/main/func_X.o"
        (self.root / "build.ninja").write_text("")

    def _completed(self, returncode: int, stderr: str = "", stdout: str = ""):
        return subprocess.CompletedProcess(
            args=["x"], returncode=returncode, stdout=stdout, stderr=stderr,
        )

    def test_self_heals_and_restores_the_sibling_byte_exact(self):
        collision_err = (
            "ninja: error: build.ninja:1: multiple rules generate "
            "build/eur/src/main/func_X.o\n"
        )
        calls: list[list[str]] = []

        def fake_run(cmd, **kwargs):
            calls.append(cmd)
            if cmd[0] == "ninja":
                # First ninja invocation collides; the retry (after
                # self-heal) succeeds.
                if sum(1 for c in calls if c[0] == "ninja") == 1:
                    return self._completed(1, stderr=collision_err)
                return self._completed(0)
            # configure.py invocations (self-heal reconfigure, then the
            # best-effort resync after restoring the sibling).
            return self._completed(0)

        with mock.patch("fastmatch.subprocess.run", side_effect=fake_run):
            ok, err = fastmatch.ninja_compile_one(self.out_o, self.c_path, "eur")

        self.assertTrue(ok, err)
        self.assertEqual(err, "")
        # The sibling must exist again with the EXACT original bytes --
        # fastmatch never permanently touches a still-.s-routed entry.
        self.assertTrue(self.s_path.is_file())
        self.assertEqual(self.s_path.read_bytes(), self.s_original_bytes)
        # ninja ran twice (collide, then retry) and configure.py ran
        # twice (heal, then post-restore resync).
        ninja_calls = [c for c in calls if c[0] == "ninja"]
        configure_calls = [c for c in calls if "configure.py" in c[1]]
        self.assertEqual(len(ninja_calls), 2)
        self.assertEqual(len(configure_calls), 2)

    def test_does_not_self_heal_a_collision_reported_in_a_different_directory(self):
        # A multiple-rules fatal for a DIFFERENT MODULE's object can't be
        # fixed by touching anything in this candidate's own directory --
        # scanning/displacing here would be pure risk (disturbing another
        # lane's unrelated in-progress work) for zero chance of fixing the
        # reported collision. Must never even attempt the scan.
        (self.root / "src/overlay002").mkdir(parents=True)
        unrelated_err = (
            "ninja: error: build.ninja:1: multiple rules generate "
            "build/eur/src/overlay002/some_unrelated_func.o\n"
        )
        with mock.patch(
            "fastmatch.subprocess.run",
            return_value=self._completed(1, stderr=unrelated_err),
        ) as mocked_run:
            ok, err = fastmatch.ninja_compile_one(self.out_o, self.c_path, "eur")

        self.assertFalse(ok)
        self.assertIn("multiple rules generate", err)
        # Sibling must be untouched -- self-heal never triggered.
        self.assertEqual(self.s_path.read_bytes(), self.s_original_bytes)
        # Only the one initial ninja invocation -- no reconfigure/retry
        # was ever attempted for an out-of-scope collision.
        self.assertEqual(mocked_run.call_count, 1)

    def test_does_not_self_heal_an_unrelated_same_directory_c_with_no_stale_sibling(self):
        # A second .c file in the SAME directory that has ALREADY shipped
        # (no .s sibling left) must not be mistaken for a collision --
        # only .c files that still have a stale .s on disk count.
        (self.root / "src/main/func_shipped.c").write_text("void func_shipped(void) {}\n")
        collision_err = (
            "ninja: error: build.ninja:1: multiple rules generate "
            "build/eur/src/main/func_X.o\n"
        )
        with mock.patch(
            "fastmatch.subprocess.run",
            return_value=self._completed(1, stderr=collision_err),
        ):
            fastmatch.ninja_compile_one(self.out_o, self.c_path, "eur")

        # func_shipped has no .s sibling, so it must never be considered
        # for displacement -- nothing to assert on disk (it never had an
        # .s to begin with); this just confirms _find_stale_c_s_collisions
        # doesn't error out or fabricate work for a file with no sibling.
        self.assertFalse((self.root / "src/main/func_shipped.s").exists())

    def test_a_real_compile_error_is_not_treated_as_a_collision(self):
        with mock.patch(
            "fastmatch.subprocess.run",
            return_value=self._completed(
                1, stderr="src/main/func_X.c:3: declaration syntax error\n"
            ),
        ):
            ok, err = fastmatch.ninja_compile_one(self.out_o, self.c_path, "eur")

        self.assertFalse(ok)
        self.assertIn("declaration syntax error", err)
        self.assertEqual(self.s_path.read_bytes(), self.s_original_bytes)

    def test_reports_cleanly_if_reconfigure_fails_during_self_heal(self):
        collision_err = (
            "ninja: error: build.ninja:1: multiple rules generate "
            "build/eur/src/main/func_X.o\n"
        )

        def fake_run(cmd, **kwargs):
            if cmd[0] == "ninja":
                return self._completed(1, stderr=collision_err)
            return self._completed(1, stderr="configure.py: baserom missing\n")

        with mock.patch("fastmatch.subprocess.run", side_effect=fake_run):
            ok, err = fastmatch.ninja_compile_one(self.out_o, self.c_path, "eur")

        self.assertFalse(ok)
        self.assertIn("self-heal failed", err)
        # Even on this failure path, the sibling must still be restored.
        self.assertTrue(self.s_path.is_file())
        self.assertEqual(self.s_path.read_bytes(), self.s_original_bytes)

    def test_self_heals_when_a_different_in_flight_candidate_caused_the_collision(self):
        # q-fastmatch-selfheal-inflight: the ORIGINAL self-heal only
        # matched a collision against THIS candidate's own sibling, so
        # it failed outright -- naming the wrong file, no self-heal --
        # whenever a DIFFERENT in-flight candidate's .c/.s pair (in the
        # same directory) was what ninja's parser hit first. Independently
        # rediscovered by 4 of 5 worktree batches in cm-ov002-unknown-
        # sweep-2 (#1372), all with multiple candidates mid-draft in the
        # same module at once -- exactly what a parallel sweep batch does.
        other_c = self.root / "src/main/func_OTHER.c"
        other_c.write_text("void func_OTHER(void) {}\n")
        other_s = self.root / "src/main/func_OTHER.s"
        other_original_bytes = b"@ func_OTHER original .s bytes\r\n"
        other_s.write_bytes(other_original_bytes)

        # The reported collision names func_OTHER, NOT func_X (the
        # candidate actually being compiled) -- this is exactly the
        # shape the old code could never self-heal.
        collision_err = (
            "ninja: error: build.ninja:1: multiple rules generate "
            "build/eur/src/main/func_OTHER.o\n"
        )
        calls: list[list[str]] = []

        def fake_run(cmd, **kwargs):
            calls.append(cmd)
            if cmd[0] == "ninja":
                if sum(1 for c in calls if c[0] == "ninja") == 1:
                    return self._completed(1, stderr=collision_err)
                return self._completed(0)
            return self._completed(0)

        with mock.patch("fastmatch.subprocess.run", side_effect=fake_run):
            ok, err = fastmatch.ninja_compile_one(self.out_o, self.c_path, "eur")

        self.assertTrue(ok, err)
        # BOTH siblings must be restored byte-exact -- func_X (the
        # candidate under test) was never actually the problem, and
        # func_OTHER (the one actually colliding) must come back too.
        self.assertEqual(self.s_path.read_bytes(), self.s_original_bytes)
        self.assertEqual(other_s.read_bytes(), other_original_bytes)

    def test_healing_two_candidates_at_once_does_not_reintroduce_either_collision(self):
        # Sharper finding from the same sweep: healing candidates ONE AT
        # A TIME (restore + reconfigure per candidate) can reintroduce
        # the fatal for whichever OTHER candidate is still mid-draft --
        # fixing every stale pair in the directory together in one pass
        # (this test's real point) avoids that whack-a-mole failure mode
        # entirely. Three candidates mid-draft at once in the same
        # directory; the reported collision names only the middle one.
        other1_s = self.root / "src/main/func_A.s"
        other1_s.write_bytes(b"@ func_A\r\n")
        (self.root / "src/main/func_A.c").write_text("void func_A(void) {}\n")
        other2_s = self.root / "src/main/func_B.s"
        other2_s.write_bytes(b"@ func_B\r\n")
        (self.root / "src/main/func_B.c").write_text("void func_B(void) {}\n")

        collision_err = (
            "ninja: error: build.ninja:1: multiple rules generate "
            "build/eur/src/main/func_A.o\n"
        )
        calls: list[list[str]] = []

        def fake_run(cmd, **kwargs):
            calls.append(cmd)
            if cmd[0] == "ninja":
                if sum(1 for c in calls if c[0] == "ninja") == 1:
                    return self._completed(1, stderr=collision_err)
                return self._completed(0)
            return self._completed(0)

        with mock.patch("fastmatch.subprocess.run", side_effect=fake_run):
            ok, err = fastmatch.ninja_compile_one(self.out_o, self.c_path, "eur")

        self.assertTrue(ok, err)
        # A single retry succeeds because ALL THREE stale pairs (func_X,
        # func_A, func_B) were displaced together in one pass -- not
        # one at a time, which would leave 2 of 3 still colliding after
        # "fixing" the first.
        ninja_calls = [c for c in calls if c[0] == "ninja"]
        self.assertEqual(len(ninja_calls), 2)
        # Every sibling comes back byte-exact.
        self.assertEqual(self.s_path.read_bytes(), self.s_original_bytes)
        self.assertEqual(other1_s.read_bytes(), b"@ func_A\r\n")
        self.assertEqual(other2_s.read_bytes(), b"@ func_B\r\n")


class TestFindStaleCSCollisions(unittest.TestCase):
    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = Path(tmp.name)
        mock.patch("fastmatch.ROOT", self.root).start()
        self.addCleanup(mock.patch.stopall)
        (self.root / "src/main").mkdir(parents=True)

    def test_finds_every_stale_pair_in_the_directory(self):
        (self.root / "src/main/func_A.c").write_text("")
        (self.root / "src/main/func_A.s").write_bytes(b"")
        (self.root / "src/main/func_B.c").write_text("")
        (self.root / "src/main/func_B.s").write_bytes(b"")
        found = fastmatch._find_stale_c_s_collisions(self.root / "src/main/func_A.c")
        self.assertEqual(
            sorted(p.name for p in found), ["func_A.s", "func_B.s"],
        )

    def test_ignores_a_c_with_no_stale_sibling(self):
        (self.root / "src/main/func_shipped.c").write_text("")
        found = fastmatch._find_stale_c_s_collisions(self.root / "src/main/func_shipped.c")
        self.assertEqual(found, [])

    def test_ignores_a_different_directory(self):
        (self.root / "src/main/func_A.c").write_text("")
        (self.root / "src/main/func_A.s").write_bytes(b"")
        (self.root / "src/overlay002").mkdir(parents=True)
        (self.root / "src/overlay002/func_B.c").write_text("")
        (self.root / "src/overlay002/func_B.s").write_bytes(b"")
        found = fastmatch._find_stale_c_s_collisions(self.root / "src/main/func_A.c")
        self.assertEqual([p.name for p in found], ["func_A.s"])

    def test_handles_a_tiered_sibling_name(self):
        (self.root / "src/main/func_A.legacy.c").write_text("")
        (self.root / "src/main/func_A.s").write_bytes(b"")
        found = fastmatch._find_stale_c_s_collisions(self.root / "src/main/func_A.legacy.c")
        self.assertEqual([p.name for p in found], ["func_A.s"])


class TestDisplayPath(unittest.TestCase):
    """gap (c): match_one's gap_obj reporting assumed the resolved gap
    object is always inside ROOT (`.relative_to(ROOT)`), which raises
    ValueError for a user-supplied `--gap` path outside the tree."""

    def setUp(self):
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = Path(tmp.name)
        mock.patch("fastmatch.ROOT", self.root).start()
        self.addCleanup(mock.patch.stopall)

    def test_inside_root_returns_relative_path(self):
        inside = self.root / "build/eur/delinks/src/main/func_X.o"
        self.assertEqual(
            fastmatch._display_path(inside),
            str(Path("build/eur/delinks/src/main/func_X.o")),
        )

    def test_outside_root_falls_back_to_absolute_str_instead_of_raising(self):
        outside = self.root.parent / "elsewhere" / "func_X.o"
        result = fastmatch._display_path(outside)
        self.assertEqual(result, str(outside))


if __name__ == "__main__":
    unittest.main()
