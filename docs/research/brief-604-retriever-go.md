[//]: # (markdownlint-disable MD013 MD041)

# Brief 604 — the retriever decision

**Asked:** should few-shot retrieval (inject top-k similar matched
functions into `m2c_feed.py` drafts) be built? Prior evidence: BM25 over
mnemonic streams, twin-hit 0/32, read as structural ("twins are
cross-region and weren't indexed"). Get the union-index number (brief
603 was running it in parallel), design a better probe — family-hit@5
over ~20 known matched functions with documented families — and render
a GO/NO-GO.

**Short answer: GO.** The 0/32 premise was wrong on both counts it
assumed: `tools/retrieval_eval.py` was *already* a union index (brief
598 built it that way), and the reason it scored 0/32 was a real scoring
bug — `BM25.score()` read term frequency from the query's own `Counter`
instead of the target document's, so every candidate sharing ≥1 query
term scored identically regardless of relevance. Fixed: union twin-hit
jumps to **23/32 (71.9%)**. The brief's own, more meaningful probe —
**family-hit@5 = 23/24 (95.8%)** over 6 documented families (row-group-
rebuild, C-42 Family 5, object-builder, popcount twins, a slot-walk
pair, and an MMIO-guard family) — confirms it's a real, usable signal,
not an artifact of the fix. `--fewshot K` is wired into `tools/m2c_feed.py`,
unit-tested (16 new tests), and demonstrated end-to-end on a real,
currently-unmatched ov004 function, where the top retrieved sibling
turned out to call the exact same two helper functions the target does.

## 1. The union twin-hit number — and why 0/32 was never structural

No brief-603 PR or branch existed at kickoff time (checked `gh pr
list`/`gh api .../branches` — nothing), so this brief ran the eval
itself. `tools/retrieval_eval.py`'s `evaluate()` already builds
`corpus = eur + usa + jpn` and indexes it as one `BM25` — brief 598's
"EUR-only index" framing doesn't match its own shipped code. Running it
fresh reproduced the reported number exactly: `TWIN-HIT-RATE: 0/32`.

Tracing one twin query by hand (`func_ov006_021b46b8`, whose USA twin
has a **byte-identical** mnemonic stream) found the true twin ranked
**5,510th of 8,813** candidates, tied in score with the query's own
self-match yet buried behind hundreds of unrelated 2-mnemonic stub
functions scoring *higher* than the query's own self-score. That
pointed first at BM25's length-normalization term (`b=0.75` rewards
short documents) — but forcing `b=0` didn't move the number at all
(still 0/32), which ruled that theory out and forced a real look at
`score()`:

```python
def score(self, query: list[str], index: int) -> float:
    frequencies = self.term_frequency[index]              # computed...
    length = self.lengths[index]
    norm = 1 - self.b + self.b * length / self.average_length
    return sum(self.idf.get(term, 0) * frequency * (self.k1 + 1) /
               (frequency + self.k1 * norm)
               for term, frequency in Counter(query).items())  # ...never read
```

`frequencies` (the document's real term-frequency row) is assigned and
never referenced again — `frequency` inside the sum comes from
`Counter(query)`, the **query's own** term counts. Every document
sharing ≥1 query term scores identically regardless of its actual
content; with `b=0` every document's `norm` is also 1, so the score
becomes 100% query-dependent and 0% document-dependent. Self-retrieval
("100%") was never real evidence either — it's a corpus-order tiebreak
on tied, content-blind scores; a query only fails self-retrieval if
literally nothing shares a token with itself.

**Fix:** score each distinct query term using the document's own
frequency for it (`frequencies.get(term, 0)`), not the query's.

**All existing tests passed both before and after** — both fixtures use
fully disjoint per-document vocabulary, so every query has exactly one
BM25 *candidate* (nothing else shares a token), and ranking a
single-candidate list can't exercise relative scoring at all. Added
`test_score_reflects_document_term_frequency_not_query` with three
documents sharing vocabulary at different frequencies; confirmed by
hand-running the old scorer against the same fixture that it ties
"sparse" and "dense" and falls back to a wrong ranking.

**Result:** union twin-hit **23/32 (71.9%)**, up from 0/32.

## 2. Family-hit@5 — the probe that actually answers the question

Twin-hit only validates the index (twins are near-identical by
construction — the real question is whether retrieval generalizes to
*genuinely different* functions that merely share a family). Built the
probe the brief specified: ~20 known matched EUR functions with
campaign-documented families, checked whether each one's top-5 (BM25,
fixed scorer, EUR-only corpus — the realistic drafting-time search
scope, and it sidesteps a cross-region self-twin contamination risk a
union corpus would introduce here) surfaces another member of its own
family.

**Families used** (all addresses cross-checked against
`tools/corpus/matched-pairs-eur.jsonl` by `(module, addr)`, not `addr`
alone — two of the picks landed on overlay-swap-shared RAM addresses
and a naive addr-only lookup silently grabbed a *different* overlay's
unrelated function at the same address; module-qualified lookup is
required, matching the same overlay-swap discipline campaign tooling
already applies elsewhere):

| Family | Source | Members |
|---|---|---|
| row-group-rebuild | `docs/research/map/overlay016.md` | 5 (`RowGroup0..4_Rebuild`, ov016) |
| C-42 Family 5 | `brief-250-c42-escape-classify-family5-n3-family7.md` | 4 (ov016/17/19, "structurally byte-identical") |
| object-builder | `docs/research/retriage/Ov000Deep.md` | 2 (`Ov000_BuildWindowA/B`, ov000) |
| popcount twins | `docs/research/map/overlay008.md` + `overlay017.md` | 2 (`Ov008_Popcount`, `Ov017_Popcount`) |
| slot-walk | `docs/research/map/overlay008.md` | 2 (`FindSlotIndex`/`GetSlotOffset`) |
| MMIO-guard uniform | `brief-273-c23-mmio-drainable-cohort.md` | 9 (8 ov006 + 1 ov021 clone) |

**Result: 23/24 (95.83%).**

Two things surfaced during the run worth recording, because both changed
the number and both are more informative than a flat pass/fail:

- **The MMIO-guard family started at 0/8.** Tracing the first miss
  showed the true sibling ranked 6th — one place outside top-5 — with
  an *undocumented-by-me* member (`func_ov021_021aa848`, the "+ 1 ov021
  clone" the source doc names but my own family list initially omitted)
  tied for 5th. Adding it flipped **all 9** queries to hits at once —
  once one member is a valid target, the whole tightly-clustered family
  mutually retrieves itself. This was a gap in the probe's own family
  list, not a retrieval failure; corrected before reporting the final
  number.
- **`RowGroup4_Rebuild` is a genuine, honest miss.** Its true siblings
  rank 19th-22nd — nowhere near top-5, and confirmed not a family-list
  gap (none of its real top-5 are documented members of anything). Per
  `overlay016.md`'s own description it carries an extra conditional
  ("gated on u16 page index") its 4 siblings don't, which is enough
  divergence in the bare mnemonic stream that BM25 can't find its
  family — a real, explainable limit of a representation with no
  operands or structure, not a bug.

## 3. GO — implementation

Added `--fewshot K` to `tools/m2c_feed.py`: queries the target's own
fresh disassembly (tokenized with the exact same `mnemonics_from_objdump`
`export_matched_pairs.py` uses to build the corpus, via the same plain
`objdump -d` invocation — not `m2c_feed.py`'s own `--architecture=armv5te`-
qualified call — so query-time tokenization can't silently diverge from
what's indexed), retrieves the top-K matched `.c` sources via the fixed
`BM25`, and prepends them as a `//`-commented block ahead of the final
output (raw `.s` or `--m2c` draft — `retrieve_fewshot()` reads the
target's disassembly directly from `result.obj`, never from the
possibly-m2c-transformed output text, so the few-shot examples never
leak into m2c's own parse input).

**A real bug caught before it shipped, not after:** the first
implementation wrapped each retrieved source in one `/* ... */` block.
Several matched sources already carry their own `/* header */`
comments (a project convention seen throughout `src/`) — C and GAS
comments don't nest, so the source's own `*/` would close the wrapper
early and leave the remainder as live, mis-parsed code. Switched to
per-line `//` prefixing, immune to the same failure by construction
(no multi-line delimiter to prematurely close); added
`test_survives_source_with_its_own_block_comment` as the regression
guard.

**Tests:** 16 new (`TestFormatFewshotBlock` ×5, `TestRetrieveFewshot`
×5, `TestCliFewshotWiring` ×2, `test_score_reflects_document_term_
frequency_not_query`, plus 3 caught and fixed while writing the tests
themselves — a BM25 postings-candidacy misunderstanding in one fixture,
a `relative_to(ROOT)` crash in `retrieve_fewshot`'s own error path when
`--corpus` points outside the repo tree, and a `with`-block scoping bug
reading a temp file after its directory had already been cleaned up).

**Before/after demo** — `func_ov004_021dc474` (140 B, currently
unmatched, EUR), no cherry-picking involved (picked by "smallest
unmatched in the module with the most residue," per brief 596/600's own
prior findings about ov004):

```
python tools/m2c_feed.py --version eur func_ov004_021dc474 --m2c            -o before.c
python tools/m2c_feed.py --version eur func_ov004_021dc474 --m2c --fewshot 3 -o after.c
```

The target's m2c draft calls `func_ov004_021dbd6c` three times and
`func_ov004_021dbe68` twice. The **top-ranked retrieved sibling**
(`func_ov004_021dc3b8`, already matched, same module) calls those exact
same two helpers — real, substantive shape overlap the retriever found
on its own, not seeded. A human or LLM drafting the real C for this
function now has a working, already-correct example of both callees'
real signatures and calling convention sitting right above the draft,
which is precisely the gap m2c's own output can't fill (it emits `?`
and `void *` placeholders for both).

## Tests

`pytest -q` from the worktree root: `2688 passed, 7 skipped, 9 subtests
passed`. (Also added `pytest.ini` — `tools/m2c_bootstrap.py`, the
existing documented vendor step this brief's demo needed, vendors
third-party test suites under the gitignored `tools/_vendor/` that
pytest's un-scoped default discovery was picking up and failing to
collect; nobody had bootstrapped a vendor tool and run the full suite
from repo root in the same session before, so this was a latent gap,
not something this brief's own changes introduced. Scoped discovery to
`tests/`, where every real project test already lives.)

## Cross-references

- `tools/retrieval_eval.py`, `tests/test_retrieval_eval.py` — the BM25
  scoring fix.
- `tools/m2c_feed.py`, `tests/test_m2c_feed.py` — `--fewshot`.
- `tools/export_matched_pairs.py` — the corpus builder whose tokenizer
  `--fewshot` reuses for query-time consistency.
- `docs/research/tool-scout-swarm-2026-06-19.md` — origin of the
  row-group-rebuild / object-builder / popcount-twins family names and
  the original few-shot-retrieval proposal this brief resolves.
- `docs/research/map/overlay016.md`, `overlay008.md`, `overlay017.md`,
  `retriage/Ov000Deep.md`, `brief-250-c42-escape-classify-family5-n3-family7.md`,
  `brief-273-c23-mmio-drainable-cohort.md` — the family member sources.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
