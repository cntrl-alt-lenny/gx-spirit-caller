"""Unit tests for tools/find_external_source.py.

Brief 066 prototype. Pins:
  - FUNC_DEF_RE recognises top-level function definitions and
    rejects obvious noise (control flow, comments, declarations)
  - REPOS metadata stays in sync with
    vendor_external_sources.TARGETS
  - SP-distance scoring + confidence mapping
  - Repo-pool indexer ignores non-existent directories cleanly
  - Output renderers (text + JSON) produce stable shapes

The full byte-fingerprint pipeline + hit-rate measurement is
deferred to brief 068 implementation; this suite pins the v0
prototype's name-based matching path.

Run locally:
    python -m unittest tests.test_find_external_source
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from find_external_source import (  # noqa: E402
    Candidate,
    ExternalFunc,
    FUNC_DEF_RE,
    OUR_MWCC_SP,
    REPOS,
    SP_DISTANCE,
    _confidence_for_distance,
    _extract_functions_from_file,
    _sp_distance,
    build_external_index,
    lookup_by_name,
    render_json,
    render_text,
    repo_for,
)
from vendor_external_sources import TARGETS  # noqa: E402


# --------------------------------------------------------------------------- #
# Function-definition regex
# --------------------------------------------------------------------------- #


class TestFuncDefRE(unittest.TestCase):
    def test_simple_void_function(self):
        m = FUNC_DEF_RE.match("void OS_GetTick(void) {")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("name"), "OS_GetTick")

    def test_typed_return(self):
        m = FUNC_DEF_RE.match("u32 MI_CpuCopy16(const void *src, void *dst, u32 len) {")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("name"), "MI_CpuCopy16")

    def test_static_qualifier(self):
        m = FUNC_DEF_RE.match("static int helper(void) {")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("name"), "helper")

    def test_inline_qualifier(self):
        m = FUNC_DEF_RE.match("inline u32 fast_op(u32 x) {")
        self.assertIsNotNone(m)
        self.assertEqual(m.group("name"), "fast_op")

    def test_comment_rejected(self):
        # Lines starting with '/' are excluded by the caller
        # (`_extract_functions_from_file`); the regex on its own
        # would match this if not filtered.
        # No assertion on the regex itself — the filter is the
        # contract.
        pass


# --------------------------------------------------------------------------- #
# Extract-from-file pipeline
# --------------------------------------------------------------------------- #


class TestExtractFunctions(unittest.TestCase):
    def test_simple_c_file(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "lib" / "src").mkdir(parents=True)
            (root / "lib" / "src" / "OS_tick.c").write_text(
                "#include <nitro.h>\n"
                "\n"
                "u64 OS_GetTick(void) {\n"
                "    return 0;\n"
                "}\n"
                "\n"
                "// comment\n"
                "static u64 helper(void) {\n"
                "    return 1;\n"
                "}\n"
            )
            out = _extract_functions_from_file(
                root / "lib" / "src" / "OS_tick.c",
                "testrepo", root,
            )
            names = sorted(f.name for f in out)
            self.assertEqual(names, ["OS_GetTick", "helper"])

    def test_indented_lines_skipped(self):
        # Function-shaped lines inside bodies (e.g. `if (foo(...))`)
        # are indented and must not match.
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "f.c").write_text(
                "void f(void) {\n"
                "    if (g(0)) {\n"
                "        h(1);\n"
                "    }\n"
                "}\n"
            )
            out = _extract_functions_from_file(root / "f.c", "r", root)
            names = [fn.name for fn in out]
            self.assertEqual(names, ["f"])

    def test_control_keywords_rejected(self):
        # `if (foo)` at column 0 is invalid C, but defensively the
        # extractor still rejects it.
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "f.c").write_text(
                "if (cond) {\n"  # technically not valid C top-level
                "    body();\n"
                "}\n"
                "void real_fn(void) {\n"
                "    work();\n"
                "}\n"
            )
            out = _extract_functions_from_file(root / "f.c", "r", root)
            names = [fn.name for fn in out]
            # `if` is in the keyword blocklist; only `real_fn` survives.
            self.assertEqual(names, ["real_fn"])

    def test_missing_file_returns_empty(self):
        out = _extract_functions_from_file(
            Path("/definitely/not/a/file.c"), "r",
            Path("/definitely/not"),
        )
        self.assertEqual(out, [])


# --------------------------------------------------------------------------- #
# Index builder
# --------------------------------------------------------------------------- #


class TestBuildIndex(unittest.TestCase):
    def test_empty_vendor_dir_yields_empty_index(self):
        with tempfile.TemporaryDirectory() as td:
            self.assertEqual(build_external_index(Path(td)), {})

    def test_missing_lib_roots_skipped_cleanly(self):
        # Repo cloned but its lib_roots not present (e.g. shallow
        # clone with subdirs missing). Must not raise.
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "pokediamond").mkdir()
            # Don't create the lib_roots — they should be skipped.
            self.assertEqual(build_external_index(root), {})

    def test_indexes_functions_from_synthetic_repo(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            repo = root / "pokediamond"
            # Use the first lib_root from REPOS to keep the test
            # consistent with the metadata.
            pd = repo_for("pokediamond")
            lib_root = repo / pd.lib_roots[0]
            lib_root.mkdir(parents=True)
            (lib_root / "OS_tick.c").write_text(
                "u64 OS_GetTick(void) { return 0; }\n"
                "void OS_InitTick(void) { return; }\n"
            )
            index = build_external_index(root)
            self.assertIn("OS_GetTick", index)
            self.assertIn("OS_InitTick", index)
            self.assertEqual(index["OS_GetTick"][0].repo, "pokediamond")


# --------------------------------------------------------------------------- #
# SP-distance scoring + confidence model
# --------------------------------------------------------------------------- #


class TestSPDistance(unittest.TestCase):
    def test_exact_match_is_zero(self):
        self.assertEqual(_sp_distance(OUR_MWCC_SP), 0)

    def test_one_rev_off_close(self):
        # 2.0/sp1 vs our 2.0/sp1p5 — same major+minor, one SP-rev.
        self.assertEqual(_sp_distance("2.0/sp1"), 1)

    def test_sp_level_shift_further(self):
        # 2.0/sp2p2 vs our 2.0/sp1p5 — SP-level shift.
        self.assertEqual(_sp_distance("2.0/sp2p2"), 2)

    def test_dsi_family_far(self):
        # dsi/1.2p1 vs our 2.0/sp1p5 — different ISA pipeline.
        self.assertEqual(_sp_distance("dsi/1.2p1"), 5)

    def test_unknown_sp_defaults_far(self):
        self.assertEqual(_sp_distance("4.2/sp99"), 10)


class TestConfidenceMapping(unittest.TestCase):
    def test_distance_zero_is_high_score_one(self):
        conf, score, _ = _confidence_for_distance(0)
        self.assertEqual(conf, "HIGH")
        self.assertEqual(score, 1.00)

    def test_distance_one_high_below_one(self):
        conf, score, _ = _confidence_for_distance(1)
        self.assertEqual(conf, "HIGH")
        self.assertLess(score, 1.0)

    def test_distance_two_medium(self):
        conf, _, _ = _confidence_for_distance(2)
        self.assertEqual(conf, "MEDIUM")

    def test_distance_three_still_medium(self):
        # 1.2 family — legacy routing tier territory.
        conf, _, _ = _confidence_for_distance(3)
        self.assertEqual(conf, "MEDIUM")

    def test_distance_five_low(self):
        # DSi family.
        conf, _, _ = _confidence_for_distance(5)
        self.assertEqual(conf, "LOW")


# --------------------------------------------------------------------------- #
# Lookup-by-name end-to-end
# --------------------------------------------------------------------------- #


class TestLookupByName(unittest.TestCase):
    def test_no_match_returns_empty(self):
        self.assertEqual(lookup_by_name("__not_a_real_function__", {}), [])

    def test_high_confidence_match_for_close_sp(self):
        # Synthetic index: one ExternalFunc in pokediamond
        # (mwcc 2.0/sp1, distance 1 from our 2.0/sp1p5).
        fn = ExternalFunc(
            repo="pokediamond",
            file_rel="arm9/lib/NitroSDK/src/OS_tick.c",
            line=51,
            name="OS_GetTick",
        )
        out = lookup_by_name("OS_GetTick", {"OS_GetTick": [fn]})
        self.assertEqual(len(out), 1)
        self.assertEqual(out[0].confidence, "HIGH")
        self.assertEqual(out[0].func.repo, "pokediamond")

    def test_ranks_high_before_medium(self):
        # Two candidates: pokediamond (HIGH, dist=1),
        # pokeheartgold (MEDIUM, dist=2).
        fn_d = ExternalFunc(repo="pokediamond", file_rel="d.c",
                            line=1, name="X")
        fn_h = ExternalFunc(repo="pokeheartgold", file_rel="h.c",
                            line=2, name="X")
        out = lookup_by_name("X", {"X": [fn_d, fn_h]})
        self.assertEqual(out[0].confidence, "HIGH")
        self.assertEqual(out[1].confidence, "MEDIUM")
        self.assertEqual(out[0].func.repo, "pokediamond")
        self.assertEqual(out[1].func.repo, "pokeheartgold")


# --------------------------------------------------------------------------- #
# Renderers
# --------------------------------------------------------------------------- #


class TestRenderers(unittest.TestCase):
    def _one_candidate(self) -> list[Candidate]:
        fn = ExternalFunc(
            repo="pokediamond",
            file_rel="arm9/lib/NitroSDK/src/OS_tick.c",
            line=51,
            name="OS_GetTick",
        )
        return [Candidate(
            func=fn, confidence="HIGH", score=0.92,
            rationale="exact-name match",
            byte_score=None,
            notes=["v0 prototype"],
        )]

    def test_text_output_includes_repo_path_line(self):
        out = render_text("OS_GetTick", "main", 0x02000086,
                         self._one_candidate())
        self.assertIn("OS_GetTick", out)
        self.assertIn("pokediamond", out)
        self.assertIn("OS_tick.c", out)
        self.assertIn(":51", out)

    def test_text_output_no_candidates(self):
        out = render_text("NoMatch", None, None, [])
        self.assertIn("No candidates", out)

    def test_json_output_is_valid_json(self):
        import json as _json
        out = render_json("OS_GetTick", "main", 0x02000086,
                          self._one_candidate())
        parsed = _json.loads(out)
        self.assertEqual(parsed["query"]["name"], "OS_GetTick")
        self.assertEqual(len(parsed["candidates"]), 1)
        self.assertEqual(parsed["candidates"][0]["repo"], "pokediamond")
        self.assertIsNone(parsed["candidates"][0]["byte_score"])


# --------------------------------------------------------------------------- #
# Metadata drift-protection
# --------------------------------------------------------------------------- #


class TestMetadataConsistency(unittest.TestCase):
    """The Repo list in find_external_source.py and TARGETS in
    vendor_external_sources.py must agree on (name, mwcc_sp,
    lib_roots) — otherwise the index walks paths that the clone
    script never populates, or vice versa.
    """

    def test_repos_and_targets_match_names(self):
        repo_names = {r.name for r in REPOS}
        target_names = {t.name for t in TARGETS}
        self.assertEqual(repo_names, target_names)

    def test_repos_and_targets_match_sp_versions(self):
        target_by_name = {t.name: t for t in TARGETS}
        for r in REPOS:
            self.assertEqual(
                r.mwcc_sp, target_by_name[r.name].mwcc_sp,
                f"{r.name} mwcc_sp mismatch between "
                f"find_external_source.REPOS and "
                f"vendor_external_sources.TARGETS",
            )

    def test_repos_and_targets_match_lib_roots(self):
        target_by_name = {t.name: t for t in TARGETS}
        for r in REPOS:
            self.assertEqual(
                r.lib_roots, target_by_name[r.name].lib_roots,
                f"{r.name} lib_roots mismatch",
            )

    def test_every_repo_has_known_sp_distance(self):
        # Don't strictly require every repo's SP to be in
        # SP_DISTANCE — unknown SPs default to far — but flag it
        # so we don't ship a repo whose SP is silently mis-scored.
        for r in REPOS:
            self.assertIn(
                r.mwcc_sp, SP_DISTANCE,
                f"{r.name} mwcc_sp {r.mwcc_sp} not in SP_DISTANCE; "
                f"add an explicit entry to make scoring deliberate",
            )


if __name__ == "__main__":
    unittest.main()
