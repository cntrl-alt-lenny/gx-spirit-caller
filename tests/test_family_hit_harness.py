import tempfile
import unittest
from pathlib import Path

from tools.family_hit_harness import Retriever, evaluate, make_fixture


class FamilyHitHarnessTest(unittest.TestCase):
    def test_fixture_filters_singleton_families(self):
        corpus = [
            {"name": "a", "module": "main", "addr": 1, "region": "eur", "mnemonics": "ldr bx"},
            {"name": "b", "module": "main", "addr": 2, "region": "eur", "mnemonics": "ldr bx"},
            {"name": "c", "module": "main", "addr": 3, "region": "eur", "mnemonics": "svc bx"},
        ]
        with tempfile.TemporaryDirectory() as tmp:
            fixture = Path(tmp) / "queries.jsonl"
            rows = make_fixture(corpus, {("main", "00000001"): 7,
                                         ("main", "00000002"): 7,
                                         ("main", "00000003"): 8}, fixture)
            self.assertEqual([row["name"] for row in rows], ["a", "b"])
            self.assertEqual(len(fixture.read_text().splitlines()), 2)

    def test_self_and_family_metrics(self):
        corpus = [
            {"name": "a", "module": "main", "addr": 1, "mnemonics": "ldr bx"},
            {"name": "b", "module": "main", "addr": 2, "mnemonics": "ldr bx"},
        ]
        queries = [
            {"corpus_index": 0, "family": "main:7"},
            {"corpus_index": 1, "family": "main:7"},
        ]
        metrics = evaluate(corpus, queries, "mnemonic")
        self.assertEqual(metrics["self_retrieval"], "2/2 (100.00%)")
        self.assertEqual(metrics["family_hit"]["5"], "2/2 (100.00%)")

    def test_symbol_and_union_fall_back_without_enriched_fields(self):
        corpus = [
            {"name": "a", "module": "main", "addr": 1, "mnemonics": "ldr bx"},
            {"name": "b", "module": "main", "addr": 2, "mnemonics": "ldr bx"},
        ]
        queries = [
            {"corpus_index": 0, "family": "main:7"},
            {"corpus_index": 1, "family": "main:7"},
        ]
        baseline = evaluate(corpus, queries, "mnemonic")
        for mode in ("symbol", "union"):
            metrics = evaluate(corpus, queries, mode)
            self.assertEqual(metrics["self_retrieval"], baseline["self_retrieval"])
            self.assertEqual(metrics["family_hit"], baseline["family_hit"])

    def test_symbol_ranker_prefers_shared_data_target(self):
        corpus = [
            {"name": "query", "mnemonics": "mov", "symbols": ["data_shared"]},
            {"name": "sibling", "mnemonics": "bx", "symbols": ["data_shared"]},
            {"name": "other", "mnemonics": "bx", "symbols": ["data_other"]},
        ]
        self.assertEqual(Retriever(corpus, "symbol").rank(0, exclude=True)[0], 1)


if __name__ == "__main__":
    unittest.main()
