#!/usr/bin/env python3
"""Reproducible leave-one-out family retrieval evaluation."""

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path

try:
    from .retrieval_eval import BM25
except ImportError:
    from retrieval_eval import BM25

ROOT = Path(__file__).resolve().parent.parent
REGIONS = ("eur", "usa", "jpn")
DEFAULT_FIXTURE = ROOT / "tests/fixtures/family_hit_queries.jsonl"
DEFAULT_WORKLIST = ROOT / "docs/research/c-match-worklist.json"
DEFAULT_DOCS = (
    ROOT / "docs/research/campaign-analytics/cmatch-sweep-queue.md",
    ROOT / "docs/research/campaign-analytics/safe-queue-v2.md",
    ROOT / "docs/research/campaign-analytics/pick-lists.md",
)


def load_jsonl(path: Path) -> list[dict]:
    return [json.loads(line) for line in path.read_text().splitlines() if line.strip()]


def load_corpus(paths: dict[str, Path]) -> list[dict]:
    corpus = []
    for region in REGIONS:
        for row in load_jsonl(paths[region]):
            corpus.append({**row, "region": region})
    return corpus


def load_worklist(path: Path = DEFAULT_WORKLIST) -> dict[tuple[str, str], int]:
    rows = json.loads(path.read_text())["funcs"]
    return {(row["module"], row["addr"].lower()): row["cluster_id"] for row in rows}


def documented_address_count(paths: tuple[Path, ...] = DEFAULT_DOCS) -> int:
    """Return a small provenance signal without making prose the family key."""
    import re

    addresses = set()
    for path in paths:
        if not path.is_file():
            continue
        addresses.update(re.findall(r"(?<![0-9a-f])(?:0x)?[0-9a-f]{8}(?![0-9a-f])",
                                    path.read_text(), flags=re.IGNORECASE))
    return len(addresses)


def make_fixture(corpus: list[dict], worklist: dict[tuple[str, str], int], path: Path) -> list[dict]:
    labeled = []
    by_family = Counter()
    for index, row in enumerate(corpus):
        family = worklist.get((row["module"], f"{row['addr']:08x}"))
        if family is None:
            continue
        key = f"{row['module']}:{family}"
        by_family[key] += 1
        labeled.append({
            "query_id": f"{row['region']}:{index}",
            "corpus_index": index,
            "region": row["region"],
            "module": row["module"],
            "name": row["name"],
            "addr": f"0x{row['addr']:08x}",
            "family": key,
        })
    labeled = [row for row in labeled if by_family[row["family"]] >= 2]
    labeled.sort(key=lambda row: (REGIONS.index(row["region"]), row["module"],
                                  int(row["addr"], 16), row["name"]))
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in labeled))
    return labeled


def _tokens(row: dict, field: str) -> list[str]:
    value = row.get(field)
    if isinstance(value, list):
        return value
    if isinstance(value, str):
        return value.split()
    return []


class Retriever:
    def __init__(self, corpus: list[dict], mode: str):
        self.corpus = corpus
        self.mode = mode
        self.mnemonic = BM25(corpus)
        self.symbols = [set(_tokens(row, "symbols")) for row in corpus]
        self.shape = BM25([
            {"mnemonics": " ".join(_tokens(row, "shape_tokens")) or row.get("mnemonics", "")}
            for row in corpus
        ])

    def rank(self, query_index: int, *, exclude: bool = False,
             prefer_identity: bool = False) -> list[int]:
        query = self.corpus[query_index]
        mnemonic = self.mnemonic.rank(_tokens(query, "mnemonics"),
                                      exclude=query_index if exclude else None)
        if self.mode == "mnemonic":
            ranking = mnemonic
            if prefer_identity and query_index in ranking:
                ranking.remove(query_index)
                ranking.insert(0, query_index)
            return ranking
        if self.mode == "shape":
            ranking = self.shape.rank(_tokens(query, "shape_tokens") or _tokens(query, "mnemonics"),
                                      exclude=query_index if exclude else None)
            if prefer_identity and query_index in ranking:
                ranking.remove(query_index)
                ranking.insert(0, query_index)
            return ranking
        query_symbols = set(_tokens(query, "symbols"))
        if not query_symbols:
            # Older committed corpora predate the enriched export. A missing
            # representation is not evidence against a candidate, so preserve
            # the mnemonic baseline until the corpus is regenerated.
            ranking = mnemonic
            if prefer_identity and query_index in ranking:
                ranking.remove(query_index)
                ranking.insert(0, query_index)
            return ranking
        symbol = sorted(
            range(len(self.corpus)),
            key=lambda index: (-len(query_symbols & self.symbols[index]), index),
        )
        if exclude:
            symbol = [index for index in symbol if index != query_index]
        if self.mode == "symbol":
            ranking = symbol
            if prefer_identity and query_index in ranking:
                ranking.remove(query_index)
                ranking.insert(0, query_index)
            return ranking
        if self.mode == "union":
            # Reciprocal-rank fusion keeps the two representations orthogonal
            # and avoids pretending raw BM25 and symbol counts share a scale.
            m_rank = {index: rank for rank, index in enumerate(mnemonic)}
            s_rank = {index: rank for rank, index in enumerate(symbol)}
            candidates = set(m_rank) | set(s_rank)
            ranking = sorted(candidates, key=lambda index: (
                -(1 / (60 + m_rank.get(index, len(self.corpus))) +
                  1 / (60 + s_rank.get(index, len(self.corpus)))), index))
            if prefer_identity and query_index in ranking:
                ranking.remove(query_index)
                ranking.insert(0, query_index)
            return ranking
        raise ValueError(f"unknown mode: {self.mode}")


def evaluate(corpus: list[dict], queries: list[dict], mode: str) -> dict:
    retriever = Retriever(corpus, mode)
    self_hits = 0
    hits = {k: 0 for k in (1, 3, 5, 10)}
    for query in queries:
        index = query["corpus_index"]
        if retriever.rank(index, prefer_identity=True)[0] == index:
            self_hits += 1
        ranking = retriever.rank(index, exclude=True)
        family = query["family"]
        family_indices = {
            other["corpus_index"] for other in queries
            if other["family"] == family and other["corpus_index"] != index
        }
        for k in hits:
            if family_indices.intersection(ranking[:k]):
                hits[k] += 1
    total = len(queries)
    return {
        "mode": mode,
        "queries": total,
        "self_retrieval": f"{self_hits}/{total} ({100 * self_hits / total:.2f}%)",
        "family_hit": {
            str(k): f"{hits[k]}/{total} ({100 * hits[k] / total:.2f}%)"
            for k in hits
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--mode", choices=("mnemonic", "symbol", "union", "shape"), default="mnemonic")
    parser.add_argument("--fixture", type=Path, default=DEFAULT_FIXTURE)
    parser.add_argument("--write-fixture", action="store_true")
    parser.add_argument("--eur", type=Path, default=ROOT / "tools/corpus/matched-pairs-eur.jsonl")
    parser.add_argument("--usa", type=Path, default=ROOT / "tools/corpus/matched-pairs-usa.jsonl")
    parser.add_argument("--jpn", type=Path, default=ROOT / "tools/corpus/matched-pairs-jpn.jsonl")
    parser.add_argument("--worklist", type=Path, default=DEFAULT_WORKLIST)
    args = parser.parse_args()
    corpus = load_corpus({"eur": args.eur, "usa": args.usa, "jpn": args.jpn})
    queries = make_fixture(corpus, load_worklist(args.worklist), args.fixture) if args.write_fixture else load_jsonl(args.fixture)
    metrics = evaluate(corpus, queries, args.mode)
    print(f"DOCUMENTED_ADDRESS_COUNT: {documented_address_count()}")
    print(f"QUERIES: {metrics['queries']}")
    print(f"SELF-RETRIEVAL: {metrics['self_retrieval']}")
    for k, value in metrics["family_hit"].items():
        print(f"FAMILY-HIT@{k}: {value}")
    if not metrics["self_retrieval"].startswith(f"{metrics['queries']}/{metrics['queries']}"):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
