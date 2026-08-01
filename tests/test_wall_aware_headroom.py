"""Tests for tools/wall_aware_headroom.py (brief 651 rework).

Brief 640 (docs/research/brief-640-wall-audit.md) found the previous
version's regex treated ANY `[CP]-\\d+` citation, and the blanket
GLOBAL_ASM/brief-294/302 cohort stamp, as confirmed-permanent evidence.
It is not: C-NN is the taxonomy's OWN "coercible with knowledge" bucket,
and the cohort stamp is a bulk stamp from a mechanical carving tool, not
per-function proof. These tests pin the corrected 4-way classification.
"""
from __future__ import annotations
import io
import sys
import tempfile
import unittest
from contextlib import redirect_stderr
from pathlib import Path
from unittest import mock
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))
import wall_aware_headroom as w  # noqa: E402


class ClassifyText(unittest.TestCase):
    def test_p_series_citation_is_permanent(self):
        c = w.classify_text("; P-16 dispatcher residue\n.text\n")
        self.assertEqual(c.kind, "permanent")
        self.assertEqual(c.codes, ["P-16"])

    def test_c_series_citation_is_coercible_not_permanent(self):
        # the core brief-651 fix: C-NN is a KNOWN LEVER, not a wall.
        c = w.classify_text("; func: C-34 candidate, pool-literal CSE\n.text\n")
        self.assertEqual(c.kind, "coercible")
        self.assertEqual(c.codes, ["C-34"])

    def test_cohort_stamp_alone_is_unknown_not_permanent(self):
        # the other core brief-651 fix: the asm_escape.py generate_whole()
        # boilerplate is a bulk stamp, not per-function evidence.
        body = (
            "; func_ov002_021aa4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):\n"
            "; the original disassembly emitted verbatim as a byte-exact mwasm TU.\n"
            "; For reg-alloc-walled functions with no C match (brief 294 endgame).\n"
            ".text\n"
        )
        c = w.classify_text(body)
        self.assertEqual(c.kind, "unknown")
        self.assertEqual(c.codes, [])

    def test_prose_wall_with_no_code_is_unknown_not_permanent(self):
        c = w.classify_text("; this is a genuine reg-alloc wall, no C match found\n.text\n")
        self.assertEqual(c.kind, "unknown")

    def test_plain_no_marker_is_no_marker(self):
        c = w.classify_text("; ordinary leaf accessor\n.text\nfunc:\n bx lr\n")
        self.assertEqual(c.kind, "no_marker")

    def test_coprocessor_register_names_not_mistaken_for_citation(self):
        # c0/p15 (no dash) are registers, not taxonomy cites.
        c = w.classify_text("; unconditional cache op\n.text\n mrc p15, 0, r0, c0, c0\n")
        # still correctly permanent -- but via the ISA-impossible instruction
        # check, NOT a false-positive taxonomy citation match.
        self.assertEqual(c.kind, "permanent")
        self.assertEqual(c.codes, [])  # no taxonomy code fired, just the mnemonic

    def test_unconditional_mcr_is_permanent(self):
        c = w.classify_text(".text\nfunc:\n mcr p15, 0, r0, c7, c10, 4\n bx lr\n")
        self.assertEqual(c.kind, "permanent")

    def test_unconditional_msr_is_permanent(self):
        c = w.classify_text(".text\nfunc:\n msr cpsr_c, r0\n bx lr\n")
        self.assertEqual(c.kind, "permanent")

    def test_conditional_mcr_is_not_isa_impossible(self):
        # asm_escape.py's _DATA_AS_CODE_RE (brief 488) established the
        # CONDITIONAL form is always disguised data in this game, never a
        # real privileged instruction -- must not trip the permanent check.
        c = w.classify_text(".text\nfunc:\n mcrls p15, 0, r0, c7, c10, 4\n bx lr\n")
        self.assertNotEqual(c.kind, "permanent")

    def test_conditional_svc_is_not_isa_impossible(self):
        c = w.classify_text(".text\nfunc:\n svclt 0x00bfc0c0\n bx lr\n")
        self.assertNotEqual(c.kind, "permanent")

    def test_isa_impossible_takes_priority_over_coercible_citation(self):
        body = "; C-34 candidate\n.text\nfunc:\n mrs r0, cpsr\n"
        c = w.classify_text(body)
        self.assertEqual(c.kind, "permanent")

    def test_p_citation_takes_priority_over_c_citation(self):
        # a file citing both (not currently observed, but should resolve
        # deterministically): permanent wins.
        c = w.classify_text("; see C-34 and P-11 both apply here\n.text\n")
        self.assertEqual(c.kind, "permanent")
        self.assertEqual(c.codes, ["P-11"])

    def test_multiple_c_codes_all_reported(self):
        c = w.classify_text("; stacks C-23 and C-34 (routing trilemma)\n.text\n")
        self.assertEqual(c.kind, "coercible")
        self.assertEqual(c.codes, ["C-23", "C-34"])


class MainFailClosed(unittest.TestCase):
    def test_empty_source_tree_fails_instead_of_reporting_zero(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            err = io.StringIO()
            with mock.patch.object(w, "ROOT", root), redirect_stderr(err):
                rc = w.main(["wall_aware_headroom.py", "--json"])

            self.assertEqual(rc, 2)
            self.assertIn("headroom was not measured", err.getvalue())


class ClassifyModule(unittest.TestCase):
    """q-itcm-feeder-fix: the previous `_MODULE_RE` was a single regex
    with a `[^/]+` (exactly one path segment) assumption baked in, which
    silently rejected every `src/main/itcm/*.s` file -- an extra path
    segment -- even though the linker/progress tooling already saw
    those files fine. _classify_module replaces it with real path-part
    classification."""

    def test_main(self):
        self.assertEqual(w._classify_module("src/main/func_X.s"), "main")

    def test_overlay(self):
        self.assertEqual(w._classify_module("src/overlay002/func_ov002_X.s"), "overlay002")

    def test_itcm_real_path_shape(self):
        # The exact real file this bug hid: q-itcm-reach's diagnosed
        # root cause, itcm-reachability.md's own cited example.
        self.assertEqual(w._classify_module("src/main/itcm/func_01ff8400.s"), "itcm")

    def test_dtcm_is_not_classified(self):
        # DTCM is confirmed data-only in every region (zero kind:function
        # symbols.txt entries) -- it must never contribute a function
        # candidate row, so it's deliberately absent from the classifier
        # entirely (not just filtered out downstream).
        self.assertIsNone(w._classify_module("src/main/dtcm/func_X.s"))

    def test_region_port_paths_not_classified(self):
        # src/usa|jpn/ are region ports of the EUR baseline -- this tool
        # is EUR-only by design (its own module docstring).
        self.assertIsNone(w._classify_module("src/usa/main/func_X.s"))
        self.assertIsNone(w._classify_module("src/jpn/overlay002/func_ov002_X.s"))

    def test_non_s_extension_not_classified(self):
        self.assertIsNone(w._classify_module("src/main/itcm/func_01ff8400.legacy.c"))

    def test_too_many_segments_not_classified(self):
        # A hypothetical deeper nesting must not be silently misclassified
        # into "main" or "itcm" -- only the two real shapes match.
        self.assertIsNone(w._classify_module("src/main/itcm/nested/func_X.s"))
        self.assertIsNone(w._classify_module("src/overlay002/nested/func_X.s"))

    def test_source_module_matches_classify_module_for_itcm(self):
        self.assertEqual(w._source_module("src/main/itcm/func_01ff8400.s"), "itcm")


class ScanCandidateAccounting(unittest.TestCase):
    """candidate = coercible + unknown + no_marker (everything not permanent)."""

    def test_candidate_excludes_only_permanent(self):
        import tempfile
        from unittest import mock

        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "config").mkdir()
            (root / "src" / "main").mkdir(parents=True)
            delinks = root / "config" / "delinks.txt"
            files = {
                "src/main/permanent.s": "; P-1 permanent\n.text\n",
                "src/main/coercible.s": "; C-34 candidate\n.text\n",
                "src/main/unknown.s": "; GLOBAL_ASM endgame, brief 302\n.text\n",
                "src/main/plain.s": ".text\nfunc:\n bx lr\n",
            }
            delinks_lines = []
            for rel, body in files.items():
                p = root / rel
                p.write_text(body, encoding="utf-8")
                delinks_lines.append(f"{rel}:\n    complete\n")
            delinks.write_text("\n".join(delinks_lines), encoding="utf-8")

            with mock.patch.object(w, "ROOT", root):
                per = w.scan()

        d = per["main"]
        self.assertEqual(d["total"], 4)
        self.assertEqual(d["permanent"], 1)
        self.assertEqual(d["coercible"], 1)
        self.assertEqual(d["unknown"], 1)
        self.assertEqual(d["no_marker"], 1)
        self.assertEqual(d["candidate"], 3)  # everything except permanent
        self.assertEqual(d["coercible_files"], [{
            "path": "src/main/coercible.s",
            "addr": None,
            "text_size": 0,
            "codes": ["C-34"],
        }])
        self.assertEqual(d["unknown_files"], [{
            "path": "src/main/unknown.s",
            "addr": None,
            "text_size": 0,
        }])
        self.assertEqual(d["no_marker_files"], [{
            "path": "src/main/plain.s",
            "addr": None,
            "text_size": 0,
        }])

    def test_json_module_backward_compat_keys(self):
        d = w._new_module_entry()
        d["total"] = 1
        d["no_marker"] = 1
        d["candidate"] = 1
        d["no_marker_files"] = [{"path": "src/main/x.s", "addr": None, "text_size": None}]
        out = w._json_module(d)
        self.assertEqual(out["convertible"], 1)
        self.assertEqual(out["convertible_files"], d["no_marker_files"])

    def test_scan_adds_address_and_text_size_and_filters(self):
        import tempfile
        from unittest import mock

        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "config").mkdir()
            (root / "src" / "main").mkdir(parents=True)
            small = root / "src/main/func_02000010.s"
            large = root / "src/main/func_02000020.s"
            small.write_text("; C-34\n.text\n", encoding="utf-8")
            large.write_text("; C-34\n.text\n", encoding="utf-8")
            (root / "config" / "delinks.txt").write_text(
                "src/main/func_02000010.s:\n"
                "    .text start:0x10 end:0x30\n\n"
                "src/main/func_02000020.s:\n"
                "    .text start:0x20 end:0x140\n",
                encoding="utf-8",
            )
            with mock.patch.object(w, "ROOT", root):
                per = w.scan(max_size=0x20)

        self.assertEqual(per["main"]["candidate"], 1)
        self.assertEqual(per["main"]["coercible_files"], [{
            "path": "src/main/func_02000010.s",
            "addr": "0x02000010",
            "text_size": 0x20,
            "codes": ["C-34"],
        }])

    def test_scan_excludes_attempted_module_address(self):
        import tempfile
        from unittest import mock

        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "config").mkdir()
            (root / "src" / "main").mkdir(parents=True)
            (root / "src" / "overlay002").mkdir(parents=True)
            (root / "src/main/func_02000010.s").write_text(
                "; C-34\n.text\n", encoding="utf-8"
            )
            (root / "src/main/func_02000020.s").write_text(
                "; C-34\n.text\n", encoding="utf-8"
            )
            (root / "src/overlay002/func_ov002_02100010.s").write_text(
                "; C-34\n.text\n", encoding="utf-8"
            )
            (root / "config/delinks.txt").write_text(
                "src/main/func_02000010.s:\n    complete\n\n"
                "src/main/func_02000020.s:\n    complete\n",
                encoding="utf-8",
            )
            with (root / "config/delinks.txt").open("a", encoding="utf-8") as stream:
                stream.write("\nsrc/overlay002/func_ov002_02100010.s:\n    complete\n")
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            ledger.parent.mkdir(parents=True)
            ledger.write_text(
                "addr\tmodule\ttext_size\ttier\tshape\tresult\tmatch_pct\tpark_class\tbrief\n"
                "0x02000010\tmain\t0\tdefault\tleaf\tparked\t50\tC-34\tbrief-1\n",
                encoding="utf-8",
            )
            ledger.write_text(
                ledger.read_text(encoding="utf-8")
                + "0x02100010\tov002\t0\tdefault\tleaf\tparked\t50\tC-34\tbrief-1\n",
                encoding="utf-8",
            )
            with mock.patch.object(w, "ROOT", root):
                per = w.scan(exclude_attempted=True)

        self.assertEqual(per["main"]["candidate"], 1)
        self.assertEqual(per["main"]["excluded_attempted"], 1)
        self.assertEqual(
            per["main"]["coercible_files"][0]["addr"], "0x02000020"
        )
        self.assertEqual(per["overlay002"]["candidate"], 0)
        self.assertEqual(per["overlay002"]["excluded_attempted"], 1)

    def test_scan_filters_by_address_range(self):
        import tempfile
        from unittest import mock

        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "config").mkdir()
            (root / "src" / "main").mkdir(parents=True)
            for addr in (0x02000010, 0x02000020, 0x02000030):
                rel = f"src/main/func_{addr:08x}.s"
                (root / rel).write_text("; C-34\n.text\n", encoding="utf-8")
            (root / "config" / "delinks.txt").write_text(
                "\n".join(
                    f"src/main/func_{addr:08x}.s:\n    .text start:0x{addr:x} end:0x{addr + 0x10:x}"
                    for addr in (0x02000010, 0x02000020, 0x02000030)
                ),
                encoding="utf-8",
            )
            with mock.patch.object(w, "ROOT", root):
                per = w.scan(min_addr=0x02000020, max_addr=0x02000020)

        self.assertEqual(per["main"]["candidate"], 1)
        self.assertEqual(
            per["main"]["coercible_files"][0]["addr"], "0x02000020"
        )


class ScanItcm(unittest.TestCase):
    """q-itcm-feeder-fix's own two named regression tests: the real
    src/main/itcm/func_01ff8400.s shape (layer 1, the module-path fix),
    and a symbol-only gap with no source file at all (layer 2, the
    size_census.py union) -- plus the doc's explicit "assert dtcm
    contributes zero function rows" check."""

    def _make_tree(self, tmp: str):
        root = Path(tmp)
        itcm_cfg = root / "config" / "eur" / "arm9" / "itcm"
        itcm_cfg.mkdir(parents=True)
        itcm_src = root / "src" / "main" / "itcm"
        itcm_src.mkdir(parents=True)

        # Real, on-disk .s file -- pins the exact real bug shape from
        # itcm-reachability.md's own cited example.
        (itcm_src / "func_01ff8400.s").write_text(
            "; func_01ff8400 -- brief 219: ITCM word-fill loop.\n"
            ".text\nfunc_01ff8400:\n bx lr\n",
            encoding="utf-8",
        )

        # itcm's own symbols.txt: the claimed function (matches the .s
        # file above) plus two genuinely UNMATCHED (no delinks claim,
        # no .s file) symbol-only gaps.
        (itcm_cfg / "symbols.txt").write_text(
            "func_01ff8400 kind:function(arm,size=0x14) addr:0x01ff8400\n"
            "func_01ff8500 kind:function(arm,size=0x40) addr:0x01ff8500\n"
            "func_01ff8600 kind:function(arm,size=0x20) addr:0x01ff8600\n",
            encoding="utf-8",
        )
        (itcm_cfg / "delinks.txt").write_text(
            "src/main/itcm/func_01ff8400.s:\n"
            "    complete\n"
            "    .text start:0x01ff8400 end:0x01ff8414\n",
            encoding="utf-8",
        )

        # DTCM: real symbols.txt present, but data-only (zero
        # kind:function entries) -- must contribute nothing.
        dtcm_cfg = root / "config" / "eur" / "arm9" / "dtcm"
        dtcm_cfg.mkdir(parents=True)
        (dtcm_cfg / "symbols.txt").write_text(
            "data_02ff0000 kind:data(any) addr:0x02ff0000\n", encoding="utf-8"
        )
        (dtcm_cfg / "delinks.txt").write_text("", encoding="utf-8")

        return root

    def test_real_itcm_file_becomes_a_candidate(self):
        import tempfile
        from unittest import mock

        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            with mock.patch.object(w, "ROOT", root):
                per = w.scan()

        self.assertIn("itcm", per)
        paths = {f["path"] for f in per["itcm"]["no_marker_files"]}
        self.assertIn("src/main/itcm/func_01ff8400.s", paths)

    def test_symbol_only_gap_becomes_a_scaffold_target_candidate(self):
        import tempfile
        from unittest import mock

        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            with mock.patch.object(w, "ROOT", root):
                per = w.scan()

        paths = {f["path"] for f in per["itcm"]["no_marker_files"]}
        # Neither gap function has a real .s file on disk -- both must
        # still surface, at the canonical (not-yet-existing) path.
        self.assertIn("src/main/itcm/func_01ff8500.s", paths)
        self.assertIn("src/main/itcm/func_01ff8600.s", paths)
        self.assertFalse((root / "src/main/itcm/func_01ff8500.s").exists())

        gap = next(f for f in per["itcm"]["no_marker_files"]
                   if f["path"] == "src/main/itcm/func_01ff8500.s")
        self.assertEqual(gap["addr"], "0x01ff8500")
        self.assertEqual(gap["text_size"], 0x40)

    def test_itcm_total_is_file_plus_gap_count_no_double_counting(self):
        import tempfile
        from unittest import mock

        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            with mock.patch.object(w, "ROOT", root):
                per = w.scan()

        # 1 real file (func_01ff8400) + 2 symbol-only gaps = 3, not 4 --
        # func_01ff8400 must not ALSO appear via the size_census union
        # (it has a real delinks claim, so size_census.unmatched()
        # already excludes it independently of the on-disk check).
        self.assertEqual(per["itcm"]["total"], 3)
        self.assertEqual(per["itcm"]["candidate"], 3)

    def test_dtcm_contributes_zero_function_rows(self):
        import tempfile
        from unittest import mock

        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            with mock.patch.object(w, "ROOT", root):
                per = w.scan()

        self.assertNotIn("dtcm", per)


if __name__ == "__main__":
    unittest.main()
