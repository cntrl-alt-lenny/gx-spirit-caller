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


if __name__ == "__main__":
    unittest.main()
