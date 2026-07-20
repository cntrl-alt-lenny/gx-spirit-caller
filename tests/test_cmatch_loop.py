"""Tests for tools/cmatch_loop.py — the production c-match loop (brief 619).

Two tiers, like tests/test_m2c_feed.py's established pattern:
  - Pure logic (path derivation, classify(), delinks.txt TU-block surgery,
    state I/O, dossier rendering) — always run, no build required.
  - Real integration against THIS worktree's actual configured EUR build
    (dossier building, compile+fastmatch, the canary's temporary-gap
    round-trip) — guarded by skip conditions so the suite stays green on
    a host without the toolchain, but genuinely exercises the real
    pipeline when it's available (this repo's CI/dev environment).

Two of the integration tests pin real bugs found and fixed while writing
this tool (not hypothetical edge cases): retrieve_fewshot's `obj` being a
caller-supplied path, not something it resolves itself (an earlier
version passed "" and every dossier silently reported zero retrieved
siblings); and stage_source/unstage_source's original unconditional
delete-on-cleanup, which would have destroyed a pre-existing file's real
content instead of restoring it.
"""

from __future__ import annotations

import json
import shutil
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import cmatch_loop as cl  # noqa: E402

ROOT = cl.ROOT
_HAS_BUILD = (ROOT / "build.ninja").is_file() and (ROOT / "build" / "eur" / "delinks").is_dir()
_HAS_M2C = (ROOT / "tools" / "_vendor" / "m2c" / "m2c.py").is_file()
_HAS_OBJDUMP = shutil.which("arm-none-eabi-objdump") is not None
_HAS_TOOLCHAIN = _HAS_BUILD and _HAS_M2C and _HAS_OBJDUMP
_SKIP_REASON = ("needs a configured EUR build (python tools/configure.py eur && "
                "ninja delink), vendored m2c (tools/m2c_bootstrap.py), and "
                "arm-none-eabi-objdump on PATH")


# --------------------------------------------------------------------------- #
# Pure logic — path derivation
# --------------------------------------------------------------------------- #

class TestModuleDir(unittest.TestCase):
    def test_main(self):
        self.assertEqual(cl.module_dir("main"), "main")

    def test_overlay(self):
        self.assertEqual(cl.module_dir("ov002"), "overlay002")
        self.assertEqual(cl.module_dir("ov023"), "overlay023")


class TestSrcPath(unittest.TestCase):
    def test_eur_main_unprefixed(self):
        p = cl.src_path("eur", "main", "func_0201b6c4")
        self.assertEqual(p, ROOT / "src" / "main" / "func_0201b6c4.c")

    def test_eur_overlay(self):
        p = cl.src_path("eur", "ov002", "func_ov002_X")
        self.assertEqual(p, ROOT / "src" / "overlay002" / "func_ov002_X.c")

    def test_usa_region_prefixed(self):
        p = cl.src_path("usa", "ov002", "func_ov002_X")
        self.assertEqual(p, ROOT / "src" / "usa" / "overlay002" / "func_ov002_X.c")

    def test_custom_suffix(self):
        p = cl.src_path("eur", "main", "func_X", suffix=".legacy.c")
        self.assertEqual(p.name, "func_X.legacy.c")


class TestDelinksPathForModule(unittest.TestCase):
    def test_main(self):
        p = cl.delinks_path_for_module("eur", "main")
        self.assertEqual(p, ROOT / "config" / "eur" / "arm9" / "delinks.txt")

    def test_overlay(self):
        p = cl.delinks_path_for_module("eur", "ov002")
        self.assertEqual(p, ROOT / "config" / "eur" / "arm9" / "overlays" / "ov002" / "delinks.txt")

    def test_itcm_dtcm(self):
        self.assertEqual(cl.delinks_path_for_module("usa", "itcm"),
                          ROOT / "config" / "usa" / "arm9" / "itcm" / "delinks.txt")
        self.assertEqual(cl.delinks_path_for_module("jpn", "dtcm"),
                          ROOT / "config" / "jpn" / "arm9" / "dtcm" / "delinks.txt")


# --------------------------------------------------------------------------- #
# Pure logic — classify()
# --------------------------------------------------------------------------- #

class TestClassify(unittest.TestCase):
    def test_100_percent_ok_accepts(self):
        self.assertEqual(cl.classify(100.0, "ok", 1), "accept")

    def test_below_100_iterates_under_cap(self):
        self.assertEqual(cl.classify(99.99, "ok", 1), "iterate")
        self.assertEqual(cl.classify(0.0, "ok", 1), "iterate")

    def test_below_100_parks_at_cap(self):
        self.assertEqual(cl.classify(75.0, "ok", cl.ATTEMPT_CAP), "park")
        self.assertEqual(cl.classify(75.0, "ok", cl.ATTEMPT_CAP + 1), "park")

    def test_attempt_cap_is_3_per_r7_10(self):
        # r7-10: "attempt-cap = 3, not the peer's 28". Pinned explicitly
        # so a future change to this constant is a deliberate edit, not
        # an accidental one.
        self.assertEqual(cl.ATTEMPT_CAP, 3)

    def test_compile_error_iterates_then_parks(self):
        self.assertEqual(cl.classify(None, "compile_error", 1), "iterate")
        self.assertEqual(cl.classify(None, "compile_error", 3), "park")

    def test_not_in_gap_treated_same_as_compile_error(self):
        self.assertEqual(cl.classify(None, "not_in_gap", 1), "iterate")
        self.assertEqual(cl.classify(None, "not_in_gap", 3), "park")

    def test_ok_status_but_none_percent_iterates_not_crashes(self):
        # Shouldn't normally happen (fastmatch pairs status="ok" with a
        # real percent), but classify() must not raise if it does.
        self.assertEqual(cl.classify(None, "ok", 1), "iterate")

    def test_over_100_treated_as_accept(self):
        # Defensive: a hypothetical >100 (shouldn't occur, word-count
        # ratios cap at 100) still accepts rather than iterating forever.
        self.assertEqual(cl.classify(100.5, "ok", 1), "accept")


# --------------------------------------------------------------------------- #
# Pure logic — delinks.txt TU-block surgery
# --------------------------------------------------------------------------- #

class TestStripTuBlock(unittest.TestCase):
    def test_removes_header_and_sections(self):
        text = (
            "src/main/func_a.c:\n"
            "    complete\n"
            "    .text start:0x100 end:0x140\n"
            "src/main/func_b.c:\n"
            "    complete\n"
            "    .text start:0x140 end:0x180\n"
        )
        out = cl._strip_tu_block(text, "src/main/func_a.c")
        self.assertNotIn("func_a", out)
        self.assertIn("func_b", out)
        self.assertEqual(out, "src/main/func_b.c:\n    complete\n    .text start:0x140 end:0x180\n")

    def test_missing_header_raises(self):
        text = "src/main/func_b.c:\n    complete\n    .text start:0x140 end:0x180\n"
        with self.assertRaises(ValueError):
            cl._strip_tu_block(text, "src/main/func_a.c")

    def test_duplicate_header_raises(self):
        # Two TUs can't share a header line in real delinks.txt, but the
        # function should refuse rather than silently strip the wrong
        # (or both) blocks if it somehow happens.
        text = (
            "src/main/func_a.c:\n    complete\n    .text start:0x0 end:0x10\n"
            "src/main/func_a.c:\n    complete\n    .text start:0x20 end:0x30\n"
        )
        with self.assertRaises(ValueError):
            cl._strip_tu_block(text, "src/main/func_a.c")

    def test_preserves_unrelated_leading_module_map(self):
        text = (
            "    .text       start:0x0 end:0x200 kind:code\n"
            "\n"
            "src/main/func_a.c:\n"
            "    complete\n"
            "    .text start:0x100 end:0x140\n"
        )
        out = cl._strip_tu_block(text, "src/main/func_a.c")
        self.assertIn(".text       start:0x0 end:0x200", out)
        self.assertNotIn("func_a", out)

    def test_incomplete_tu_without_complete_marker_also_stripped(self):
        text = "src/main/func_a.c:\n    .text start:0x100 end:0x140\n"
        out = cl._strip_tu_block(text, "src/main/func_a.c")
        self.assertEqual(out, "")

    def test_real_eur_delinks_round_trip_on_a_snippet(self):
        # A real slice, copied verbatim from config/eur/arm9/delinks.txt
        # (func_0201b6c4's own TU block, the first canary function) —
        # confirms the regex matches ACTUAL project formatting, not just
        # a hand-simplified fixture.
        text = (
            "src/main/func_0201b690.c:\n"
            "    complete\n"
            "    .text start:0x0201b690 end:0x0201b6c4\n"
            "src/main/func_0201b6c4.c:\n"
            "    complete\n"
            "    .text start:0x0201b6c4 end:0x0201b6d4\n"
        )
        out = cl._strip_tu_block(text, "src/main/func_0201b6c4.c")
        self.assertNotIn("func_0201b6c4.c", out)
        self.assertIn("func_0201b690.c", out)


# --------------------------------------------------------------------------- #
# Pure logic — state persistence (queue re-injection)
# --------------------------------------------------------------------------- #

class TestStateIO(unittest.TestCase):
    def test_missing_file_returns_empty_state(self):
        with tempfile.TemporaryDirectory() as tmp:
            state = cl.load_state(Path(tmp) / "nope.json")
            self.assertEqual(state, {"version": 1, "candidates": {}})

    def test_corrupt_file_returns_empty_state_not_crash(self):
        with tempfile.TemporaryDirectory() as tmp:
            p = Path(tmp) / "state.json"
            p.write_text("{not valid json")
            state = cl.load_state(p)
            self.assertEqual(state, {"version": 1, "candidates": {}})

    def test_round_trip(self):
        with tempfile.TemporaryDirectory() as tmp:
            p = Path(tmp) / "sub" / "state.json"
            state = {"version": 1, "candidates": {"func_x": {"status": "iterate", "attempts": 2}}}
            cl.save_state(p, state)
            self.assertEqual(cl.load_state(p), state)

    def test_missing_keys_backfilled(self):
        with tempfile.TemporaryDirectory() as tmp:
            p = Path(tmp) / "state.json"
            p.write_text(json.dumps({"candidates": {"func_x": {}}}))
            state = cl.load_state(p)
            self.assertEqual(state["version"], 1)
            self.assertIn("func_x", state["candidates"])


class TestQueueReinjection(unittest.TestCase):
    """process_candidate's skip-if-resolved / retry-if-iterate behavior,
    exercised directly against `state` dicts (no compile needed — this
    tests the RE-QUEUE LOGIC, not fastmatch)."""

    def test_accepted_candidate_is_skipped(self):
        state = {"version": 1, "candidates": {
            "func_x": {"region": "eur", "status": "accepted", "attempts": 1,
                       "history": [], "last_match_percent": 100.0}}}
        result = cl.process_candidate("func_x", "eur", state)
        self.assertTrue(result["skipped"])
        self.assertEqual(result["classification"], "accepted")
        # attempts must NOT increment on a skip.
        self.assertEqual(state["candidates"]["func_x"]["attempts"], 1)

    def test_parked_candidate_is_skipped(self):
        state = {"version": 1, "candidates": {
            "func_x": {"region": "eur", "status": "parked", "attempts": 3,
                       "history": [], "last_match_percent": 42.0}}}
        result = cl.process_candidate("func_x", "eur", state)
        self.assertTrue(result["skipped"])
        self.assertEqual(result["classification"], "parked")
        self.assertEqual(state["candidates"]["func_x"]["attempts"], 3)

    def test_unresolvable_symbol_iterates_not_crashes(self):
        # A queued name that isn't in any symbols.txt (typo, wrong
        # region) must not raise -- it should record the failure and
        # iterate/park like any other non-accept outcome, since a
        # transient resolution issue shouldn't be indistinguishable from
        # a crash.
        state = {"version": 1, "candidates": {}}
        result = cl.process_candidate("func_totally_made_up_name_xyz", "eur", state)
        self.assertFalse(result["skipped"])
        self.assertIn(result["classification"], ("iterate", "parked"))
        self.assertEqual(state["candidates"]["func_totally_made_up_name_xyz"]["attempts"], 1)


# --------------------------------------------------------------------------- #
# Pure logic — Dossier rendering
# --------------------------------------------------------------------------- #

class TestDossierRenderMarkdown(unittest.TestCase):
    def test_empty_dossier_renders_all_placeholder_sections(self):
        d = cl.Dossier(func="func_x", region="eur", module="main")
        text = d.render_markdown()
        self.assertIn("func_x", text)
        self.assertIn("none retrieved", text)
        self.assertIn("no consolidated *_core.h", text)
        self.assertIn("draft failed: None", text)
        self.assertIn("not yet run", text)

    def test_fewshot_error_shown_distinct_from_empty(self):
        d = cl.Dossier(func="func_x", region="eur", module="main",
                        fewshot_error="FeedError: boom")
        text = d.render_markdown()
        self.assertIn("unavailable: FeedError: boom", text)
        self.assertNotIn("none retrieved", text)

    def test_populated_dossier_renders_each_component(self):
        d = cl.Dossier(
            func="func_x", region="eur", module="ov002",
            fewshot=[{"name": "func_y", "module": "main", "addr": 0x02001234}],
            struct_header_path="src/overlay002/ov002_core.h",
            m2c_skeleton="int func_x(void) { return 0; }",
            coercion_hits=[{"wall_id": "C-15", "confidence": "HIGH",
                             "recipe": "route via .legacy.c", "anchor": "codegen-walls.md#c-15"}],
        )
        text = d.render_markdown()
        self.assertIn("func_y", text)
        self.assertIn("0x2001234", text)
        self.assertIn("ov002_core.h", text)
        self.assertIn("int func_x(void)", text)
        self.assertIn("C-15", text)
        self.assertIn("route via .legacy.c", text)


# --------------------------------------------------------------------------- #
# Real integration — guarded on a configured EUR build
# --------------------------------------------------------------------------- #

@unittest.skipUnless(_HAS_TOOLCHAIN, _SKIP_REASON)
class TestCanaryRoundTrip(unittest.TestCase):
    """The brief's own mandatory CANARY, as an automated regression test:
    an already-matched function must reproduce its 100% match through
    the FULL pipeline (dossier build, temporary gap, compile+fastmatch,
    classify), and the tree must be byte-identical afterward."""

    def test_reproduces_a_known_match_and_restores_the_tree(self):
        func, region = "func_0201b6c4", "eur"
        c_path = cl.src_path(region, "main", func)
        original = c_path.read_text()
        delinks_path = cl.delinks_path_for_module(region, "main")
        delinks_before = delinks_path.read_text()

        with tempfile.TemporaryDirectory() as tmp:
            state_path = Path(tmp) / "canary_state.json"
            report = cl.run_canary([func], region, state_path=state_path)

        self.assertEqual(len(report["results"]), 1)
        result = report["results"][0]
        self.assertEqual(result["classification"], "accept")
        self.assertEqual(result["match_percent"], 100.0)
        self.assertEqual(c_path.read_text(), original)
        self.assertEqual(delinks_path.read_text(), delinks_before)

    def test_multi_module_canary_in_one_call(self):
        # main + ov002 in the same run -- the exact bug found & fixed
        # while building this (TemporaryGap originally assumed a single,
        # hard-coded delinks.txt path; ov002's TU headers live in a
        # DIFFERENT file and raised ValueError until fixed).
        funcs = ["func_0201b6c4", "func_ov002_0220448c"]
        region = "eur"
        with tempfile.TemporaryDirectory() as tmp:
            state_path = Path(tmp) / "canary_state.json"
            report = cl.run_canary(funcs, region, state_path=state_path)
        self.assertEqual(len(report["accepts"]), 2)
        self.assertEqual(set(report["accepts"]), set(funcs))


@unittest.skipUnless(_HAS_TOOLCHAIN, _SKIP_REASON)
class TestWrongSourceIteratesThenParks(unittest.TestCase):
    """A deliberately wrong (but compilable) draft for an otherwise-real
    candidate must NOT accept, must score a genuine partial match (not
    0% and not 100%), and must park after ATTEMPT_CAP attempts — the
    non-happy-path this tool exists to handle honestly, not just the
    canary's all-green case."""

    def test_wrong_constant_iterates_then_parks(self):
        func, region, module = "func_0201b6c4", "eur", "main"
        wrong_source = ("int func_0201b6c4(int x) {\n"
                         "    return 1 << (x - 0x67);\n"  # real is 0x66
                         "}\n")
        delinks_path = cl.delinks_path_for_module(region, module)
        c_path = cl.src_path(region, module, func)
        rel = str(c_path.relative_to(cl.ROOT))
        original = c_path.read_text()

        with tempfile.TemporaryDirectory() as tmp:
            state_path = Path(tmp) / "state.json"
            with cl.TemporaryGap({delinks_path: [rel]}):
                classifications = []
                for _ in range(cl.ATTEMPT_CAP + 1):
                    report = cl.run_loop(
                        [func], region, state_path=state_path,
                        source_overrides={func: wrong_source}, reuse_existing=False,
                    )
                    r = report["results"][0]
                    classifications.append(r["classification"])
                    if not r["skipped"]:
                        self.assertIsNotNone(r["match_percent"])
                        self.assertLess(r["match_percent"], 100.0)
                        self.assertGreater(r["match_percent"], 0.0)
                    # SAFETY: the real file must survive every single
                    # attempt, not just be restored at the very end —
                    # pins the stage_source/unstage_source fix.
                    self.assertEqual(c_path.read_text(), original)

        self.assertEqual(classifications[0], "iterate")
        self.assertEqual(classifications[cl.ATTEMPT_CAP - 1], "park")
        self.assertEqual(classifications[cl.ATTEMPT_CAP], "parked")
        self.assertEqual(c_path.read_text(), original)


@unittest.skipUnless(_HAS_TOOLCHAIN, _SKIP_REASON)
class TestStageUnstageSafety(unittest.TestCase):
    """Direct regression test for the fixed data-loss bug: overwriting an
    existing file must restore its ORIGINAL content on cleanup, never
    just delete it."""

    def test_overwriting_existing_file_restores_not_deletes(self):
        func, region, module = "func_0201b6c4", "eur", "main"
        c_path = cl.src_path(region, module, func)
        original = c_path.read_text()
        self.assertTrue(c_path.is_file())

        c_path2, created, previous = cl.stage_source(
            region, module, func, "/* clobber */\nint func_0201b6c4(int x){return 0;}\n",
            reuse_existing=False,
        )
        self.assertTrue(created)
        self.assertEqual(previous, original)
        self.assertNotEqual(c_path.read_text(), original)

        cl.unstage_source(c_path2, created, previous, region)
        self.assertEqual(c_path.read_text(), original)

    def test_reuse_existing_never_touches_the_file(self):
        func, region, module = "func_0201b6c4", "eur", "main"
        c_path = cl.src_path(region, module, func)
        original = c_path.read_text()

        c_path2, created, previous = cl.stage_source(
            region, module, func, "/* should never be written */\n",
            reuse_existing=True,
        )
        self.assertFalse(created)
        self.assertIsNone(previous)
        self.assertEqual(c_path.read_text(), original)
        cl.unstage_source(c_path2, created, previous, region)
        self.assertEqual(c_path.read_text(), original)

    def test_brand_new_file_is_deleted_on_cleanup(self):
        region, module = "eur", "main"
        func = "func_cmatch_loop_test_scratch_nonexistent"
        c_path = cl.src_path(region, module, func)
        self.assertFalse(c_path.is_file())
        try:
            c_path2, created, previous = cl.stage_source(
                region, module, func, "int f(void){return 0;}\n", reuse_existing=False)
            self.assertTrue(created)
            self.assertIsNone(previous)
            self.assertTrue(c_path.is_file())
            cl.unstage_source(c_path2, created, previous, region)
            self.assertFalse(c_path.is_file())
        finally:
            c_path.unlink(missing_ok=True)


@unittest.skipUnless(_HAS_TOOLCHAIN, _SKIP_REASON)
class TestBuildDossierRegression(unittest.TestCase):
    """Regression test for the retrieve_fewshot obj-path bug: a real,
    disassemblable function must retrieve a NON-empty few-shot list, not
    silently report none due to obj="" being disassembled instead of
    the real gap object."""

    def test_fewshot_is_nonempty_for_a_real_function(self):
        func, region, module = "func_ov002_0220448c", "eur", "ov002"
        delinks_path = cl.delinks_path_for_module(region, module)
        c_path = cl.src_path(region, module, func)
        rel = str(c_path.relative_to(cl.ROOT))

        with cl.TemporaryGap({delinks_path: [rel]}):
            dossier = cl.build_dossier(region, func, module)

        self.assertIsNone(dossier.fewshot_error)
        self.assertGreater(len(dossier.fewshot), 0)
        self.assertIsNotNone(dossier.struct_header_path)
        self.assertIsNotNone(dossier.m2c_skeleton)


# --------------------------------------------------------------------------- #
# Brief 620 — scale-validation fixes. Pure logic first.
# --------------------------------------------------------------------------- #

class TestPatchUnresolvedTypes(unittest.TestCase):
    """m2c's `?` unresolved-type placeholder is not valid C -- confirmed
    against a real mwcc run (declaration/expression syntax error, not a
    diff), not a hypothetical. patch_unresolved_types() is the targeted,
    narrow fix: only `?` in a declaration/call return-type position."""

    def test_patches_return_type_position(self):
        text = "? func_x(s32);\n"
        patched, count = cl.patch_unresolved_types(text)
        self.assertEqual(count, 1)
        self.assertEqual(patched, "int func_x(s32);\n")

    def test_patches_multiple_occurrences(self):
        text = "? func_a();\n? func_b(int);\nint func_c();\n"
        patched, count = cl.patch_unresolved_types(text)
        self.assertEqual(count, 2)
        self.assertNotIn("?", patched)

    def test_leaves_already_typed_declarations_alone(self):
        text = "s32 func_x();\nint func_y(void);\n"
        patched, count = cl.patch_unresolved_types(text)
        self.assertEqual(count, 0)
        self.assertEqual(patched, text)

    def test_does_not_touch_a_bare_question_mark_elsewhere(self):
        # A `?` not immediately followed by `ident(` (e.g. inside a
        # comment or a ternary m2c happened to emit) must survive --
        # the fix is deliberately narrow, not a blanket find-replace.
        text = "/* really? */\nint x = a ? b : c;\n"
        patched, count = cl.patch_unresolved_types(text)
        self.assertEqual(count, 0)
        self.assertEqual(patched, text)

    def test_real_captured_draft_all_three_patched(self):
        # Verbatim (minus body) from a real func_ov008_021b2200 m2c
        # draft captured while building this fix.
        text = (
            "? func_0202cca4(s32);                               /* extern */\n"
            "s32 func_0202cdf8();                                /* extern */\n"
            "? func_0202ce24();                                  /* extern */\n"
            "? func_0202d9a0();                                  /* extern */\n"
        )
        patched, count = cl.patch_unresolved_types(text)
        self.assertEqual(count, 3)
        self.assertEqual(patched.count("int func_"), 3)
        self.assertEqual(patched.count("s32 func_"), 1)


class TestSRoutedCompleteTu(unittest.TestCase):
    """Detects the c-match scenario (already-matched-but-.s) vs. a
    genuinely-unmatched candidate -- the distinction process_candidate
    uses to decide whether it needs a TemporaryGap window at all."""

    def _write_delinks(self, root: Path, entries: str) -> Path:
        arm9 = root / "arm9"
        arm9.mkdir(parents=True, exist_ok=True)
        p = arm9 / "delinks.txt"
        p.write_text(entries)
        return p

    def test_complete_s_routed_tu_detected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._write_delinks(root, (
                "    .text       start:0x0 end:0x40 kind:code\n"
                "\n"
                "src/main/func_x.s:\n"
                "    complete\n"
                "    .text start:0x0 end:0x40\n"
            ))
            orig_delinks_path_for_module = cl.delinks_path_for_module
            cl.delinks_path_for_module = lambda region, module: root / "arm9" / "delinks.txt"
            try:
                result = cl.s_routed_complete_tu("eur", "main", "func_x")
            finally:
                cl.delinks_path_for_module = orig_delinks_path_for_module
            self.assertEqual(result, "src/main/func_x.s")

    def test_incomplete_s_tu_not_detected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._write_delinks(root, (
                "    .text       start:0x0 end:0x40 kind:code\n"
                "\n"
                "src/main/func_x.s:\n"
                "    .text start:0x0 end:0x40\n"
            ))
            orig = cl.delinks_path_for_module
            cl.delinks_path_for_module = lambda region, module: root / "arm9" / "delinks.txt"
            try:
                result = cl.s_routed_complete_tu("eur", "main", "func_x")
            finally:
                cl.delinks_path_for_module = orig
            self.assertIsNone(result)

    def test_c_routed_tu_not_detected_as_s_routed(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._write_delinks(root, (
                "    .text       start:0x0 end:0x40 kind:code\n"
                "\n"
                "src/main/func_x.c:\n"
                "    complete\n"
                "    .text start:0x0 end:0x40\n"
            ))
            orig = cl.delinks_path_for_module
            cl.delinks_path_for_module = lambda region, module: root / "arm9" / "delinks.txt"
            try:
                result = cl.s_routed_complete_tu("eur", "main", "func_x")
            finally:
                cl.delinks_path_for_module = orig
            self.assertIsNone(result)

    def test_missing_delinks_file_returns_none(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            orig = cl.delinks_path_for_module
            cl.delinks_path_for_module = lambda region, module: root / "nope" / "delinks.txt"
            try:
                result = cl.s_routed_complete_tu("eur", "main", "func_x")
            finally:
                cl.delinks_path_for_module = orig
            self.assertIsNone(result)


class TestDisplaceSiblingS(unittest.TestCase):
    """The .s-sibling displacement that unblocks a real ninja conflict:
    writing a draft .c next to a still-present, still-.s-routed matched
    function produces `ninja: error: ... multiple rules generate` the
    SAME output .o -- confirmed on the very first real ov008 attempt,
    all 3 smoke-test candidates, not a hypothetical."""

    def test_displaces_and_restores(self):
        with tempfile.TemporaryDirectory() as tmp:
            s_path = Path(tmp) / "func_x.s"
            s_path.write_text("@ original .s content\n")
            backup = cl.displace_sibling_s(s_path)
            self.assertFalse(s_path.is_file())
            self.assertEqual(backup, "@ original .s content\n")
            cl.restore_sibling_s(s_path, backup)
            self.assertTrue(s_path.is_file())
            self.assertEqual(s_path.read_text(), "@ original .s content\n")

    def test_missing_s_file_returns_none_and_restore_is_a_noop(self):
        with tempfile.TemporaryDirectory() as tmp:
            s_path = Path(tmp) / "func_x.s"
            backup = cl.displace_sibling_s(s_path)
            self.assertIsNone(backup)
            cl.restore_sibling_s(s_path, backup)
            self.assertFalse(s_path.is_file())


class TestTemporaryGapEnterExceptionSafety(unittest.TestCase):
    """Regression test for a real bug: Python never calls __exit__ if
    __enter__ itself raises. An earlier TemporaryGap left every already-
    stripped delinks.txt permanently modified (no restore) when the
    `ninja delink` call inside __enter__ failed -- caught directly: a
    crashed real run left two real delinks.txt files (main's and
    ov002's) stripped and uncommitted until manually `git checkout`-
    restored. __enter__ must roll back what it already wrote before
    re-raising, exactly like __exit__ does on a later failure."""

    def test_failing_ninja_delink_restores_already_written_files(self):
        with tempfile.TemporaryDirectory() as tmp:
            p1 = Path(tmp) / "a.txt"
            p2 = Path(tmp) / "b.txt"
            p1.write_text("src/main/func_a.c:\n    complete\n    .text start:0x0 end:0x10\n")
            p2.write_text("src/main/func_b.c:\n    complete\n    .text start:0x0 end:0x10\n")
            gap = cl.TemporaryGap({p1: ["src/main/func_a.c"], p2: ["src/main/func_b.c"]})

            def _boom():
                raise RuntimeError("simulated ninja delink failure")

            orig_run = cl._run_ninja_delink
            cl._run_ninja_delink = _boom
            try:
                with self.assertRaises(RuntimeError):
                    gap.__enter__()
            finally:
                cl._run_ninja_delink = orig_run

            # Both files must be back to their ORIGINAL content, not left
            # stripped -- this is the exact state a crashed real run left
            # config/eur/arm9/delinks.txt and .../ov002/delinks.txt in
            # before this fix.
            self.assertIn("func_a.c", p1.read_text())
            self.assertIn("complete", p1.read_text())
            self.assertIn("func_b.c", p2.read_text())
            self.assertIn("complete", p2.read_text())

    def test_successful_enter_still_works_normally(self):
        # Non-regression: the happy path (real ninja delink succeeds)
        # must still strip-then-not-restore on __enter__ (restoration
        # only happens on __exit__ for a successful entry).
        with tempfile.TemporaryDirectory() as tmp:
            p1 = Path(tmp) / "a.txt"
            p1.write_text("src/main/func_a.c:\n    complete\n    .text start:0x0 end:0x10\n")
            gap = cl.TemporaryGap({p1: ["src/main/func_a.c"]})

            orig_run = cl._run_ninja_delink
            cl._run_ninja_delink = lambda: None
            try:
                gap.__enter__()
                self.assertNotIn("func_a.c", p1.read_text())
                gap.__exit__(None, None, None)
                self.assertIn("func_a.c", p1.read_text())
            finally:
                cl._run_ninja_delink = orig_run


@unittest.skipUnless(_HAS_TOOLCHAIN, _SKIP_REASON)
class TestCMatchScenarioIntegration(unittest.TestCase):
    """End-to-end: an already-.s-matched, real ov008 candidate (the
    scenario brief 620 exists to drain) must get a REAL attempt from
    process_candidate, not the "dossier produced no compilable source" /
    ninja "multiple rules" errors this scenario hit on first real use.
    Confirms the .s-displacement + include-prepending + unresolved-type-
    patching fixes compose correctly against the real toolchain, and
    that the tree is left exactly as found.

    021acfa0 is deliberately a documented HARD candidate (ov008_core.h:
    a permuter-probed byte-combine-builder wall, brief 403), not a soft
    one picked to make this test look good -- its raw m2c draft, even
    patched, genuinely fails to compile ("not a struct/union/class",
    confirmed against real mwcc: m2c mis-models one of its fields as a
    struct member). That is a REAL attempt (the compiler ran against
    this function's own code and gave a real diagnostic) exactly as
    much as a numeric sub-100% score would be -- both are "iterate",
    both leave match_percent readable-or-None correctly; only the two
    INFRA-error strings below (this scenario's actual failure mode
    before the brief-620 fixes) would mean the plumbing itself is
    broken again."""

    def test_ov008_candidate_gets_a_real_score_and_tree_is_restored(self):
        func, region, module = "func_ov008_021acfa0", "eur", "ov008"
        s_path = cl.src_path(region, module, func, suffix=".s")
        c_path = cl.src_path(region, module, func)
        delinks_path = cl.delinks_path_for_module(region, module)
        original_s = s_path.read_text()
        original_delinks = delinks_path.read_text()
        self.assertTrue(s_path.is_file())
        self.assertFalse(c_path.is_file())

        with tempfile.TemporaryDirectory() as tmp:
            state_path = Path(tmp) / "state.json"
            state = cl.load_state(state_path)
            result = cl.process_candidate(func, region, state)

        # The scenario-detection + .s-displacement + include/type fixes
        # must together produce a REAL attempt, not an infra error --
        # "iterate" (or even "accept", if m2c's draft happens to land
        # it) is a real outcome; "no compilable source" / a ninja
        # subprocess error string is not.
        self.assertIn(result["classification"], ("accept", "iterate", "park"))
        detail = result.get("detail") or ""
        self.assertNotIn("multiple rules", detail)
        self.assertNotIn("no compilable source", detail)
        # match_percent is None exactly when compilation itself failed
        # (compile_and_fastmatch's documented contract, cmatch_loop.py's
        # own classify() docstring: "covers a genuine low/partial match,
        # a compile error, ... alike") -- a real compiler diagnostic
        # against 021acfa0's own code, not a missing score. Either way
        # there must be a non-empty reason on record.
        if result["match_percent"] is None:
            self.assertTrue(detail.strip(),
                             "no match_percent AND no detail explaining why")
        else:
            self.assertGreaterEqual(result["match_percent"], 0.0)

        # Tree must be back exactly as found: unaccepted (this is a
        # fresh state, ATTEMPT_CAP not hit) means iterate, so the .s
        # sibling and delinks.txt must both be restored.
        if result["classification"] != "accept":
            self.assertTrue(s_path.is_file())
            self.assertEqual(s_path.read_text(), original_s)
            self.assertEqual(delinks_path.read_text(), original_delinks)
            self.assertFalse(c_path.is_file())


if __name__ == "__main__":
    unittest.main()
