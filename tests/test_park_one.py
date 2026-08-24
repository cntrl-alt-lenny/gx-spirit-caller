from __future__ import annotations

import sys
from pathlib import Path
from unittest import TestCase
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))

import park_one  # noqa: E402


class ParkOneLedgerTests(TestCase):
    def test_real_ledger_rejects_not_attempted_measurements(self) -> None:
        import csv

        ledger = ROOT / "docs/research/campaign-analytics/attempts.tsv"
        with ledger.open(newline="", encoding="utf-8") as stream:
            contradictions = [
                row["addr"]
                for row in csv.DictReader(stream, delimiter="\t")
                if row["result"].strip().lower() == "not-attempted"
                and row["match_pct"].strip().lower() not in {"", "unknown"}
            ]
        self.assertEqual(contradictions, [])

    def test_park_one_restores_and_records_attempt(self) -> None:
        import tempfile

        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            c_rel = "src/main/func_02000010.c"
            s_rel = "src/main/func_02000010.s"
            c_path = root / c_rel
            s_path = root / s_rel
            delinks = root / "config/eur/arm9/delinks.txt"
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            c_path.parent.mkdir(parents=True)
            delinks.parent.mkdir(parents=True)
            ledger.parent.mkdir(parents=True)
            c_path.write_text("draft\n", encoding="utf-8")
            s_path.write_text("original\n", encoding="utf-8")
            delinks.write_text(
                f"{c_rel}:\n"
                "    complete\n"
                "    .text start:0x02000010 end:0x02000028\n",
                encoding="utf-8",
            )
            ledger.write_text(
                "addr\tmodule\ttext_size\ttier\tshape\tresult\tmatch_pct\tpark_class\tpark_family\tbrief\tattempts\n",
                encoding="utf-8",
            )

            with patch.object(park_one, "ROOT", root), patch.object(
                park_one,
                "_is_already_applied",
                return_value=delinks,
            ):
                result = park_one.park_one(
                    c_rel,
                    "eur",
                    shape="guard-chain",
                    match_pct="75.0",
                    park_class="reg-alloc",
                    brief="brief-test",
                    attempts=3,
                )

            self.assertEqual(result, 0)
            self.assertFalse(c_path.exists())
            self.assertEqual(s_path.read_text(encoding="utf-8"), "original\n")
            self.assertIn(f"{s_rel}:\n", delinks.read_text(encoding="utf-8"))
            rows = ledger.read_text(encoding="utf-8").splitlines()
            self.assertEqual(
                rows[-1],
                "0x02000010\tmain\t24\tdefault\tguard-chain\tparked\t75.0\treg-alloc\tPROVISIONAL:register-allocation\tbrief-test\t3",
            )

    def test_overlay_park_round_trips_through_selector_module_key(self) -> None:
        import tempfile

        import wall_aware_headroom as headroom

        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            c_rel = "src/overlay002/func_ov002_02100010.c"
            s_rel = "src/overlay002/func_ov002_02100010.s"
            c_path = root / c_rel
            s_path = root / s_rel
            delinks = root / "config/eur/arm9/overlays/ov002/delinks.txt"
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            c_path.parent.mkdir(parents=True)
            delinks.parent.mkdir(parents=True)
            ledger.parent.mkdir(parents=True)
            c_path.write_text("draft\n", encoding="utf-8")
            s_path.write_text("; C-34\n.text\n", encoding="utf-8")
            delinks.write_text(
                f"{c_rel}:\n"
                "    complete\n"
                "    .text start:0x02100010 end:0x02100028\n",
                encoding="utf-8",
            )
            ledger.write_text(
                "addr\tmodule\ttext_size\ttier\tshape\tresult\tmatch_pct\tpark_class\tpark_family\tbrief\tattempts\n",
                encoding="utf-8",
            )

            with patch.object(park_one, "ROOT", root), patch.object(
                park_one, "_is_already_applied", return_value=delinks
            ):
                self.assertEqual(
                    park_one.park_one(c_rel, "eur", brief="brief-overlay"), 0
                )

            with patch.object(headroom, "ROOT", root):
                source_module = headroom._source_module(s_rel)
                self.assertEqual(source_module, "ov002")
                keys = headroom._attempted_keys(ledger)
                self.assertIn((source_module, "0x02100010"), keys)
                per = headroom.scan(exclude_attempted=True)

            self.assertEqual(per["overlay002"]["excluded_attempted"], 1)
            self.assertEqual(per["overlay002"]["candidate"], 0)

    def test_repeated_events_and_exact_duplicates_are_preserved(self) -> None:
        import tempfile

        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            ledger.parent.mkdir(parents=True)
            ledger.write_text(
                "addr\tmodule\ttext_size\ttier\tshape\tresult\tmatch_pct\tpark_class\tpark_family\tbrief\tattempts\n",
                encoding="utf-8",
            )
            with patch.object(park_one, "ROOT", root):
                for result, match_pct, brief in (
                    ("parked", "75.0", "brief-a"),
                    ("shipped", "100", "brief-b"),
                    ("shipped", "100", "brief-b"),
                ):
                    park_one._record_attempt(
                        "src/main/func_02000010.c",
                        text_size="24",
                        tier="default",
                        shape="leaf",
                        match_pct=match_pct,
                        park_class="unknown",
                        brief=brief,
                        result=result,
                    )
            self.assertEqual(len(ledger.read_text(encoding="utf-8").splitlines()), 4)

    def test_bad_ledger_header_leaves_park_tree_unchanged(self) -> None:
        import tempfile

        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            c_rel = "src/main/func_02000010.c"
            s_rel = "src/main/func_02000010.s"
            c_path, s_path = root / c_rel, root / s_rel
            delinks = root / "config/eur/arm9/delinks.txt"
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            c_path.parent.mkdir(parents=True)
            delinks.parent.mkdir(parents=True)
            ledger.parent.mkdir(parents=True)
            c_path.write_text("draft\n", encoding="utf-8")
            s_path.write_text("original\n", encoding="utf-8")
            delinks.write_text(f"{c_rel}:\n    complete\n", encoding="utf-8")
            ledger.write_text("wrong\n", encoding="utf-8")
            before = (c_path.read_bytes(), s_path.read_bytes(), delinks.read_bytes())
            with patch.object(park_one, "ROOT", root), patch.object(
                park_one, "_is_already_applied", return_value=delinks
            ):
                self.assertEqual(park_one.park_one(c_rel, "eur"), 1)
            self.assertEqual((c_path.read_bytes(), s_path.read_bytes(), delinks.read_bytes()), before)

    def test_bad_attempt_row_is_refused_before_source_mutation(self) -> None:
        import tempfile

        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            c_rel = "src/main/func_02000010.c"
            s_rel = "src/main/func_02000010.s"
            c_path, s_path = root / c_rel, root / s_rel
            delinks = root / "config/eur/arm9/delinks.txt"
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            c_path.parent.mkdir(parents=True)
            delinks.parent.mkdir(parents=True)
            ledger.parent.mkdir(parents=True)
            c_path.write_text("draft\n", encoding="utf-8")
            s_path.write_text("original\n", encoding="utf-8")
            delinks.write_text(
                f"{c_rel}:\n"
                "    complete\n"
                "    .text start:0x02000010 end:0x02000028\n",
                encoding="utf-8",
            )
            ledger.write_text(
                "addr\tmodule\ttext_size\ttier\tshape\tresult\tmatch_pct\tpark_class\tpark_family\tbrief\tattempts\n",
                encoding="utf-8",
            )
            before = (c_path.read_bytes(), s_path.read_bytes(), delinks.read_bytes())

            with patch.object(park_one, "ROOT", root), patch.object(
                park_one, "_is_already_applied", return_value=delinks
            ):
                result = park_one.park_one(c_rel, "eur", match_pct="100")

            self.assertEqual(result, 1)
            self.assertEqual(
                (c_path.read_bytes(), s_path.read_bytes(), delinks.read_bytes()),
                before,
            )

    def test_unwritable_ledger_path_leaves_park_tree_unchanged(self) -> None:
        import tempfile

        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            c_rel = "src/main/func_02000010.c"
            s_rel = "src/main/func_02000010.s"
            c_path, s_path = root / c_rel, root / s_rel
            delinks = root / "config/eur/arm9/delinks.txt"
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            c_path.parent.mkdir(parents=True)
            delinks.parent.mkdir(parents=True)
            ledger.parent.mkdir(parents=True)
            c_path.write_text("draft\n", encoding="utf-8")
            s_path.write_text("original\n", encoding="utf-8")
            delinks.write_text(f"{c_rel}:\n    complete\n", encoding="utf-8")
            ledger.mkdir()
            before = (c_path.read_bytes(), s_path.read_bytes(), delinks.read_bytes())
            with patch.object(park_one, "ROOT", root), patch.object(
                park_one, "_is_already_applied", return_value=delinks
            ):
                self.assertEqual(park_one.park_one(c_rel, "eur"), 1)
            self.assertEqual((c_path.read_bytes(), s_path.read_bytes(), delinks.read_bytes()), before)

    def test_not_attempted_event_is_not_an_exclusion(self) -> None:
        import tempfile

        import wall_aware_headroom as headroom

        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            ledger.parent.mkdir(parents=True)
            ledger.write_text(
                "addr\tmodule\ttext_size\ttier\tshape\tresult\tmatch_pct\tpark_class\tpark_family\tbrief\tattempts\n"
                "0x02100010\tov002\t24\tdefault\tunknown\tnot-attempted\tunknown\tunknown\tbrief-a\n",
                encoding="utf-8",
            )
            with patch.object(headroom, "ROOT", root):
                self.assertNotIn(("ov002", "0x02100010"), headroom._attempted_keys(ledger))

    def test_measured_attempt_results_remain_excluded(self) -> None:
        import tempfile

        import wall_aware_headroom as headroom

        measured = (
            ("main", "0x020b3168", "genuine-wall"),
            ("main", "0x02060fdc", "genuine-wall"),
            ("main", "0x0202bc38", "genuine-wall"),
            ("main", "0x0206eecc", "near-miss"),
            ("main", "0x020685c8", "near-miss"),
            ("main", "0x02073fc8", "near-miss"),
            ("main", "0x020403d4", "near-miss"),
            ("main", "0x0209a000", "near-miss"),
            ("main", "0x020915e4", "close-wall"),
            ("main", "0x020458d8", "close-wall"),
            ("main", "0x020967bc", "close"),
            ("ov002", "0x022476e8", "skipped"),
        )
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            ledger.parent.mkdir(parents=True)
            lines = [
                "addr\tmodule\ttext_size\ttier\tshape\tresult\tmatch_pct\tpark_class\tpark_family\tbrief"
            ]
            lines.extend(
                f"{addr}\t{module}\tunknown\tdefault\tunknown\t{result}\t41.7\tunknown\tbrief-test"
                for module, addr, result in measured
            )
            ledger.write_text("\n".join(lines) + "\n", encoding="utf-8")
            with patch.object(headroom, "ROOT", root):
                keys = headroom._attempted_keys(ledger)
        self.assertTrue({(module, addr) for module, addr, _ in measured} <= keys)

    def test_real_ledger_measured_attempts_remain_excluded(self) -> None:
        import wall_aware_headroom as headroom

        measured = {
            ("main", addr)
            for addr in (
                "0x020b3168", "0x02060fdc", "0x0202bc38", "0x0206eecc",
                "0x020685c8", "0x02073fc8", "0x020403d4", "0x0209a000",
                "0x020915e4", "0x020458d8", "0x020967bc",
            )
        } | {("ov002", "0x022476e8")}
        ledger = ROOT / "docs/research/campaign-analytics/attempts.tsv"
        self.assertTrue(measured <= headroom._attempted_keys(ledger))

    def test_diagnosed_never_attempted_walls_remain_excluded(self) -> None:
        import wall_aware_headroom as headroom

        diagnosed = {
            ("main", "0x02010354"),
            ("main", "0x02021b38"),
            ("main", "0x02023478"),
            ("main", "0x0209085c"),
        }
        ledger = ROOT / "docs/research/campaign-analytics/attempts.tsv"
        self.assertTrue(diagnosed <= headroom._attempted_keys(ledger))
