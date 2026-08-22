[//]: # (markdownlint-disable MD013 MD041)

# Brain rounds 0817-0818 — archived per-round narrative

Lifted verbatim out of [`docs/state.md`](../state.md) on 2026-08-22 under the
standing convention: archive a round narrative once the round after it has
merged. Rounds 0818b and 0822 both landed after these, so both are due.
Nothing here is superseded — it is moved, not retired. The durable
conventions and open questions these rounds produced stayed behind in
`state.md`; what follows is the narrative.

Predecessor: [`brain-rounds-0805-0810.md`](brain-rounds-0805-0810.md).

---

**Round 0818 — merged #1505, #1506, #1507, #1508.**

- **#1508 `cm-main-wall-filtered-sweep-1` — a clean null, honestly obtained.**
  The lane built the P-51 detector (18/18 recall, 1/43 FP against sweep-7's
  shipped negatives) and then **dispatched the flagged arm too**, which is what
  makes the null trustworthy: flagged 11/19 (57.9%) vs passed 37/60 (61.7%),
  Fisher p = 0.7927, holding in both main and overlay slices. It disclosed its
  own pool deviation (19 flagged, not the planned 30) and declined to loosen the
  threshold to hit the number. **P-51 fired zero times across 209 candidates**,
  so the high-confidence half was never actually tested; the weaker
  permutation-cascade proxy is what got measured. Brain-verified: 48 `.c` added
  == 48 `.s` deleted, 7,128 B.
- **#1507 `cm-restock-carve-9` — 694 files, +11,716 B typed-array, and it
  corrected its own kickoff.** The brief cited a 1,076-symbol pool; a fresh tool
  run gives **689**, and the lane treated its own measurement as authoritative
  rather than the brain's number. 689/689 shipped. Reconciles exactly:
  694 files = 689 + 4 + 1, and 11,716 B = 11,588 + 32 + 96.
  **Part 2 killed a standing assumption:** the ~9,690-symbol "zero-reader" pool
  is not reader-less — 100% of the 3,901 `main` `shape=string` symbols checked
  have a real relocation from an *uncarved data pointer table*, invisible to
  `data_worklist.py` because `build_call_graph` only follows function→data
  edges. It also reported a real link failure it caused and the precondition
  that fixes it (screen candidate names against `src/` first).
- **#1506 `q-ledger-ship-coverage` — the ledger bias is closed.** 303 shipped
  events backfilled by mechanical delinks derivation, `-backfilled` provenance
  suffix, `shape`/`park_class` left empty rather than guessed. The demanded
  canary reproduced the brain's independent sweep-7 figure **exactly** (43
  functions / 8,116 B; ov004 8 / ov006 31 / ov011 4). A ship-coverage guard now
  hard-errors a round that flips delinks without recording ships, and it runs in
  `drift-check`, a required context.
- **#1505 `q-park-class-normalisation` — HELD, not merged.** The work itself is
  good: 283 raw values → 91 canonical families, and all three canary cases
  correct (the register-numbering spellings collapse to P-30 with qualifiers
  retained; `C-32` and `C-32-cross-overlay-bl` both → `C-32` with the qualifier
  preserved; P-36 scheduling stays separate from P-30 register-choice). It also
  held the hard constraint exactly — `attempts.tsv` untouched, which is why
  #1506 could append 303 rows to the same file with zero conflict. **But its
  test cannot survive its own campaign's ledger growth**, and the consolidated
  gate caught it: `test_every_ledger_value_has_a_reviewed_mapping` asserts
  `report["rows"] == 1164` against a live, append-only ledger that #1506 and
  #1508 grew to **1,547** in this very round. Dropping #1505 from the
  consolidation cleared the failure and nothing else, confirming the
  attribution. `q-park-class-remap` is seeded to finish it.

**THE BRITTLENESS LESSON DID NOT TRANSFER ACROSS LANES.** #1499
(`q-validator-brittleness`) existed precisely to kill cardinality assertions
against this ledger — "assert the SHAPE of the exemption, not its cardinality" —
and it did, in `test_validate_attempts.py`. In the *same round*, a different
lane wrote four fresh hardcoded counts (`rows`, `raw_distinct`,
`family_distinct`, `parked_rows`) into a different file. A per-file fix does not
generalise; the next round makes it a rule.

**The deeper half of the same finding:** 10 distinct `park_class` values now
have no mapping entry. Two are correct-by-design and must be *scoped out*, not
mapped — `''` (303 backfilled shipped rows, empty by the brain's own
instruction) and `n/a` (48 shipped rows); a shipped row has no park class. The
other 8 are on parked rows, all from `cm-main-wall-filtered-sweep-1`: `P-4`,
`P-17`, `P-20`, `P-36`, `P-42` and `OQ-1` are bare catalog anchors that want an
identity rule, while `strength-reduction` and `tool-anomaly` need real taxonomy
judgment. The brain did **not** guess those at merge — that is the lane's call.

**Brain fix at merge:** #1506 added `import pytest` to
`tests/test_validate_attempts.py`, which fails the `unittest` CI job outright —
that job deliberately installs no third-party packages
(`python -m unittest discover`, `ModuleNotFoundError: No module named 'pytest'`).
Replaced with a stdlib try/except that preserves the assertion's meaning;
mutation-checked that the vacuous-pass regression still fires. **Standing note:
a lane whose gate is `pytest -q tests` can be green locally and still red in CI.
Both runners matter.**

**Two selector programmes have now returned weak-or-null back to back**, while
simply dispatching a sane pool yields ~60%. `cm-main-exploit-drain-1` seeds the
consequence: stop the selector science, drain the remaining ~130 of the 209
qualifying candidates (full EUR, ≤192 B, ≥4 `bl`, unattempted).

**Last updated (previous):** 2026-08-17 — **(Windows PC, brain=Opus 5; roster unchanged.)
Round 0817: the properly-powered confirmation came back NULL, and both
`main`-sweep and restock-carve reached the end of their current method.**
EUR natural-C **16.49%** (393,402 B) / USA **11.84%** (282,428 B) / JPN **11.82%**
(282,000 B) — from the regenerated state-table at the SHA below, not inherited.

All four lanes delivered: **#1502** (`cm-main-tier-sweep-7`), **#1501**
(`cm-restock-carve-8`), **#1500** (`q-shape-classifier-bicne`), **#1499**
(`q-validator-brittleness`).

**CORRECTION (Mac brain, 2026-08-17) — the "three missed rounds" reading in this
round's original note was wrong, and the correct version matters operationally.
The Codex lanes never missed a round and the dispatch path was never broken.**
Rounds 0810-0814 were dispatched from the **Mac**, into Mac worktrees
(`~/Dev/spirit-caller/codex-decomper-queue` / `codex-scaffolder-queue`), while
the PC brain was checking the **Windows** worktrees (`kb-map`, `kb-types`) —
idle precisely because the operator was working on the other machine. Reading a
machine-local worktree as evidence about a lane is only valid on the machine the
lane is running on.

One Codex lane did stop early on 2026-08-14, for an unrelated and now-fixed
cause: the **brain's own canary was impossible**. It demanded a live-`.s`
reproduction of `func_0209e628`, which shipped to C in `cm-main-tier-sweep-3` —
so `src/main/func_0209e628.legacy.c` is on disk and the `.s` exists only in
history. The lane correctly STOPped and reported. The corrected kickoff routed
the repro through `git show 010616b65^:src/main/func_0209e628.s` plus a
unit-level `branch_kind()` check, and that is the version #1500 actually ran —
its PR body's "1,108 live `.s` bodies" and historical `0x0209e628` adjudication
are that correction's fingerprint.

**Standing rule this produced:** a kickoff's `EXPECT` path and its preflight are
**machine-specific**. Never forward a kickoff between machines — re-path it.
A Windows-pathed guard pasted into a Mac session (or the reverse) fails its
location check instantly, which is precisely the void-work class
`tools/kickoff_lint.py` exists to prevent.

**THE HEADLINE RESULT — the callee-count selector is real but WEAK, and it did
not reproduce at full power.** Sweep-7 ran the 50/arm confirmation the previous
two rounds could not statistically support, and got a clean null:

| Round | 0-1 calls | 4+ calls | Gap | Fisher p |
|---|---|---|---|---|
| `main` (#1494) | 10/25 = 40% | 19/25 = 76% | 36 pt | 0.021 |
| `ov002` (#1497) | 6/25 = 24% | 13/25 = 52% | 28 pt | 0.079 |
| ov004/006/011 (#1502, **50/arm**) | 17/50 = 34% | 18/50 = 36% | **2 pt** | **1.0000** |
| **Pooled (200 candidates, 100/arm)** | **33/100 = 33%** | **50/100 = 50%** | **17 pt** | **0.0214** |

Read it honestly: the effect survives pooling at p=0.02, but the one round
designed to be conclusive on its own found nothing, and **the brain's correction
at merge removed the round's escape hatch.** Sweep-7 attributed the null to two
register-choice wall families landing entirely in the HIGH arm and computed that
crediting half of "21 such rows" restores a 22-point gap. Only **12 of those 21
rows are in Part 1 at all** (re-derived from the ledger's own `brief` column; the
other 9 are Part 2 rows). Half-credit gives 24/50 = 48%, **p = 0.2223 — not
significant**; only crediting every Part 1 wall row reaches 30/50 = 60%,
p = 0.0158. The wall concentration is real and one-sided, but it does not rescue
the round.

**So stop selecting on callee count and start selecting against the walls.** The
thing that actually explains this round is wall-family density, not callee count:
Part 2 (4+ calls, 200-376 B) shipped **8/50 = 16%** against a 30-50% prior, and
the same two families followed it into the larger band. New **P-51**
(changed-bool-field register reuse, 18 confirmed members) is now formal.

**Also closed this round:** the restock-carve lane declared its own method
**exhausted** — 548 B of honest headroom left inside the frozen 274-symbol census
— while sampling a **~227,820 B / ~9,690-symbol zero-reader pool** it structurally
cannot see, plus **11,592 B** reachable by merely widening the shape filter. Both
findings are the lane's own, asked for and delivered.

**NEW BRAIN FINDING — the attempts ledger is structurally park-biased.** Shipped
rows are recorded inconsistently across rounds: sweeps 1-2 recorded both results,
sweeps 3/4/5/7 recorded **parks only**, sweep-6 recorded a partial 10. `park_one.py`
is the only recorder and it records parks by design. Consequence: **any ship rate
computed from `attempts.tsv` is biased toward failure** — sweep-4 reads as 25
parked / 0 shipped when it really shipped 75/100. Sweep-7's own kickoff told the
lane to pick its Part 2 band from "~600 recorded attempts", which may be part of
why Part 2 missed so low. Queued to the Codex Scaffolder as `q-ledger-ship-coverage`.

**Also settled in the previous arc:** shape is NOT a usable selector; the
ALIGNALL(2) alignment wall is beatable by TU composition when the composed span is
4-aligned at BOTH ends; **P-50** (composed-TU declaration order collapsing to
ascending size) is PERMANENT with evidence.

✅ **The >700-line problem flagged here last round is fixed.** Rounds 0805-0810's
per-round narrative moved to
[`docs/research/brain-rounds-0805-0810.md`](brain-rounds-0805-0810.md);
this file is back under 400 lines and holds current state, the anchors, the
durable conventions and the open questions. Keep it that way — archive a round's
narrative once the round after it has merged.

