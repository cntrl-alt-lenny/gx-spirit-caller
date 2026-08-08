"""Synthetic-shape tests for the field producer hypothesis finder."""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from field_producer_finder import find_candidates, make_spec, render  # noqa: E402


class TestFieldProducerFinder(unittest.TestCase):
    def test_surfaces_all_three_shapes_and_ranks_rmw_first(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "src" / "synthetic.c"
            source.parent.mkdir()
            source.write_text(
                """
                typedef struct State { unsigned short flags; } State;
                State data_02104bac;
                void f(void) {
                    *(unsigned short *)((char *)&data_02104bac + 0x54) =
                        (*(unsigned short *)((char *)&data_02104bac + 0x54) & ~4) | 2;
                    Fill32(&data_02104bac + 0x54, 0, 0x80);
                    sdk_write(&data_02104bac + 0x54);
                }
                """,
                encoding="utf-8",
            )
            candidates = find_candidates(
                make_spec("GlobalData02104bac", 0x54, 2), root, region=None
            )
        shapes = {candidate.shape for candidate in candidates}
        self.assertEqual(shapes, {"masked-rmw", "bulk-fill", "sdk-call"})
        self.assertEqual(candidates[0].shape, "masked-rmw")
        self.assertTrue(all(candidate.path == "src/synthetic.c" for candidate in candidates))

    def test_assembly_requires_same_register_and_offset_for_masked_rmw(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "src" / "synthetic.s"
            source.parent.mkdir()
            source.write_text(
                """
                ldrh r1, [r0, #0x54]
                orr r1, r1, #4
                strh r1, [r0, #0x54]
                """,
                encoding="utf-8",
            )
            candidates = find_candidates(
                make_spec("data_02104bac", 0x54, 2), root, region=None
            )
        self.assertEqual([candidate.shape for candidate in candidates], ["masked-rmw"])
        self.assertEqual(candidates[0].anchor, "OFFSET-ONLY")

    def test_assembly_anchor_ranks_above_offset_only(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "src" / "synthetic.s"
            source.parent.mkdir()
            source.write_text(
                """
                ldr r1, _LIT0
                ldrh r2, [r1, #0x54]
                orr r2, r2, #4
                strh r2, [r1, #0x54]
                ldr r3, _LIT1
                ldrh r4, [r3, #0x54]
                bic r4, r4, #4
                strh r4, [r3, #0x54]
                _LIT0: .word data_02104bac
                _LIT1: .word unrelated_global
                """,
                encoding="utf-8",
            )
            candidates = find_candidates(
                make_spec("GlobalData02104bac", 0x54, 2), root, region=None
            )
        self.assertEqual([candidate.anchor for candidate in candidates], [
            "BASE-ANCHORED", "OFFSET-ONLY"
        ])
        anchored_scores = [
            candidate.score for candidate in candidates
            if candidate.anchor == "BASE-ANCHORED"
        ]
        offset_scores = [
            candidate.score for candidate in candidates
            if candidate.anchor == "OFFSET-ONLY"
        ]
        self.assertLess(max(offset_scores), min(anchored_scores))
        self.assertIn("anchor", render(make_spec("GlobalData02104bac", 0x54, 2), candidates))

    def test_generic_cfg_alias_with_different_declared_type_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "src" / "synthetic.c"
            source.parent.mkdir()
            source.write_text(
                """
                typedef struct BgCfg021aa460 { unsigned short f14; } BgCfg021aa460;
                typedef struct BgCfg { unsigned short f14; } BgCfg;
                void f(void) {
                    BgCfg good_cfg;
                    good_cfg.f14 = good_cfg.f14 | 1;
                    BgCfg021aa460 cfg;
                    cfg.f14 = cfg.f14 | 1;
                }
                """,
                encoding="utf-8",
            )
            candidates = find_candidates(make_spec("BgCfg", 0x14, 2), root, region=None)
        self.assertEqual(len(candidates), 1)
        self.assertIn("good_cfg", candidates[0].evidence)

    def test_bare_decimal_equal_to_offset_is_not_an_access(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "src" / "synthetic.c"
            source.parent.mkdir()
            source.write_text(
                """
                unsigned int data_02104bac;
                void f(void) {
                    data_02104bac = data_02104bac | 20;
                }
                """,
                encoding="utf-8",
            )
            candidates = find_candidates(
                make_spec("GlobalData02104bac", 0x14, 2), root, region=None
            )
        self.assertEqual(candidates, [])

    def test_default_region_is_eur_first(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            eur = root / "src" / "overlay002" / "func_ov002_02100010.c"
            jpn = root / "src" / "jpn" / "overlay002" / "func_ov002_02100010.c"
            eur.parent.mkdir(parents=True)
            jpn.parent.mkdir(parents=True)
            body = "void f(void) { data_02104bac + 0x54; data_02104bac |= 1; }\n"
            eur.write_text(body, encoding="utf-8")
            jpn.write_text(body, encoding="utf-8")
            candidates = find_candidates(make_spec("data_02104bac", 0x54, 2), root)
        self.assertEqual({candidate.path for candidate in candidates}, {
            "src/overlay002/func_ov002_02100010.c"
        })


if __name__ == "__main__":
    unittest.main()
