# Safe Queue v3 — topped up after brief-516 + a scoring bug fix

**Status:** build-free analysis, 2026-07-02. Top-up of
[`safe-queue-v2.md`](safe-queue-v2.md), same methodology (containment-gated
ranking per [`brief-514-forensics.md`](../brief-514-forensics.md)), refreshed
against the current state: brief 516's 4 EUR matches, brief 516's own
parked/mentioned addresses, the retriage pool's continued growth, and a
tiebreak bug found and fixed while rebuilding this ranking (§2). Companion
doc: [`../reshape-recipes/contained-reshape-catalog.md`](../reshape-recipes/contained-reshape-catalog.md)
— once a v3 candidate is confirmed contained, that catalog is the fast path
for the instruction-level reshape.

---

## 1. What changed since v2

| Population | v2 | v3 | Delta |
|---|---:|---:|---:|
| Matched (all modules, EUR) | 2,952 | 2,956 | **+4** (brief 516's `0200b1bc`, `0200a454`, `0200592c`, `0200b0c8`) |
| Mentioned in a c-match wave brief (500–516) | 439 | 442 | +3 (brief 516's parked/port addresses) |
| Retriage-tractable (R4–R8) | 538 | 611 | +73 (broader/re-verified parse of the R4–R7 appendix tables — see §2) |
| Retriage blocked/wall | 71 | 72 | +1 |
| Scored candidate population | 3,941 | 4,014 | +73 |

Brief 516's 4 wins are **not** from v2's queue — v2 excludes anything
mentioned in a prior wave brief, and these 4 were the brief-514 forensics
sample (pre-existing HIGH candidates from the 500–512 pool, independently
diagnosed as "localized" i.e. contained). They validate the *containment*
diagnosis and fed the reshape catalog; they don't directly test v2's
never-attempted ranking. None of v2's 150 queued candidates have been
attempted yet.

## 2. A bug found and fixed while rebuilding this ranking

Recomputing the population turned up a tie-heavy score distribution: dozens
of candidates land on the exact same integer score (the scoring formula only
combines a handful of discrete bonuses, so exact ties are common — e.g. 82
candidates tied at score 90, 40 more tied at 85, spanning the v2 cutoff
region). v2's sort used `(-score, tier, addr)` — tier name as a secondary
sort key. Since `'HIGH' < 'MED' < 'RETRIAGE'` alphabetically, **every tied
score band silently favored HIGH-tier candidates over MED and RETRIAGE**,
regardless of the tier baseline's own evidence-grounded ranking (HIGH is
supposed to be the *worst*-evidenced tier per brief 512's 0% yield). This
was not intentional and not previously caught.

Rebuilding v3, this surfaced as HIGH jumping to 34/150 in an intermediate
run — clearly wrong given the tier baseline explicitly ranks HIGH last.
**Fix:** the tiebreak is now address-only (`(-score, addr)`), which carries
no tier bias — ties resolve in an arbitrary but *neutral* order, and
raw population size (MED has 2,551 candidates vs RETRIAGE's 534) is the only
remaining factor that can influence which tier fills a tied band, which is
an honest, if imperfect, consequence of a flat global ranking rather than a
sorting artifact.

**A second-order finding from the same investigation:** RETRIAGE candidates
can **structurally never earn** the clone-cluster bonus (+30) — the
`cluster_id` field's clustering never groups an E/F-class (retriage) function
with an already-matched A–D-class sibling in this worklist. That's a gap in
what the cluster data covers, not evidence that retriage candidates are
lower-quality. Scoring them as if they were, by leaving that gate structurally
closed to them while open to HIGH/MED, would silently under-rank the exact
population (struct-recovered re-triage funcs) this task asks to prefer. §3
documents the resulting adjustment.

## 3. Scoring methodology (same as v2, one addition)

Tier baselines, per-candidate signals, and hard excludes are **identical to
v2** (see [`safe-queue-v2.md`](safe-queue-v2.md) §3 for the full derivation
— tier baseline from brief 512-vs-513 comparative yield, +30 clone-cluster,
+20 leaf, +15 retriage-struct, +10 overlay, size adjustments, Mode
D/static-const hard excludes). One addition:

- **+5 retriage-tier structural compensation.** Applied uniformly to every
  RETRIAGE-tier candidate's score, to offset the clone-cluster-bonus gap
  described in §2. This is a coarse, uniform correction, not a re-derivation
  of the tier baseline from new evidence — flagged here so it's easy to
  revert or replace with something better-calibrated (e.g. a real
  retriage-specific structural-similarity signal) in a future pass.

**A bonus that was tried and rejected:** an early v3 draft added a score
bonus for candidates whose risk-note text matched keywords from the six
[reshape-recipe](../reshape-recipes/contained-reshape-catalog.md) symptoms
(hoping to prioritize "we already know how to fix this exact shape"
candidates). It fired on 142 of 150 top candidates — the keywords
(`movne`/`moveq`, `reload`, `hoist`, `store order`, etc.) are common enough
generic compiler/assembly vocabulary that the match rate was indistinguishable
from noise. **Dropped.** Reliably identifying which specific recipe applies
to a candidate requires reading its actual `.s`, which is exactly the
reshaping step this task is trying to make *faster*, not something a
risk-note keyword scan can shortcut. The catalog is meant to be applied by
whoever works the queue, not pre-tagged onto it.

## 4. The queue

150 candidates, ranked. **`status`:** `carried` = also in v2's top-150 (still
unattempted, still the same rank-worthy candidate — **107 of 150**, i.e. 71%
of v2's list is unchanged and still the right next pick); `NEW` = entered the
top-150 for the first time in this rebuild (**43 of 150**), from the
population growth + tiebreak fix described above. **`predicted-contained?`:**
`YES (high)` ≥105 · `YES (med)` 95–104 · `LIKELY` <95 (queue floor). Tier
split: **103 MED, 42 RETRIAGE, 5 HIGH** — HIGH's near-absence is intentional
and matches v2's finding (brief 512's 0% yield on that tier's most
scrutinized sample); every HIGH entry here cleared an exceptional
clone-cluster-of-matched signal to override that baseline.

Working the queue: same protocol as v2 §6 — write the `.c`, run the brief-514
ARM9-diff containment pre-gate **before** trusting objdiff-100% alone, and
only then reach for the [reshape catalog](../reshape-recipes/contained-reshape-catalog.md)
to close out a contained-but-imperfect diff.

| # | addr | tier | module | size | status | predicted-contained? | why | dossier link |
|---:|------|------|--------|-----:|:---:|:---:|-----|------|
| 1 | `021e2e18` | HIGH | ov002 | 32 | carried | YES (high) | clone-cluster of 2 already-matched sibling(s); leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); tiny (32B) | [021e2e18.md](../../../docs/research/dossiers-high/021e2e18.md) |
| 2 | `021e358c` | HIGH | ov002 | 32 | carried | YES (high) | clone-cluster of 12 already-matched sibling(s); leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); tiny (32B) | [021e358c.md](../../../docs/research/dossiers-high/021e358c.md) |
| 3 | `0229cd70` | HIGH | ov002 | 24 | carried | YES (high) | clone-cluster of 2 already-matched sibling(s); leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); tiny (24B) | [0229cd70.md](../../../docs/research/dossiers-high/0229cd70.md) |
| 4 | `021b28f4` | MED | ov016 | 120 | carried | YES (high) | clone-cluster of 1 already-matched sibling(s); overlay module (contained link unit, not cascading into Entry.c); small (120B) | [021b28f4.c](../../../docs/research/c-match-prep/021b28f4.c) |
| 5 | `021b2e04` | RETRIAGE | ov002 | 184 | carried | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (184B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 6 | `021b9830` | RETRIAGE | ov002 | 148 | carried | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (148B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 7 | `0227d850` | MED | ov002 | 116 | carried | YES (high) | clone-cluster of 1 already-matched sibling(s); overlay module (contained link unit, not cascading into Entry.c); small (116B) | `0227d850.c` (scaffold pruned in b581) |
| 8 | `0228791c` | RETRIAGE | ov002 | 176 | carried | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (176B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 9 | `021ca518` | MED | ov006 | 88 | carried | YES (high) | leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); tiny (88B) | [021ca518.md](../../../docs/research/dossiers/021ca518.md) |
| 10 | `021b4f1c` | MED | ov019 | 192 | carried | YES (med) | leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); small (192B) | [021b4f1c.md](../../../docs/research/dossiers/021b4f1c.md) |
| 11 | `021cab6c` | MED | ov006 | 156 | carried | YES (med) | leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); small (156B) | [021cab6c.md](../../../docs/research/dossiers/021cab6c.md) |
| 12 | `021ceebc` | MED | ov011 | 124 | carried | YES (med) | leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); small (124B) | [021ceebc.md](../../../docs/research/dossiers/021ceebc.md) |
| 13 | `02000d4c` | MED | main | 80 | carried | YES (med) | leaf function (0 callees); main module; tiny (80B) | [02000d4c.md](../../../docs/research/dossiers/02000d4c.md) |
| 14 | `02005d54` | MED | main | 88 | carried | YES (med) | leaf function (0 callees); main module; tiny (88B) | [02005d54.md](../../../docs/research/dossiers/02005d54.md) |
| 15 | `0200aa08` | MED | main | 88 | carried | YES (med) | leaf function (0 callees); main module; tiny (88B) | [0200aa08.md](../../../docs/research/dossiers/0200aa08.md) |
| 16 | `02026f78` | MED | main | 96 | carried | YES (med) | leaf function (0 callees); main module; tiny (96B) | [02026f78.md](../../../docs/research/dossiers/02026f78.md) |
| 17 | `0202e5ac` | MED | main | 96 | carried | YES (med) | leaf function (0 callees); main module; tiny (96B) | [0202e5ac.md](../../../docs/research/dossiers/0202e5ac.md) |
| 18 | `02031afc` | MED | main | 60 | carried | YES (med) | leaf function (0 callees); main module; tiny (60B) | [02031afc.md](../../../docs/research/dossiers/02031afc.md) |
| 19 | `02033a80` | MED | main | 64 | carried | YES (med) | leaf function (0 callees); main module; tiny (64B) | [02033a80.md](../../../docs/research/dossiers/02033a80.md) |
| 20 | `02038908` | MED | main | 80 | carried | YES (med) | leaf function (0 callees); main module; tiny (80B) | [02038908.md](../../../docs/research/dossiers/02038908.md) |
| 21 | `02054b44` | MED | main | 88 | carried | YES (med) | leaf function (0 callees); main module; tiny (88B) | [02054b44.md](../../../docs/research/dossiers/02054b44.md) |
| 22 | `0206afec` | MED | main | 92 | carried | YES (med) | leaf function (0 callees); main module; tiny (92B) | [0206afec.md](../../../docs/research/dossiers/0206afec.md) |
| 23 | `0206f170` | MED | main | 52 | carried | YES (med) | leaf function (0 callees); main module; tiny (52B) | [0206f170.md](../../../docs/research/dossiers/0206f170.md) |
| 24 | `0207103c` | MED | main | 80 | carried | YES (med) | leaf function (0 callees); main module; tiny (80B) | [0207103c.md](../../../docs/research/dossiers/0207103c.md) |
| 25 | `02076cc0` | MED | main | 84 | carried | YES (med) | leaf function (0 callees); main module; tiny (84B) | [02076cc0.md](../../../docs/research/dossiers/02076cc0.md) |
| 26 | `020779d8` | MED | main | 80 | carried | YES (med) | leaf function (0 callees); main module; tiny (80B) | [020779d8.md](../../../docs/research/dossiers/020779d8.md) |
| 27 | `02078ebc` | HIGH | main | 12 | carried | YES (med) | clone-cluster of 3 already-matched sibling(s); leaf function (0 callees); main module; tiny (12B); main-module HIGH: brief-512/514 empirical avalanche zone | [02078ebc.md](../../../docs/research/dossiers-high/02078ebc.md) |
| 28 | `0207e1c4` | MED | main | 80 | carried | YES (med) | leaf function (0 callees); main module; tiny (80B) | [0207e1c4.md](../../../docs/research/dossiers/0207e1c4.md) |
| 29 | `0207e840` | MED | main | 96 | carried | YES (med) | leaf function (0 callees); main module; tiny (96B) | [0207e840.md](../../../docs/research/dossiers/0207e840.md) |
| 30 | `0207ec28` | MED | main | 64 | carried | YES (med) | leaf function (0 callees); main module; tiny (64B) | [0207ec28.md](../../../docs/research/dossiers/0207ec28.md) |
| 31 | `0208060c` | MED | main | 100 | carried | YES (med) | leaf function (0 callees); main module; tiny (100B) | [0208060c.md](../../../docs/research/dossiers/0208060c.md) |
| 32 | `0208541c` | MED | main | 68 | carried | YES (med) | leaf function (0 callees); main module; tiny (68B) | [0208541c.md](../../../docs/research/dossiers/0208541c.md) |
| 33 | `02085460` | MED | main | 68 | carried | YES (med) | leaf function (0 callees); main module; tiny (68B) | [02085460.md](../../../docs/research/dossiers/02085460.md) |
| 34 | `0208b108` | MED | main | 100 | carried | YES (med) | leaf function (0 callees); main module; tiny (100B) | [0208b108.md](../../../docs/research/dossiers/0208b108.md) |
| 35 | `0208c3e4` | MED | main | 68 | carried | YES (med) | leaf function (0 callees); main module; tiny (68B) | [0208c3e4.md](../../../docs/research/dossiers/0208c3e4.md) |
| 36 | `0208ddec` | MED | main | 96 | carried | YES (med) | leaf function (0 callees); main module; tiny (96B) | [0208ddec.md](../../../docs/research/dossiers/0208ddec.md) |
| 37 | `0208de94` | MED | main | 88 | carried | YES (med) | leaf function (0 callees); main module; tiny (88B) | [0208de94.md](../../../docs/research/dossiers/0208de94.md) |
| 38 | `0208e6ac` | MED | main | 84 | carried | YES (med) | leaf function (0 callees); main module; tiny (84B) | [0208e6ac.md](../../../docs/research/dossiers/0208e6ac.md) |
| 39 | `021ab460` | RETRIAGE | ov022 | 80 | carried | YES (med) | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (80B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 40 | `021abe64` | RETRIAGE | ov000 | 100 | carried | YES (med) | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (100B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov000Deep.md](../../../docs/research/retriage/Ov000Deep.md) |
| 41 | `021ac72c` | RETRIAGE | ov000 | 36 | carried | YES (med) | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (36B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 42 | `021ace14` | RETRIAGE | ov018 | 84 | carried | YES (med) | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (84B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 43 | `021b8d9c` | RETRIAGE | ov006 | 68 | carried | YES (med) | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (68B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 44 | `021ca2f8` | RETRIAGE | ov001 | 80 | carried | YES (med) | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (80B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 45 | `0225368c` | RETRIAGE | ov002 | 92 | carried | YES (med) | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (92B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 46 | `022536e8` | RETRIAGE | ov002 | 96 | NEW | YES (med) | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (96B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 47 | `022627ac` | RETRIAGE | ov002 | 88 | NEW | YES (med) | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (88B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 48 | `0200a2f4` | MED | main | 140 | carried | LIKELY | leaf function (0 callees); main module; small (140B) | [0200a2f4.md](../../../docs/research/dossiers/0200a2f4.md) |
| 49 | `0200c078` | MED | main | 108 | carried | LIKELY | leaf function (0 callees); main module; small (108B) | [0200c078.md](../../../docs/research/dossiers/0200c078.md) |
| 50 | `0200c284` | MED | main | 116 | carried | LIKELY | leaf function (0 callees); main module; small (116B) | [0200c284.md](../../../docs/research/dossiers/0200c284.md) |
| 51 | `0200f044` | MED | main | 248 | carried | LIKELY | leaf function (0 callees); main module; small (248B) | [0200f044.md](../../../docs/research/dossiers/0200f044.md) |
| 52 | `0200fa90` | MED | main | 104 | carried | LIKELY | leaf function (0 callees); main module; small (104B) | [0200fa90.md](../../../docs/research/dossiers/0200fa90.md) |
| 53 | `0200fb18` | MED | main | 188 | carried | LIKELY | leaf function (0 callees); main module; small (188B) | [0200fb18.md](../../../docs/research/dossiers/0200fb18.md) |
| 54 | `0200fd1c` | MED | main | 104 | carried | LIKELY | leaf function (0 callees); main module; small (104B) | [0200fd1c.md](../../../docs/research/dossiers/0200fd1c.md) |
| 55 | `02010354` | MED | main | 180 | carried | LIKELY | leaf function (0 callees); main module; small (180B) | [02010354.md](../../../docs/research/dossiers/02010354.md) |
| 56 | `02010a98` | MED | main | 112 | carried | LIKELY | leaf function (0 callees); main module; small (112B) | [02010a98.md](../../../docs/research/dossiers/02010a98.md) |
| 57 | `0201934c` | MED | main | 224 | carried | LIKELY | leaf function (0 callees); main module; small (224B) | [0201934c.md](../../../docs/research/dossiers/0201934c.md) |
| 58 | `0201d620` | MED | main | 148 | carried | LIKELY | leaf function (0 callees); main module; small (148B) | [0201d620.md](../../../docs/research/dossiers/0201d620.md) |
| 59 | `0201ddac` | MED | main | 136 | carried | LIKELY | leaf function (0 callees); main module; small (136B) | [0201ddac.md](../../../docs/research/dossiers/0201ddac.md) |
| 60 | `02023eb8` | MED | main | 112 | carried | LIKELY | leaf function (0 callees); main module; small (112B) | [02023eb8.md](../../../docs/research/dossiers/02023eb8.md) |
| 61 | `02026e38` | MED | main | 160 | carried | LIKELY | leaf function (0 callees); main module; small (160B) | [02026e38.md](../../../docs/research/dossiers/02026e38.md) |
| 62 | `0202c770` | MED | main | 120 | carried | LIKELY | leaf function (0 callees); main module; small (120B) | [0202c770.md](../../../docs/research/dossiers/0202c770.md) |
| 63 | `0202e358` | MED | main | 212 | carried | LIKELY | leaf function (0 callees); main module; small (212B) | [0202e358.md](../../../docs/research/dossiers/0202e358.md) |
| 64 | `0202e6f4` | MED | main | 168 | carried | LIKELY | leaf function (0 callees); main module; small (168B) | [0202e6f4.md](../../../docs/research/dossiers/0202e6f4.md) |
| 65 | `0202e864` | MED | main | 136 | carried | LIKELY | leaf function (0 callees); main module; small (136B) | [0202e864.md](../../../docs/research/dossiers/0202e864.md) |
| 66 | `0202ed04` | MED | main | 140 | carried | LIKELY | leaf function (0 callees); main module; small (140B) | [0202ed04.md](../../../docs/research/dossiers/0202ed04.md) |
| 67 | `0202ed90` | MED | main | 176 | carried | LIKELY | leaf function (0 callees); main module; small (176B) | [0202ed90.md](../../../docs/research/dossiers/0202ed90.md) |
| 68 | `0202ee40` | MED | main | 200 | carried | LIKELY | leaf function (0 callees); main module; small (200B) | [0202ee40.md](../../../docs/research/dossiers/0202ee40.md) |
| 69 | `0202ef38` | MED | main | 196 | carried | LIKELY | leaf function (0 callees); main module; small (196B) | [0202ef38.md](../../../docs/research/dossiers/0202ef38.md) |
| 70 | `0202f218` | MED | main | 204 | carried | LIKELY | leaf function (0 callees); main module; small (204B) | [0202f218.md](../../../docs/research/dossiers/0202f218.md) |
| 71 | `02030b84` | MED | main | 248 | carried | LIKELY | leaf function (0 callees); main module; small (248B) | [02030b84.md](../../../docs/research/dossiers/02030b84.md) |
| 72 | `02031208` | MED | main | 152 | carried | LIKELY | leaf function (0 callees); main module; small (152B) | [02031208.md](../../../docs/research/dossiers/02031208.md) |
| 73 | `020312a0` | MED | main | 184 | carried | LIKELY | leaf function (0 callees); main module; small (184B) | [020312a0.md](../../../docs/research/dossiers/020312a0.md) |
| 74 | `02031684` | MED | main | 224 | carried | LIKELY | leaf function (0 callees); main module; small (224B) | [02031684.md](../../../docs/research/dossiers/02031684.md) |
| 75 | `02031c8c` | MED | main | 128 | carried | LIKELY | leaf function (0 callees); main module; small (128B) | [02031c8c.md](../../../docs/research/dossiers/02031c8c.md) |
| 76 | `020384e8` | MED | main | 172 | carried | LIKELY | leaf function (0 callees); main module; small (172B) | [020384e8.md](../../../docs/research/dossiers/020384e8.md) |
| 77 | `020385f8` | MED | main | 124 | carried | LIKELY | leaf function (0 callees); main module; small (124B) | [020385f8.md](../../../docs/research/dossiers/020385f8.md) |
| 78 | `02038674` | MED | main | 128 | carried | LIKELY | leaf function (0 callees); main module; small (128B) | [02038674.md](../../../docs/research/dossiers/02038674.md) |
| 79 | `02038f3c` | MED | main | 116 | carried | LIKELY | leaf function (0 callees); main module; small (116B) | [02038f3c.md](../../../docs/research/dossiers/02038f3c.md) |
| 80 | `02038fb0` | MED | main | 112 | carried | LIKELY | leaf function (0 callees); main module; small (112B) | [02038fb0.md](../../../docs/research/dossiers/02038fb0.md) |
| 81 | `0204937c` | MED | main | 180 | carried | LIKELY | leaf function (0 callees); main module; small (180B) | [0204937c.md](../../../docs/research/dossiers/0204937c.md) |
| 82 | `02049554` | MED | main | 224 | carried | LIKELY | leaf function (0 callees); main module; small (224B) | [02049554.md](../../../docs/research/dossiers/02049554.md) |
| 83 | `02052398` | MED | main | 140 | carried | LIKELY | leaf function (0 callees); main module; small (140B) | [02052398.md](../../../docs/research/dossiers/02052398.md) |
| 84 | `0205340c` | MED | main | 124 | carried | LIKELY | leaf function (0 callees); main module; small (124B) | [0205340c.md](../../../docs/research/dossiers/0205340c.md) |
| 85 | `02054a30` | MED | main | 160 | carried | LIKELY | leaf function (0 callees); main module; small (160B) | [02054a30.md](../../../docs/research/dossiers/02054a30.md) |
| 86 | `020665e0` | MED | main | 112 | carried | LIKELY | leaf function (0 callees); main module; small (112B) | [020665e0.md](../../../docs/research/dossiers/020665e0.md) |
| 87 | `02068890` | MED | main | 108 | carried | LIKELY | leaf function (0 callees); main module; small (108B) | [02068890.md](../../../docs/research/dossiers/02068890.md) |
| 88 | `0206a724` | MED | main | 140 | carried | LIKELY | leaf function (0 callees); main module; small (140B) | [0206a724.md](../../../docs/research/dossiers/0206a724.md) |
| 89 | `0206b814` | MED | main | 120 | carried | LIKELY | leaf function (0 callees); main module; small (120B) | [0206b814.md](../../../docs/research/dossiers/0206b814.md) |
| 90 | `0206baec` | MED | main | 124 | carried | LIKELY | leaf function (0 callees); main module; small (124B) | [0206baec.md](../../../docs/research/dossiers/0206baec.md) |
| 91 | `0206cf10` | MED | main | 144 | carried | LIKELY | leaf function (0 callees); main module; small (144B) | [0206cf10.md](../../../docs/research/dossiers/0206cf10.md) |
| 92 | `02072444` | MED | main | 132 | carried | LIKELY | leaf function (0 callees); main module; small (132B) | [02072444.md](../../../docs/research/dossiers/02072444.md) |
| 93 | `02072544` | MED | main | 188 | carried | LIKELY | leaf function (0 callees); main module; small (188B) | [02072544.md](../../../docs/research/dossiers/02072544.md) |
| 94 | `02073fc8` | MED | main | 192 | carried | LIKELY | leaf function (0 callees); main module; small (192B) | [02073fc8.md](../../../docs/research/dossiers/02073fc8.md) |
| 95 | `020778c4` | MED | main | 144 | carried | LIKELY | leaf function (0 callees); main module; small (144B) | [020778c4.md](../../../docs/research/dossiers/020778c4.md) |
| 96 | `02077954` | MED | main | 132 | carried | LIKELY | leaf function (0 callees); main module; small (132B) | [02077954.md](../../../docs/research/dossiers/02077954.md) |
| 97 | `02078dcc` | MED | main | 112 | NEW | LIKELY | leaf function (0 callees); main module; small (112B) | [02078dcc.md](../../../docs/research/dossiers/02078dcc.md) |
| 98 | `02078e3c` | MED | main | 128 | NEW | LIKELY | leaf function (0 callees); main module; small (128B) | [02078e3c.md](../../../docs/research/dossiers/02078e3c.md) |
| 99 | `02079b48` | MED | main | 116 | NEW | LIKELY | leaf function (0 callees); main module; small (116B) | [02079b48.md](../../../docs/research/dossiers/02079b48.md) |
| 100 | `02079cc0` | MED | main | 112 | NEW | LIKELY | leaf function (0 callees); main module; small (112B) | [02079cc0.md](../../../docs/research/dossiers/02079cc0.md) |
| 101 | `0207b18c` | MED | main | 164 | NEW | LIKELY | leaf function (0 callees); main module; small (164B) | [0207b18c.md](../../../docs/research/dossiers/0207b18c.md) |
| 102 | `0207cff4` | MED | main | 104 | NEW | LIKELY | leaf function (0 callees); main module; small (104B) | [0207cff4.md](../../../docs/research/dossiers/0207cff4.md) |
| 103 | `0207e0a8` | MED | main | 124 | NEW | LIKELY | leaf function (0 callees); main module; small (124B) | [0207e0a8.md](../../../docs/research/dossiers/0207e0a8.md) |
| 104 | `0207ef90` | MED | main | 204 | NEW | LIKELY | leaf function (0 callees); main module; small (204B) | [0207ef90.md](../../../docs/research/dossiers/0207ef90.md) |
| 105 | `0207f05c` | MED | main | 220 | NEW | LIKELY | leaf function (0 callees); main module; small (220B) | [0207f05c.md](../../../docs/research/dossiers/0207f05c.md) |
| 106 | `020801ac` | MED | main | 212 | NEW | LIKELY | leaf function (0 callees); main module; small (212B) | [020801ac.md](../../../docs/research/dossiers/020801ac.md) |
| 107 | `02081c84` | MED | main | 148 | NEW | LIKELY | leaf function (0 callees); main module; small (148B) | [02081c84.md](../../../docs/research/dossiers/02081c84.md) |
| 108 | `02084bc8` | MED | main | 112 | NEW | LIKELY | leaf function (0 callees); main module; small (112B) | [02084bc8.md](../../../docs/research/dossiers/02084bc8.md) |
| 109 | `02086848` | MED | main | 132 | NEW | LIKELY | leaf function (0 callees); main module; small (132B) | [02086848.md](../../../docs/research/dossiers/02086848.md) |
| 110 | `02086ea0` | MED | main | 132 | NEW | LIKELY | leaf function (0 callees); main module; small (132B) | [02086ea0.md](../../../docs/research/dossiers/02086ea0.md) |
| 111 | `0208b1e0` | MED | main | 196 | NEW | LIKELY | leaf function (0 callees); main module; small (196B) | [0208b1e0.md](../../../docs/research/dossiers/0208b1e0.md) |
| 112 | `0208bfc4` | MED | main | 136 | NEW | LIKELY | leaf function (0 callees); main module; small (136B) | [0208bfc4.md](../../../docs/research/dossiers/0208bfc4.md) |
| 113 | `0208c2e0` | MED | main | 104 | NEW | LIKELY | leaf function (0 callees); main module; small (104B) | [0208c2e0.md](../../../docs/research/dossiers/0208c2e0.md) |
| 114 | `0208c8cc` | MED | main | 116 | NEW | LIKELY | leaf function (0 callees); main module; small (116B) | [0208c8cc.md](../../../docs/research/dossiers/0208c8cc.md) |
| 115 | `0208df94` | MED | main | 128 | NEW | LIKELY | leaf function (0 callees); main module; small (128B) | [0208df94.md](../../../docs/research/dossiers/0208df94.md) |
| 116 | `0208e014` | MED | main | 140 | NEW | LIKELY | leaf function (0 callees); main module; small (140B) | [0208e014.md](../../../docs/research/dossiers/0208e014.md) |
| 117 | `0208e0a0` | MED | main | 128 | NEW | LIKELY | leaf function (0 callees); main module; small (128B) | [0208e0a0.md](../../../docs/research/dossiers/0208e0a0.md) |
| 118 | `0208e120` | MED | main | 140 | NEW | LIKELY | leaf function (0 callees); main module; small (140B) | [0208e120.md](../../../docs/research/dossiers/0208e120.md) |
| 119 | `0208ea74` | MED | main | 204 | NEW | LIKELY | leaf function (0 callees); main module; small (204B) | [0208ea74.md](../../../docs/research/dossiers/0208ea74.md) |
| 120 | `021ab804` | RETRIAGE | ov022 | 164 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (164B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 121 | `021abcc4` | RETRIAGE | ov005 | 244 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (244B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [SmallOverlaysRetriageR8.md](../../../docs/research/retriage/SmallOverlaysRetriageR8.md) |
| 122 | `021ac098` | RETRIAGE | ov000 | 172 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (172B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 123 | `021ac91c` | RETRIAGE | ov005 | 104 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (104B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [SmallOverlaysRetriageR8.md](../../../docs/research/retriage/SmallOverlaysRetriageR8.md) |
| 124 | `021ae218` | RETRIAGE | ov000 | 180 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (180B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov000Deep.md](../../../docs/research/retriage/Ov000Deep.md) |
| 125 | `021ae2cc` | RETRIAGE | ov000 | 200 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (200B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov000Deep.md](../../../docs/research/retriage/Ov000Deep.md) |
| 126 | `021b08a8` | RETRIAGE | ov002 | 136 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (136B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 127 | `021b0a30` | RETRIAGE | ov002 | 220 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (220B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 128 | `021b1e80` | RETRIAGE | ov002 | 160 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (160B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 129 | `021b29c0` | RETRIAGE | ov002 | 244 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (244B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 130 | `021b2b80` | HIGH | ov010 | 120 | carried | LIKELY | clone-cluster of 1 already-matched sibling(s); overlay module (contained link unit, not cascading into Entry.c); small (120B) | [021b2b80.md](../../../docs/research/dossiers-high/021b2b80.md) |
| 131 | `021b33dc` | RETRIAGE | ov017 | 232 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (232B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov017Ov019Retriage.md](../../../docs/research/retriage/Ov017Ov019Retriage.md) |
| 132 | `021b3864` | RETRIAGE | ov002 | 244 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (244B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 133 | `021b3a78` | RETRIAGE | ov016 | 156 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (156B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [SmallOverlaysRetriageR8.md](../../../docs/research/retriage/SmallOverlaysRetriageR8.md) |
| 134 | `021b3e14` | RETRIAGE | ov015 | 184 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (184B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [SmallOverlaysRetriageR8.md](../../../docs/research/retriage/SmallOverlaysRetriageR8.md) |
| 135 | `021b5f60` | RETRIAGE | ov006 | 132 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (132B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 136 | `021b6e3c` | RETRIAGE | ov006 | 220 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (220B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov004Ov006DeepR9.md](../../../docs/research/retriage/Ov004Ov006DeepR9.md) |
| 137 | `021b79ac` | RETRIAGE | ov006 | 116 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (116B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 138 | `021b7a20` | RETRIAGE | ov006 | 128 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (128B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 139 | `021b7db0` | RETRIAGE | ov006 | 208 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (208B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov004Ov006DeepR8.md](../../../docs/research/retriage/Ov004Ov006DeepR8.md) |
| 140 | `021bbda8` | RETRIAGE | ov002 | 228 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (228B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 141 | `021bd85c` | RETRIAGE | ov002 | 236 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (236B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 142 | `021c1954` | RETRIAGE | ov002 | 216 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (216B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriageR8.md](../../../docs/research/retriage/Ov002EFRetriageR8.md) |
| 143 | `021c2c54` | RETRIAGE | ov002 | 224 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (224B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 144 | `021c32d4` | RETRIAGE | ov002 | 124 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (124B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 145 | `021c4bd4` | RETRIAGE | ov006 | 240 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (240B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov004Ov006DeepR9.md](../../../docs/research/retriage/Ov004Ov006DeepR9.md) |
| 146 | `021ca70c` | RETRIAGE | ov013 | 192 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (192B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 147 | `021cca04` | RETRIAGE | ov011 | 212 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (212B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 148 | `021d1974` | RETRIAGE | ov002 | 224 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (224B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 149 | `021d1f04` | RETRIAGE | ov011 | 152 | carried | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (152B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov011Deep.md](../../../docs/research/retriage/Ov011Deep.md) |
| 150 | `021d3a7c` | RETRIAGE | ov004 | 248 | NEW | LIKELY | re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (248B); tier-baseline adjustment: retriage structurally cannot earn clone-cluster bonus (E/F clusters do not overlap matched A-D clusters) -- +5 compensates so population size does not silently crowd it out at tied scores | [Ov004Ov006DeepR9.md](../../../docs/research/retriage/Ov004Ov006DeepR9.md) |
