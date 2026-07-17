import unittest

from tools.retrieval_eval import BM25, evaluate


class TestRetrievalEval(unittest.TestCase):
    def test_bm25_self_rank(self):
        docs = [{"name": str(i), "mnemonics": text}
                for i, text in enumerate(("alpha beta gamma", "delta epsilon zeta",
                                          "eta theta iota", "kappa lambda mu",
                                          "nu xi omicron"))]
        index = BM25(docs)
        for i, doc in enumerate(docs):
            self.assertEqual(index.rank(doc["mnemonics"].split())[0], i)

    def test_evaluate_five_row_fixture(self):
        eur = [{"name": str(i), "addr": i, "mnemonics": text}
               for i, text in enumerate(("alpha beta gamma", "delta epsilon zeta",
                                          "eta theta iota", "kappa lambda mu",
                                          "nu xi omicron"))]
        metrics = evaluate(eur, [], [], {"results": []})
        self.assertEqual(metrics["self_retrieval"], "5/5 (100.00%)")

    def test_score_reflects_document_term_frequency_not_query(self):
        """brief 604: score() was reading `frequency` from Counter(query) --
        the QUERY's own term counts -- never from `frequencies` (the target
        DOCUMENT's term_frequency row), which was computed and discarded.
        That makes score() depend only on which terms the query shares with
        a document, not how often they occur in it: every candidate sharing
        >=1 query term scored identically, regardless of relevance. All
        prior fixtures use fully disjoint per-document vocabulary, so each
        query has exactly one BM25 *candidate* at all -- ranking a
        single-candidate list can't exercise relative scoring and would
        pass under the bug too. This one shares vocabulary across 3
        documents with different in-document term frequencies, so a
        content-blind scorer ranks them by corpus-index tiebreak alone
        (dense would lose) instead of by real term frequency."""
        docs = [
            {"name": "sparse", "mnemonics": "mov ldr bl push pop str cmp"},
            {"name": "dense", "mnemonics": "mov mov mov mov ldr ldr ldr bl"},
            {"name": "unrelated", "mnemonics": "swi swi mrs mcr"},
        ]
        index = BM25(docs)
        query = "mov ldr".split()
        ranking = index.rank(query)
        self.assertEqual(ranking[0], 1, "the document with higher in-document "
                          "frequency of the query terms ('dense') must "
                          "outrank 'sparse' -- a content-blind scorer ties "
                          "them and falls back to corpus-index order (0 "
                          "first), which is exactly the bug this guards.")
        self.assertGreater(index.score(query, 1), index.score(query, 0))


if __name__ == "__main__":
    unittest.main()
