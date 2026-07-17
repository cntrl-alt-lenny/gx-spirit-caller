# Safe Queue v2 — the containment-gated work order

**Status:** build-free analysis, 2026-07-02. Source: brief-514-forensics.md
(HIGH sha1-failure forensics), `docs/research/c-match-worklist.json`
population data, `docs/research/objdiff-sha1-gap/gap-taxonomy.md` (Mode A-E),
brief-512/brief-513 comparative yield, and the full dossier + retriage corpus
built across the ground-truth-dossier and R4-R8 retriage lanes.

This is the ranked work order for the next campaign waves under the
**containment-gated process**: a candidate only enters the queue if it
scores well on *predicted containment* — the property brief 514 discovered
is necessary but was never being checked before. Pool/callee correctness
(what the ground-truth dossiers fixed) is necessary but **not sufficient**.

---

## 1. Why this queue exists — the containment gap

[`brief-514-forensics.md`](../brief-514-forensics.md) re-sampled 12 of the
112 `sha1-fail-despite-objdiff` parks from brief 512 and found the failures
split into two structurally different buckets:

| Bucket | Count (of 12) | Meaning |
|---|---:|---|
| Localized candidate-byte mismatch | 6 | Correct pool/callee values are not enough; needs instruction-level C reshaping. **The failure is real but contained** — a normal iteration problem. |
| Link/layout avalanche (same size) | 3 | The uncompressed `arm9.bin` diff starts *before* the candidate (often at `src/main/Entry.c`) and fans out through hundreds of thousands of bytes. Not a pool/callee error — a link/layout/relocation perturbation from dropping in the C unit. |
| Link/layout avalanche + ARM9 size growth | 3 | Same as above, plus the uncompressed ARM9 image grew by `0x20` bytes. |

Half the sample avalanched. Brief 514's verdict established a new scouting
predicate that this campaign was not applying:

```text
candidate is worth iteration =
  (uncompressed ARM9 diff is contained in candidate range)
  and (candidate/object size did not perturb linked layout)
```

**The corroborating evidence is stark.** Brief 512 ran the *exact* HIGH-tier
population that had already failed sha1 once, re-attempted it with
ground-truth-enforced dossiers (pool words and callee targets verified
byte-exact against the `.s`), and got **0 / 119 = 0.0%** acceptance — "the
dossiers did not lift the first old-fail HIGH tranche." Brief 514 explains
why: ground-truth correctness has nothing to do with the avalanche failure
mode. Meanwhile brief 513, run concurrently on MED-tier + retriage-pool
candidates with the *same* ground-truth dossiers, got **10/13 = 77%** wave
acceptance (63.6% on regular MED-tail, 50% on retriage pool). Tier alone is
a strong empirical signal, independent of anything about individual
candidates.

**What causes avalanche is not fully diagnosed.** Growth (`+0x20` bytes)
correlates with avalanche in every brief-514 sample that showed it, but
avalanche also happened in samples with *no* documented growth
(`02007f38`, `0200bff4`) — so size stability alone does not guarantee
containment. This queue is a **predictive heuristic** built from the
observable signals brief 514 and the campaign's own structure make
available build-free, not a guarantee. Every entry still needs the real
gate: `ninja -j4 rom` + `ninja -j4 sha1`, with the brief-514 ARM9-diff
containment check run *before* accepting.

---

## 2. Population accounting

| Population | Count |
|---|---:|
| Total functions in `c-match-worklist.json` | 6,573 |
| Already matched (on `main`, all modules, EUR) | 2,952 |
| Mentioned in any c-match wave brief (500–514) — recently attempted, exclude | 439 |
| Retriage-tractable (R4–R8, newly-tractable with struct/GT evidence) | 538 |
| Retriage confirmed-wall/blocked (excluded) | 71 |
| **Candidate universe after exclusions** (HIGH+MED class A–D, tract high/med, plus retriage pool, minus matched/attempted/blocked) | **3,942** |
| Hard-excluded for Mode D (`.s`-only, pool dedup — literally cannot be a safe C candidate) or literal `static const`/initialized-static in an existing prep draft | 1 (post-filter) |
| **Scored population** | **3,941** |
| **This queue (top-ranked)** | **150** |

Of the 150: **65 are re-triage-pool** (R4–R8 struct-recovered candidates),
**80 are regular MED-tier**, **5 are HIGH-tier** (only where an exceptional
positive signal overrides the tier's poor empirical track record — see
§3). No queue entry required a `static const` array, an initialized
static, or carries a Mode-D (pool-dedup / `.s`-only) flag.

---

## 3. Scoring methodology

Every candidate starts from a **tier baseline** set directly from the
brief-512-vs-513 comparative yield (not a guess — this is the strongest
single piece of evidence this campaign has about tier-level containment
risk):

| Tier | Baseline | Grounded in |
|---|---:|---|
| MED (regular tail) | 65 | brief 513: 63.6% yield on regular MED-tail dossiers |
| RETRIAGE (re-triage pool) | 55 | brief 513: 50.0% yield on retriage-pool dossiers |
| HIGH | 45 | brief 512: 0.0% yield on the ground-truth-enforced old-fail HIGH tranche |

From that baseline, per-candidate signals adjust the score:

**Positive (the task's PREFER list):**
- **+30 clone-cluster of an already-matched sibling.** `c-match-worklist.json`
  carries a `cluster_id` grouping structurally-similar functions (verified:
  cluster members share near-identical size/recipe text — e.g. cluster 0 is
  16 `main` functions all 104B, notes reading "clone dispatch copy-vs-func,
  reg-alloc"). If any *other* member of a candidate's cluster is already
  matched and shipped, that is direct, empirical proof the pattern clears
  `ninja sha1` cleanly — the single strongest signal available.
- **+20 leaf function** (0 BL/callee targets, per dossier or retriage
  GROUND TRUTH). Fewer callees means fewer places for a wrong-address miss
  to hide, and a smaller call graph gives the linker less to reflow if
  anything nearby shifts.
- **+15 re-triage candidate with a recovered struct** (has a `Struct/data
  needed` section and/or a GROUND TRUTH pool/BL block in its retriage doc).
  This is a genuine additional data point beyond the tier baseline — a
  struct-backed retriage candidate is better-understood than a bare
  worklist entry with only a one-line swarm note.
- **+10 overlay module** (not `main`). This is a **reasoned inference**,
  not a proven fact: every one of brief 514's six avalanche samples was a
  `main`-module candidate whose diff owner was `src/main/Entry.c` — i.e.
  the same ARM9 main link unit. NDS overlays are separately-built link
  units (their own delink/relink pass, connected to main only via defined
  call veneers per `CLAUDE.md`'s overlay-system description), so a size
  perturbation inside one overlay has a structurally smaller blast radius
  than one inside main's own text, which sits in the same link unit as
  Entry.c. Brief 514's sample never touched an overlay candidate, so this
  is inference from architecture + the specific empirical pattern, not
  itself brief-514-proven — flagged here so the next forensic pass can
  test it directly.
- **+10 / +5 tiny/small size** (≤100B / ≤250B). Smaller functions have less
  literal-pool and instruction-count surface for the kind of unaccounted
  byte-count drift brief 514 observed.

**Negative (the task's DOWN-rank list):**
- **Hard exclude: Mode D** (dossier classifies the candidate as
  `.s`-only / pool-dedup — literally cannot compile to the same byte count
  as the original, confirmed in `docs/research/objdiff-sha1-gap/gap-taxonomy.md`).
- **Hard exclude: literal `static const` / initialized-static array** in
  an existing `c-match-prep` draft (Mode C — generates an extra `.rodata`/
  `.data` section not in the delinked gap object; this is *exactly* the
  class of change that produces a size-driven layout perturbation).
- **-15 / -5 large / medium-large size** (>800B / >400B) — larger bodies
  give suboptimal C-shaping more room to drift from the original's exact
  byte count.
- **-10 main-module HIGH specifically** — brief 512's 0% sample and brief
  514's Entry.c-avalanche pattern are *both* main-module HIGH-tier
  observations; this is the one population with direct negative evidence,
  so it's penalized on top of its low tier baseline rather than only once.

**`predicted-contained?` column:** `YES (high)` = score ≥105, `YES (med)` =
score 95–104, `LIKELY` = score 90–94 (the queue's floor). None of these are
certainties — they are the ranking, translated into a coarse confidence
label for the next wave's triage.

---

## 4. Known limitations (read before treating this as gospel)

- **The avalanche mechanism itself is not fully diagnosed.** Two of
  brief 514's six avalanche samples had no documented size growth, so
  "small + no static arrays" is a strong but incomplete predictor. Treat
  every queue entry as *prioritized for the containment pre-gate*, not
  pre-verified.
- **The overlay-vs-main containment argument (+10) is inference, not
  brief-514-measured fact** — brief 514's whole sample was main-module.
  The next forensic pass should deliberately sample a few overlay-module
  avalanche/non-avalanche outcomes to confirm or retire this signal.
- **The brief-attempted exclusion (439 addresses) is a text-mention
  scrape** across `brief-5[01][0-9]-*.md`, not an exhaustive ledger (the
  full brief-512 119-candidate park list isn't individually enumerated in
  its own brief text — only ~20 addresses are named directly). Some
  addresses in this queue may have been touched in a wave that didn't
  name them explicitly; if the next wave hits an unexpected duplicate,
  that's this limitation surfacing, not a queue-construction bug.
- **Retriage-tractable evidence is two-tiered.** 315 of the 538 retriage
  candidates have a full GROUND-TRUTH pool/BL block (R8's format, and a
  few R7 docs); the other 223 come from an R4–R6 appendix *table* row
  (struct-name only, no full pool/callee extraction). Both count toward
  the `+15` bonus, but the table-row tier is weaker evidence — the `why`
  column doesn't distinguish them; check the dossier link's `file` if it
  matters for a specific pick.
- **Clone-cluster is a structural-similarity proxy, not a guarantee of
  identical layout risk** — cluster membership comes from the original
  swarm's own classification (size + recipe-text similarity), not a
  byte-level clone proof.

---

## 5. The queue

`predicted-contained?`: `YES (high)` ≥105 · `YES (med)` 95–104 · `LIKELY` 90–94.
| # | addr | tier | module | size | predicted-contained? | why | dossier link |
|---:|------|------|--------|-----:|:---:|-----|------|
| 1 | `021e2e18` | HIGH | ov002 | 32 | YES (high) | clone-cluster of 2 already-matched sibling(s); leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); tiny (32B) | [021e2e18.md](../../../docs/research/dossiers-high/021e2e18.md) |
| 2 | `021e358c` | HIGH | ov002 | 32 | YES (high) | clone-cluster of 12 already-matched sibling(s); leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); tiny (32B) | [021e358c.md](../../../docs/research/dossiers-high/021e358c.md) |
| 3 | `0229cd70` | HIGH | ov002 | 24 | YES (high) | clone-cluster of 2 already-matched sibling(s); leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); tiny (24B) | [0229cd70.md](../../../docs/research/dossiers-high/0229cd70.md) |
| 4 | `021b28f4` | MED | ov016 | 120 | YES (high) | clone-cluster of 1 already-matched sibling(s); overlay module (contained link unit, not cascading into Entry.c); small (120B) | [021b28f4.c](../../../docs/research/c-match-prep/021b28f4.c) |
| 5 | `0227d850` | MED | ov002 | 116 | YES (high) | clone-cluster of 1 already-matched sibling(s); overlay module (contained link unit, not cascading into Entry.c); small (116B) | `0227d850.c` (scaffold pruned in b581) |
| 6 | `021ab460` | RETRIAGE | ov022 | 80 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (80B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 7 | `021abe64` | RETRIAGE | ov000 | 100 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (100B) | [Ov000Deep.md](../../../docs/research/retriage/Ov000Deep.md) |
| 8 | `021ac72c` | RETRIAGE | ov000 | 36 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (36B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 9 | `021ace14` | RETRIAGE | ov018 | 84 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (84B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 10 | `021b8d9c` | RETRIAGE | ov006 | 68 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (68B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 11 | `021ca2f8` | RETRIAGE | ov001 | 80 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (80B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 12 | `0225368c` | RETRIAGE | ov002 | 92 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); tiny (92B) | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 13 | `021ca518` | MED | ov006 | 88 | YES (high) | leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); tiny (88B) | [021ca518.md](../../../docs/research/dossiers/021ca518.md) |
| 14 | `021ab804` | RETRIAGE | ov022 | 164 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (164B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 15 | `021ac098` | RETRIAGE | ov000 | 172 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (172B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 16 | `021ac91c` | RETRIAGE | ov005 | 104 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (104B) | [SmallOverlaysRetriageR8.md](../../../docs/research/retriage/SmallOverlaysRetriageR8.md) |
| 17 | `021ae218` | RETRIAGE | ov000 | 180 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (180B) | [Ov000Deep.md](../../../docs/research/retriage/Ov000Deep.md) |
| 18 | `021ae2cc` | RETRIAGE | ov000 | 200 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (200B) | [Ov000Deep.md](../../../docs/research/retriage/Ov000Deep.md) |
| 19 | `021b0a30` | RETRIAGE | ov002 | 220 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (220B) | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 20 | `021b2e04` | RETRIAGE | ov002 | 184 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (184B) | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 21 | `021b5f60` | RETRIAGE | ov006 | 132 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (132B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 22 | `021b79ac` | RETRIAGE | ov006 | 116 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (116B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 23 | `021b7a20` | RETRIAGE | ov006 | 128 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (128B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 24 | `021b9830` | RETRIAGE | ov002 | 148 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (148B) | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 25 | `021ca70c` | RETRIAGE | ov013 | 192 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (192B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 26 | `021cca04` | RETRIAGE | ov011 | 212 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (212B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 27 | `021d1f04` | RETRIAGE | ov011 | 152 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (152B) | [Ov011Deep.md](../../../docs/research/retriage/Ov011Deep.md) |
| 28 | `021d5b14` | RETRIAGE | ov004 | 136 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (136B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 29 | `021d62b8` | RETRIAGE | ov004 | 204 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (204B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 30 | `021da2c8` | RETRIAGE | ov004 | 164 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (164B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 31 | `022157e4` | RETRIAGE | ov002 | 220 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (220B) | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 32 | `02256a50` | RETRIAGE | ov002 | 120 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (120B) | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 33 | `02257750` | RETRIAGE | ov002 | 140 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (140B) | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 34 | `0228791c` | RETRIAGE | ov002 | 176 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (176B) | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 35 | `02299c9c` | RETRIAGE | ov002 | 152 | YES (high) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); small (152B) | [Ov002EFRetriage.md](../../../docs/research/retriage/Ov002EFRetriage.md) |
| 36 | `021b4f1c` | MED | ov019 | 192 | YES (med) | leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); small (192B) | [021b4f1c.md](../../../docs/research/dossiers/021b4f1c.md) |
| 37 | `021cab6c` | MED | ov006 | 156 | YES (med) | leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); small (156B) | [021cab6c.md](../../../docs/research/dossiers/021cab6c.md) |
| 38 | `021ceebc` | MED | ov011 | 124 | YES (med) | leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); small (124B) | [021ceebc.md](../../../docs/research/dossiers/021ceebc.md) |
| 39 | `020a724c` | RETRIAGE | main | 28 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; main module; tiny (28B) | [MainEFRetriage.md](../../../docs/research/retriage/MainEFRetriage.md) |
| 40 | `021aad10` | RETRIAGE | ov020 | 252 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [Ov016Ov020Ov015Retriage.md](../../../docs/research/retriage/Ov016Ov020Ov015Retriage.md) |
| 41 | `021ab4b0` | RETRIAGE | ov022 | 280 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 42 | `021ac920` | RETRIAGE | ov000 | 264 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 43 | `021b3a84` | RETRIAGE | ov014 | 280 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [SmallOverlaysRetriageR8.md](../../../docs/research/retriage/SmallOverlaysRetriageR8.md) |
| 44 | `021c9f24` | RETRIAGE | ov001 | 336 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 45 | `021ca024` | RETRIAGE | ov013 | 312 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 46 | `021ca15c` | RETRIAGE | ov013 | 312 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 47 | `021cabbc` | RETRIAGE | ov011 | 304 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 48 | `021caedc` | RETRIAGE | ov004 | 388 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 49 | `021cb25c` | RETRIAGE | ov011 | 344 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [Ov011Deep.md](../../../docs/research/retriage/Ov011Deep.md) |
| 50 | `021cb3b4` | RETRIAGE | ov011 | 332 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 51 | `02078ebc` | HIGH | main | 12 | YES (med) | clone-cluster of 3 already-matched sibling(s); leaf function (0 callees); main module; tiny (12B); main-module HIGH: brief-512/514 empirical avalanche zone | [02078ebc.md](../../../docs/research/dossiers-high/02078ebc.md) |
| 52 | `02000d4c` | MED | main | 80 | YES (med) | leaf function (0 callees); main module; tiny (80B) | [02000d4c.md](../../../docs/research/dossiers/02000d4c.md) |
| 53 | `02005d54` | MED | main | 88 | YES (med) | leaf function (0 callees); main module; tiny (88B) | [02005d54.md](../../../docs/research/dossiers/02005d54.md) |
| 54 | `0200aa08` | MED | main | 88 | YES (med) | leaf function (0 callees); main module; tiny (88B) | [0200aa08.md](../../../docs/research/dossiers/0200aa08.md) |
| 55 | `02026f78` | MED | main | 96 | YES (med) | leaf function (0 callees); main module; tiny (96B) | [02026f78.md](../../../docs/research/dossiers/02026f78.md) |
| 56 | `0202e5ac` | MED | main | 96 | YES (med) | leaf function (0 callees); main module; tiny (96B) | [0202e5ac.md](../../../docs/research/dossiers/0202e5ac.md) |
| 57 | `02031afc` | MED | main | 60 | YES (med) | leaf function (0 callees); main module; tiny (60B) | [02031afc.md](../../../docs/research/dossiers/02031afc.md) |
| 58 | `02033a80` | MED | main | 64 | YES (med) | leaf function (0 callees); main module; tiny (64B) | [02033a80.md](../../../docs/research/dossiers/02033a80.md) |
| 59 | `02038908` | MED | main | 80 | YES (med) | leaf function (0 callees); main module; tiny (80B) | [02038908.md](../../../docs/research/dossiers/02038908.md) |
| 60 | `02054b44` | MED | main | 88 | YES (med) | leaf function (0 callees); main module; tiny (88B) | [02054b44.md](../../../docs/research/dossiers/02054b44.md) |
| 61 | `0206afec` | MED | main | 92 | YES (med) | leaf function (0 callees); main module; tiny (92B) | [0206afec.md](../../../docs/research/dossiers/0206afec.md) |
| 62 | `0206f170` | MED | main | 52 | YES (med) | leaf function (0 callees); main module; tiny (52B) | [0206f170.md](../../../docs/research/dossiers/0206f170.md) |
| 63 | `0207103c` | MED | main | 80 | YES (med) | leaf function (0 callees); main module; tiny (80B) | [0207103c.md](../../../docs/research/dossiers/0207103c.md) |
| 64 | `02076cc0` | MED | main | 84 | YES (med) | leaf function (0 callees); main module; tiny (84B) | [02076cc0.md](../../../docs/research/dossiers/02076cc0.md) |
| 65 | `020779d8` | MED | main | 80 | YES (med) | leaf function (0 callees); main module; tiny (80B) | [020779d8.md](../../../docs/research/dossiers/020779d8.md) |
| 66 | `0207e1c4` | MED | main | 80 | YES (med) | leaf function (0 callees); main module; tiny (80B) | [0207e1c4.md](../../../docs/research/dossiers/0207e1c4.md) |
| 67 | `0207e840` | MED | main | 96 | YES (med) | leaf function (0 callees); main module; tiny (96B) | [0207e840.md](../../../docs/research/dossiers/0207e840.md) |
| 68 | `0207ec28` | MED | main | 64 | YES (med) | leaf function (0 callees); main module; tiny (64B) | [0207ec28.md](../../../docs/research/dossiers/0207ec28.md) |
| 69 | `0208060c` | MED | main | 100 | YES (med) | leaf function (0 callees); main module; tiny (100B) | [0208060c.md](../../../docs/research/dossiers/0208060c.md) |
| 70 | `0208541c` | MED | main | 68 | YES (med) | leaf function (0 callees); main module; tiny (68B) | [0208541c.md](../../../docs/research/dossiers/0208541c.md) |
| 71 | `02085460` | MED | main | 68 | YES (med) | leaf function (0 callees); main module; tiny (68B) | [02085460.md](../../../docs/research/dossiers/02085460.md) |
| 72 | `0208b108` | MED | main | 100 | YES (med) | leaf function (0 callees); main module; tiny (100B) | [0208b108.md](../../../docs/research/dossiers/0208b108.md) |
| 73 | `0208c3e4` | MED | main | 68 | YES (med) | leaf function (0 callees); main module; tiny (68B) | [0208c3e4.md](../../../docs/research/dossiers/0208c3e4.md) |
| 74 | `0208ddec` | MED | main | 96 | YES (med) | leaf function (0 callees); main module; tiny (96B) | [0208ddec.md](../../../docs/research/dossiers/0208ddec.md) |
| 75 | `0208de94` | MED | main | 88 | YES (med) | leaf function (0 callees); main module; tiny (88B) | [0208de94.md](../../../docs/research/dossiers/0208de94.md) |
| 76 | `0208e6ac` | MED | main | 84 | YES (med) | leaf function (0 callees); main module; tiny (84B) | [0208e6ac.md](../../../docs/research/dossiers/0208e6ac.md) |
| 77 | `02006a38` | RETRIAGE | main | 216 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; main module; small (216B) | [MainEFRetriage.md](../../../docs/research/retriage/MainEFRetriage.md) |
| 78 | `02009dec` | RETRIAGE | main | 176 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; main module; small (176B) | [MainEFRetriage.md](../../../docs/research/retriage/MainEFRetriage.md) |
| 79 | `02009f50` | RETRIAGE | main | 196 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; main module; small (196B) | [MainEFRetriage.md](../../../docs/research/retriage/MainEFRetriage.md) |
| 80 | `02020738` | RETRIAGE | main | 220 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; main module; small (220B) | [MainEFRetriageR8.md](../../../docs/research/retriage/MainEFRetriageR8.md) |
| 81 | `0202e60c` | RETRIAGE | main | 232 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; main module; small (232B) | [MainEFRetriageR8.md](../../../docs/research/retriage/MainEFRetriageR8.md) |
| 82 | `0202e79c` | RETRIAGE | main | 200 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; main module; small (200B) | [MainEFRetriageR8.md](../../../docs/research/retriage/MainEFRetriageR8.md) |
| 83 | `021aa758` | RETRIAGE | ov022 | 732 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (732B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 84 | `021aaa34` | RETRIAGE | ov022 | 436 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (436B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 85 | `021aaddc` | RETRIAGE | ov018 | 632 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (632B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 86 | `021ab164` | RETRIAGE | ov008 | 584 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (584B) | [Ov008Ov010Retriage.md](../../../docs/research/retriage/Ov008Ov010Retriage.md) |
| 87 | `021ab1c4` | RETRIAGE | ov018 | 712 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (712B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 88 | `021acf80` | RETRIAGE | ov018 | 408 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (408B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 89 | `021ad660` | RETRIAGE | ov000 | 636 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (636B) | [Ov000Deep.md](../../../docs/research/retriage/Ov000Deep.md) |
| 90 | `021ad7d4` | RETRIAGE | ov009 | 88 | YES (med) | leaf function (0 callees); overlay module (contained link unit, not cascading into Entry.c); tiny (88B) | [SmallOverlaysRetriage.md](../../../docs/research/retriage/SmallOverlaysRetriage.md) |
| 91 | `021b2694` | RETRIAGE | ov007 | 560 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (560B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 92 | `021b2b2c` | RETRIAGE | ov016 | 456 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (456B) | [Ov016Ov020Ov015Retriage.md](../../../docs/research/retriage/Ov016Ov020Ov015Retriage.md) |
| 93 | `021b5704` | RETRIAGE | ov006 | 544 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (544B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 94 | `021b66c4` | RETRIAGE | ov006 | 428 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (428B) | [OverlayEFRetriage.md](../../../docs/research/retriage/OverlayEFRetriage.md) |
| 95 | `021c9d74` | RETRIAGE | ov013 | 644 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (644B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 96 | `021ca0c4` | RETRIAGE | ov011 | 608 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (608B) | [Ov011Deep.md](../../../docs/research/retriage/Ov011Deep.md) |
| 97 | `021ca144` | RETRIAGE | ov001 | 404 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (404B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 98 | `021ca42c` | RETRIAGE | ov013 | 424 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (424B) | [SmallOverlaysRetriageR7.md](../../../docs/research/retriage/SmallOverlaysRetriageR7.md) |
| 99 | `021d0938` | RETRIAGE | ov011 | 452 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (452B) | [Ov011Deep.md](../../../docs/research/retriage/Ov011Deep.md) |
| 100 | `021d0cac` | RETRIAGE | ov011 | 428 | YES (med) | leaf function (0 callees); re-triage recovered struct/GROUND TRUTH; overlay module (contained link unit, not cascading into Entry.c); medium-large (428B) | [Ov011Deep.md](../../../docs/research/retriage/Ov011Deep.md) |
| 101 | `021b2b80` | HIGH | ov010 | 120 | LIKELY | clone-cluster of 1 already-matched sibling(s); overlay module (contained link unit, not cascading into Entry.c); small (120B) | [021b2b80.md](../../../docs/research/dossiers-high/021b2b80.md) |
| 102 | `0200a2f4` | MED | main | 140 | LIKELY | leaf function (0 callees); main module; small (140B) | [0200a2f4.md](../../../docs/research/dossiers/0200a2f4.md) |
| 103 | `0200c078` | MED | main | 108 | LIKELY | leaf function (0 callees); main module; small (108B) | [0200c078.md](../../../docs/research/dossiers/0200c078.md) |
| 104 | `0200c284` | MED | main | 116 | LIKELY | leaf function (0 callees); main module; small (116B) | [0200c284.md](../../../docs/research/dossiers/0200c284.md) |
| 105 | `0200f044` | MED | main | 248 | LIKELY | leaf function (0 callees); main module; small (248B) | [0200f044.md](../../../docs/research/dossiers/0200f044.md) |
| 106 | `0200fa90` | MED | main | 104 | LIKELY | leaf function (0 callees); main module; small (104B) | [0200fa90.md](../../../docs/research/dossiers/0200fa90.md) |
| 107 | `0200fb18` | MED | main | 188 | LIKELY | leaf function (0 callees); main module; small (188B) | [0200fb18.md](../../../docs/research/dossiers/0200fb18.md) |
| 108 | `0200fd1c` | MED | main | 104 | LIKELY | leaf function (0 callees); main module; small (104B) | [0200fd1c.md](../../../docs/research/dossiers/0200fd1c.md) |
| 109 | `02010354` | MED | main | 180 | LIKELY | leaf function (0 callees); main module; small (180B) | [02010354.md](../../../docs/research/dossiers/02010354.md) |
| 110 | `02010a98` | MED | main | 112 | LIKELY | leaf function (0 callees); main module; small (112B) | [02010a98.md](../../../docs/research/dossiers/02010a98.md) |
| 111 | `0201934c` | MED | main | 224 | LIKELY | leaf function (0 callees); main module; small (224B) | [0201934c.md](../../../docs/research/dossiers/0201934c.md) |
| 112 | `0201d620` | MED | main | 148 | LIKELY | leaf function (0 callees); main module; small (148B) | [0201d620.md](../../../docs/research/dossiers/0201d620.md) |
| 113 | `0201ddac` | MED | main | 136 | LIKELY | leaf function (0 callees); main module; small (136B) | [0201ddac.md](../../../docs/research/dossiers/0201ddac.md) |
| 114 | `02023eb8` | MED | main | 112 | LIKELY | leaf function (0 callees); main module; small (112B) | [02023eb8.md](../../../docs/research/dossiers/02023eb8.md) |
| 115 | `02026e38` | MED | main | 160 | LIKELY | leaf function (0 callees); main module; small (160B) | [02026e38.md](../../../docs/research/dossiers/02026e38.md) |
| 116 | `0202c770` | MED | main | 120 | LIKELY | leaf function (0 callees); main module; small (120B) | [0202c770.md](../../../docs/research/dossiers/0202c770.md) |
| 117 | `0202e358` | MED | main | 212 | LIKELY | leaf function (0 callees); main module; small (212B) | [0202e358.md](../../../docs/research/dossiers/0202e358.md) |
| 118 | `0202e6f4` | MED | main | 168 | LIKELY | leaf function (0 callees); main module; small (168B) | [0202e6f4.md](../../../docs/research/dossiers/0202e6f4.md) |
| 119 | `0202e864` | MED | main | 136 | LIKELY | leaf function (0 callees); main module; small (136B) | [0202e864.md](../../../docs/research/dossiers/0202e864.md) |
| 120 | `0202ed04` | MED | main | 140 | LIKELY | leaf function (0 callees); main module; small (140B) | [0202ed04.md](../../../docs/research/dossiers/0202ed04.md) |
| 121 | `0202ed90` | MED | main | 176 | LIKELY | leaf function (0 callees); main module; small (176B) | [0202ed90.md](../../../docs/research/dossiers/0202ed90.md) |
| 122 | `0202ee40` | MED | main | 200 | LIKELY | leaf function (0 callees); main module; small (200B) | [0202ee40.md](../../../docs/research/dossiers/0202ee40.md) |
| 123 | `0202ef38` | MED | main | 196 | LIKELY | leaf function (0 callees); main module; small (196B) | [0202ef38.md](../../../docs/research/dossiers/0202ef38.md) |
| 124 | `0202f218` | MED | main | 204 | LIKELY | leaf function (0 callees); main module; small (204B) | [0202f218.md](../../../docs/research/dossiers/0202f218.md) |
| 125 | `02030b84` | MED | main | 248 | LIKELY | leaf function (0 callees); main module; small (248B) | [02030b84.md](../../../docs/research/dossiers/02030b84.md) |
| 126 | `02031208` | MED | main | 152 | LIKELY | leaf function (0 callees); main module; small (152B) | [02031208.md](../../../docs/research/dossiers/02031208.md) |
| 127 | `020312a0` | MED | main | 184 | LIKELY | leaf function (0 callees); main module; small (184B) | [020312a0.md](../../../docs/research/dossiers/020312a0.md) |
| 128 | `02031684` | MED | main | 224 | LIKELY | leaf function (0 callees); main module; small (224B) | [02031684.md](../../../docs/research/dossiers/02031684.md) |
| 129 | `02031c8c` | MED | main | 128 | LIKELY | leaf function (0 callees); main module; small (128B) | [02031c8c.md](../../../docs/research/dossiers/02031c8c.md) |
| 130 | `020384e8` | MED | main | 172 | LIKELY | leaf function (0 callees); main module; small (172B) | [020384e8.md](../../../docs/research/dossiers/020384e8.md) |
| 131 | `020385f8` | MED | main | 124 | LIKELY | leaf function (0 callees); main module; small (124B) | [020385f8.md](../../../docs/research/dossiers/020385f8.md) |
| 132 | `02038674` | MED | main | 128 | LIKELY | leaf function (0 callees); main module; small (128B) | [02038674.md](../../../docs/research/dossiers/02038674.md) |
| 133 | `02038f3c` | MED | main | 116 | LIKELY | leaf function (0 callees); main module; small (116B) | [02038f3c.md](../../../docs/research/dossiers/02038f3c.md) |
| 134 | `02038fb0` | MED | main | 112 | LIKELY | leaf function (0 callees); main module; small (112B) | [02038fb0.md](../../../docs/research/dossiers/02038fb0.md) |
| 135 | `0204937c` | MED | main | 180 | LIKELY | leaf function (0 callees); main module; small (180B) | [0204937c.md](../../../docs/research/dossiers/0204937c.md) |
| 136 | `02049554` | MED | main | 224 | LIKELY | leaf function (0 callees); main module; small (224B) | [02049554.md](../../../docs/research/dossiers/02049554.md) |
| 137 | `02052398` | MED | main | 140 | LIKELY | leaf function (0 callees); main module; small (140B) | [02052398.md](../../../docs/research/dossiers/02052398.md) |
| 138 | `0205340c` | MED | main | 124 | LIKELY | leaf function (0 callees); main module; small (124B) | [0205340c.md](../../../docs/research/dossiers/0205340c.md) |
| 139 | `02054a30` | MED | main | 160 | LIKELY | leaf function (0 callees); main module; small (160B) | [02054a30.md](../../../docs/research/dossiers/02054a30.md) |
| 140 | `020665e0` | MED | main | 112 | LIKELY | leaf function (0 callees); main module; small (112B) | [020665e0.md](../../../docs/research/dossiers/020665e0.md) |
| 141 | `02068890` | MED | main | 108 | LIKELY | leaf function (0 callees); main module; small (108B) | [02068890.md](../../../docs/research/dossiers/02068890.md) |
| 142 | `0206a724` | MED | main | 140 | LIKELY | leaf function (0 callees); main module; small (140B) | [0206a724.md](../../../docs/research/dossiers/0206a724.md) |
| 143 | `0206b814` | MED | main | 120 | LIKELY | leaf function (0 callees); main module; small (120B) | [0206b814.md](../../../docs/research/dossiers/0206b814.md) |
| 144 | `0206baec` | MED | main | 124 | LIKELY | leaf function (0 callees); main module; small (124B) | [0206baec.md](../../../docs/research/dossiers/0206baec.md) |
| 145 | `0206cf10` | MED | main | 144 | LIKELY | leaf function (0 callees); main module; small (144B) | [0206cf10.md](../../../docs/research/dossiers/0206cf10.md) |
| 146 | `02072444` | MED | main | 132 | LIKELY | leaf function (0 callees); main module; small (132B) | [02072444.md](../../../docs/research/dossiers/02072444.md) |
| 147 | `02072544` | MED | main | 188 | LIKELY | leaf function (0 callees); main module; small (188B) | [02072544.md](../../../docs/research/dossiers/02072544.md) |
| 148 | `02073fc8` | MED | main | 192 | LIKELY | leaf function (0 callees); main module; small (192B) | [02073fc8.md](../../../docs/research/dossiers/02073fc8.md) |
| 149 | `020778c4` | MED | main | 144 | LIKELY | leaf function (0 callees); main module; small (144B) | [020778c4.md](../../../docs/research/dossiers/020778c4.md) |
| 150 | `02077954` | MED | main | 132 | LIKELY | leaf function (0 callees); main module; small (132B) | [02077954.md](../../../docs/research/dossiers/02077954.md) |

---

## 6. How to work this queue

1. Take candidates in queue order (already ranked by predicted-containment
   confidence).
2. Write the `.c`, `ninja -j4 objdiff` / `verify.py` as usual.
3. **Before accepting on objdiff-100% alone**, run the brief-514 containment
   pre-gate: `ninja -j4 rom`, then compare `build/eur/build/arm9.bin`
   against `extract/eur/arm9/arm9.bin`. If the diff is not wholly inside
   the candidate's own delinked byte range, park immediately as
   `layout-avalanche` — do not spend further iteration time on it, and do
   not treat it as a queue-ranking failure (this queue predicts likelihood,
   it does not replace the gate).
4. Only if contained: iterate the instruction-level C shaping (this is
   where the dossier/retriage GROUND TRUTH pool-word and callee tables pay
   off — Mode A/B are already pre-empted).
5. Final gate: regional `ninja -j4 sha1`.
6. Report yield back against this queue's `predicted-contained?` column —
   that comparison is the first real validation of the scoring model in
   §3, and should drive `safe-queue-v3` once enough waves have run through it.

