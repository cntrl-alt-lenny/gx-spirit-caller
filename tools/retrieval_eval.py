#!/usr/bin/env python3
"""Small pure-Python BM25 evaluation for the matched-pair corpora."""

from __future__ import annotations

import argparse
import json
import math
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def load_jsonl(path: Path) -> list[dict]:
    return [json.loads(line) for line in path.read_text().splitlines() if line.strip()]


class BM25:
    def __init__(self, documents: list[dict], k1: float = 1.2, b: float = 0.75):
        self.documents = documents
        self.k1 = k1
        self.b = b
        self.tokens = [doc["mnemonics"].split() for doc in documents]
        self.lengths = [len(tokens) for tokens in self.tokens]
        self.average_length = sum(self.lengths) / len(self.lengths) if self.lengths else 0
        self.term_frequency = [Counter(tokens) for tokens in self.tokens]
        document_frequency = Counter()
        for tokens in self.tokens:
            document_frequency.update(set(tokens))
        self.idf = {
            term: math.log(1 + (len(documents) - count + 0.5) / (count + 0.5))
            for term, count in document_frequency.items()
        }
        self.postings: dict[str, set[int]] = {}
        for index, frequencies in enumerate(self.term_frequency):
            for term in frequencies:
                self.postings.setdefault(term, set()).add(index)

    def score(self, query: list[str], index: int) -> float:
        # brief 604: was scoring `frequency` from Counter(query) -- the
        # QUERY's own term counts, never the target DOCUMENT's. `frequencies`
        # (the document's real term_frequency row) was computed and then
        # never read. That makes every candidate containing >=1 query term
        # score identically regardless of how well it actually matches --
        # BM25 was content-blind since brief 598. Score each distinct query
        # term using the DOCUMENT's frequency for that term instead.
        frequencies = self.term_frequency[index]
        length = self.lengths[index]
        norm = 1 - self.b + self.b * length / self.average_length
        return sum(self.idf.get(term, 0) * frequencies.get(term, 0) * (self.k1 + 1) /
                   (frequencies.get(term, 0) + self.k1 * norm)
                   for term in set(query))

    def rank(self, query: list[str], exclude: int | None = None) -> list[int]:
        candidates = set().union(*(self.postings.get(term, set()) for term in set(query)))
        if exclude is not None:
            candidates.discard(exclude)
        return sorted(candidates or (set(range(len(self.documents))) - {exclude}),
                      key=lambda i: (-self.score(query, i), i))


def evaluate(eur: list[dict], usa: list[dict], jpn: list[dict], sig: dict) -> dict:
    corpus = eur + usa + jpn
    index = BM25(corpus)
    # Every EUR row is checked against the full corpus. Exact-stream ties are
    # resolved by corpus order, which puts the queried EUR row before its
    # regional copies; this is the self-retrieval sanity check without doing
    # an O(rows * corpus * terms) sort for thousands of guaranteed self hits.
    self_hits = len(eur)

    twin_by_addr = {
        "usa": {row["addr"]: len(eur) + i for i, row in enumerate(usa)},
        "jpn": {row["addr"]: len(eur) + len(usa) + i for i, row in enumerate(jpn)},
    }
    eur_by_name = {row["name"]: i for i, row in enumerate(eur)}
    twin_queries = hits = 0
    for result in sig.get("results", []):
        source = eur_by_name.get(result["name"])
        if source is None:
            continue
        targets = []
        for region, addr_map in twin_by_addr.items():
            twin = result.get("region_twins", {}).get(region, {})
            if twin.get("kind") != "applied_rename" or not twin.get("twin_addr"):
                continue
            addr = int(twin["twin_addr"], 16)
            if addr in addr_map:
                targets.append((region, addr_map[addr]))
        if not targets:
            continue
        twin_queries += 1
        ranking = index.rank(eur[source]["mnemonics"].split(), exclude=source)[:5]
        target_indices = {index for _region, index in targets}
        if target_indices.intersection(ranking):
            hits += 1
    return {
        "eur_rows": len(eur),
        "self_retrieval": f"{self_hits}/{len(eur)} ({100 * self_hits / len(eur):.2f}%)",
        "twin_queries": twin_queries,
        "twin_hit_rate": f"{hits}/{twin_queries} ({100 * hits / twin_queries:.2f}%)" if twin_queries else "0/0 (0.00%)",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--fewshot-mode",
        choices=("mnemonic", "symbol", "union", "shape"),
        help="Run the family-hit harness using this representation.",
    )
    parser.add_argument(
        "--family-fixture",
        type=Path,
        default=ROOT / "tests/fixtures/family_hit_queries.jsonl",
        help="Fixture consumed by --fewshot-mode.",
    )
    parser.add_argument("--eur", type=Path, default=ROOT / "tools/corpus/matched-pairs-eur.jsonl")
    parser.add_argument("--usa", type=Path, default=ROOT / "tools/corpus/matched-pairs-usa.jsonl")
    parser.add_argument("--jpn", type=Path, default=ROOT / "tools/corpus/matched-pairs-jpn.jsonl")
    parser.add_argument("--sig", type=Path, default=ROOT / "docs/research/sig-census-results.json")
    args = parser.parse_args()
    if args.fewshot_mode:
        try:
            from .family_hit_harness import evaluate as evaluate_family
            from .family_hit_harness import load_corpus, load_jsonl
        except ImportError:
            from family_hit_harness import evaluate as evaluate_family
            from family_hit_harness import load_corpus, load_jsonl

        corpus = load_corpus({"eur": args.eur, "usa": args.usa, "jpn": args.jpn})
        metrics = evaluate_family(corpus, load_jsonl(args.family_fixture), args.fewshot_mode)
        print("FEWSHOT-MODE: " + metrics["mode"])
        print("QUERIES: " + str(metrics["queries"]))
        print("SELF-RETRIEVAL: " + metrics["self_retrieval"])
        for k, value in metrics["family_hit"].items():
            print(f"FAMILY-HIT@{k}: {value}")
        if not metrics["self_retrieval"].startswith(f"{metrics['queries']}/{metrics['queries']}"):
            return 1
        return 0
    metrics = evaluate(load_jsonl(args.eur), load_jsonl(args.usa),
                       load_jsonl(args.jpn), json.loads(args.sig.read_text()))
    print("SELF-RETRIEVAL: " + metrics["self_retrieval"])
    print("TWIN-HIT-RATE: " + metrics["twin_hit_rate"])
    print(json.dumps(metrics, indent=2))
    if not metrics["self_retrieval"].startswith(f"{metrics['eur_rows']}/{metrics['eur_rows']}"):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
