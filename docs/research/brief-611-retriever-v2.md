# Brief 611: retriever validation + symbol-keyed retrieval

## Scope and baseline

The previous 24-query probe is not a trustworthy campaign metric. This note
adds a committed leave-one-out fixture at
`tests/fixtures/family_hit_queries.jsonl` and a reproducible evaluator in
`tools/family_hit_harness.py`.

The queue documents name candidates, but the repository worklist defines a
family using `(module, cluster_id)`. Joining all three committed matched-pair
corpora to that worklist produced 185 valid non-singleton queries. The queue
documents contain 211 distinct addresses, while using only explicitly listed
addresses produces 117 corpus rows. The requested `>=200` labeled-query
canary is therefore a false premise under the documented family key: reaching
200 would require padding with singleton or incorrectly cross-module families.
The harness uses all 185 valid queries instead.

The self-retrieval canary is 185/185 (100.00%). Exact regional ties are
resolved only for this canary; the leave-one-out family scores exclude the
query row normally.

```
DOCUMENTED_ADDRESS_COUNT: 211
QUERIES: 185
SELF-RETRIEVAL: 185/185 (100.00%)
FAMILY-HIT@1: 47/185 (25.41%)
FAMILY-HIT@3: 73/185 (39.46%)
FAMILY-HIT@5: 99/185 (53.51%)
FAMILY-HIT@10: 107/185 (57.84%)
```

The real baseline is therefore **family-hit@5 = 99/185 (53.51%)**. This
replaces the uncommitted 24-query 95.8% result.

## Symbol-keyed retrieval

`tools/export_matched_pairs.py` now extracts `data_*` targets from
`R_ARM_*` relocation records and associates them with the nearest preceding
function in the disassembly. Each newly exported row receives a `symbols`
list. `retrieval_eval.py` exposes this through `--fewshot-mode symbol`, along
with `union` reciprocal-rank fusion and `shape` evaluation modes.

The committed corpora predate this exporter change: all 9,101 existing rows
have neither `symbols` nor `shape_tokens`. The evaluator treats missing
representation data as unavailable evidence and falls back to mnemonic
ranking. This avoids measuring an index-order artifact. The A/B result on the
committed corpus is:

| Mode | Family-hit@5 |
|------|--------------|
| Mnemonic baseline | 99/185 (53.51%) |
| Symbol | 99/185 (53.51%) |
| Mnemonic + symbol union | 99/185 (53.51%) |

The positive unit test uses two rows sharing `data_shared` and confirms that
the symbol ranker prefers that sibling over an unrelated symbol row. A
build-capable follow-up should regenerate the corpora, then rerun this same
fixture to obtain a real symbol A/B.

## Operand-shape representation

The exporter also emits conservative operand-shape tokens: operation names,
register classes, special registers, register lists, bracketed memory forms,
and immediates. Literal operands are not retained. Since the committed corpus
has no shape tokens, the shape run is the mnemonic baseline:

```
SHAPE FAMILY-HIT@5: 99/185 (53.51%)
DELTA: +0.00 percentage points
```

## Recommendation

**NO-GO for retriever-v2 adoption.** Neither improvement beats the real
baseline on the reproducible fixture. The safe exporter and ranker plumbing
can remain, but no claim of lift should be made until enriched corpora are
generated from the delink objects and this exact harness is rerun.

No Wine, ROM build, or SHA1 gate was run for this Python-only evaluation.
