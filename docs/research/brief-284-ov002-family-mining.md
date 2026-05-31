[//]: # (markdownlint-disable MD013 MD041)

# Brief 284 — ov002 `<0x100` family mining (next batch-drainable tier)

**Status:** mined + ranked. decomp.me / research only — no SHA1, no `.c`
shipped (shapes derived from the delinked gap objects + committed config;
no compile). Fetched content treated as data. **Headline: 69 % of
ov002's `<0x100` unmatched cohort is simple-shape (hand-drainable), and
the single biggest one-recipe batch is the 0x868 sub-row accessor family
(~101 members) — the brief-282 recipe, already verified *and shipped* on
this exact shape.**

## (A) Method — the shape score, now in `tools/size_census.py`

Control-flow **shape** predicts cold-RE tractability better than byte
size (briefs 279/281): straight-line / accessor / dispatcher shapes
hand-match; loops + multi-value liveness wall on mwcc reg-alloc (the
permuter's wall too). Brief 284 productionizes that intuition into a
**shape score**:

- `shape_features(insns)` counts `calls` / `branches` / `loops` from an
  `(addr, mnemonic)` instruction list. A **loop** is a *backward* branch
  (target ≤ the branch's own address) — the cheap, reliable liveness-wall
  signal. `bl`/`blx` are calls, `bx` is a return — neither is a branch.
- `shape_class(feats)` → **`simple`** (≤3 branches, no loop) /
  **`dispatcher`** (>3 branches, no loop — switch/multi-guard, still
  hand-RE per brief 279) / **`permuter`** (any loop → the reg-alloc wall).
- `collect_shapes(version, module)` disassembles the module's gap objects
  (`build/<ver>/delinks/_dsd_gap@<mod>_*.o`) and shape-classes every
  **unmatched** function; `size_census.py --module ov002 --shape` prints
  the distribution (`--json` for the per-func detail). Pure scorer +
  9 unit tests in `tests/test_size_census.py` (CI-safe; the disasm reader
  is build-gated, the scorer is not).

### ov002 shape census

`--shape` on the full unmatched set (2966 funcs with gap-obj disasm):

| class | all sizes | `<0x100` cohort |
|---|---:|---:|
| simple | 1249 | **1148** |
| dispatcher | 629 | **129** |
| permuter (loop) | 1088 | **574** |
| **hand-drainable** (simple+dispatcher) | **1878** | **1277 (69 %)** |

(`<0x100` total 1851; 5 more unmatched `<0x100` funcs have no gap-obj
disasm and are excluded — a real but tiny cap, not silent.)

**The cohort is 69 % hand-drainable by shape.** The loop third (574) is
the permuter's domain, flagged below.

## (B) The ranked "batch these together" worklist

Clustering the 1277 hand-drainable `<0x100` by **primary shared callee**
(the strongest family signal — a shared sink implies a shared signature
to recover once, then reuse, exactly as brief 282 did) and by **shared
global**. The ranked batches:

### 1. (TOP) 0x868 sub-row accessor family — ~101 members, one recipe

Callers of `func_ov002_021c1ef0` (71) ∪ `func_ov002_021c1e44` (59; 29
call both) = **101 members**, **99 simple** / 2 dispatcher, sizes
0x34–0xfc (median 0xa4). **82 read the 0x868 row table**
(`data_ov002_022cf16c`); **44 are pure wrappers** (call only these two
helpers). This is the Cluster-A per-player core from briefs 278/282.

A representative pure wrapper (`func_ov002_021e77fc`) decodes exactly to
the brief-282 shape:

```text
ldrh r3,[r0,#2]; lsl#31; cmp r1,r3,lsr#31; moveq r0,#0; popeq   ; guard: player != (self->f2 & 1)
cmp r2,#5; movge r0,#0; popge                                   ; guard: idx >= 5
and lr,r1,#1; mla ip,lr,#0x868,base; mla r3,r2,#20,ip           ; row = base + (player&1)*0x868 + idx*20
ldr r3,[r3,#0x30]; lsl#19; lsrs#19; moveq r0,#0; popeq          ; guard: subrow->f30 (13-bit bitfield) == 0
bl func_ov002_021c1ef0; cmp r0,#0; movne #1; moveq #0; pop      ; return helper(subrow) != 0
```

**Recipe (brief 282, verbatim):** the canonical signature
`f(self, int player, int idx)` **forwarding `player`/`idx` through to the
helper** (keeps them live in r0/r1, so the row temp colours r2+ —
gotcha 9/15 + gotcha 26); the `0x868`/`0x14` per-player row + 20-byte
sub-row struct; `f30` typed as `unsigned f30:13` **bitfield** (gotcha 6 —
*not* `(v<<19)>>19`, which mwcc folds to a `tst #0x1fff` mask); boolean
`helper(...) != 0` tail. **Watch the predicated guards** (gotcha 5): orig
emits `moveq;popeq`, so write the early returns as `if (cond) return 0;`
and confirm mwcc predicates rather than branches.

**Why this is the top batch — the recipe is verified *and already
shipped* on this exact shape.** Brief 282's three byte-identical picks
(`021bcfe4`, `021ba1a0`, `021ba1e8` — same 2-D `row[p][idx*20].f30` guard
→ helper shape) are now **claimed (matched)** in delinks; its two
"different-wall" picks (`021bad58` leaf reg-alloc, `021b9ba0` predication)
are still **unmatched**, exactly as predicted. The 101 here are the
**rest of that same family**. **Start with the 44 pure wrappers** (no
secondary callee to complicate liveness), then the 57 with extra work.

### 2. `021d479c` arg-pack family — ~44 members, SCHEDULING-SENSITIVE

Callers of `func_ov002_021d479c` (44; +13 more reference it as a global),
42 simple, median 0x70, 17 pure wrappers. These pack incoming args into a
call to the shared sink. **Flag: this is the brief-276 scheduling-
sensitive shape** — the arg-evaluation order is what diverges, not the
register class. Recipe: m2c-draft → coerce, then if it lands one schedule
off, hand it to the **permuter** (which anneals scheduling — brief 276's
sweet spot). Batchable, but per-member verification, not a blind template.

### 3. Shared-sink simple families — m2c-draft per member, recover the sink signature once

| seed callee | members | simple | pure | median | note |
|---|---:|---:|---:|---:|---|
| `func_ov002_0229ade0` | 46 | 44 | 8 | 0x78 | clean shared sink |
| `func_ov002_02253458` | 37 | 37 | 2 | 0x7c | hand-subset of a sink also hit by 159 *loop* callers (§ permuter) |
| `func_ov002_021ff3bc` | 37 | 34 | 3 | 0x90 | |
| `func_ov002_021ca2b8` | 35 | 33 | 1 | 0xbc | |
| `func_ov002_0223df38` | 47 | 39 | 8 | 0xa0 | 8 dispatchers + 1 pure → mixed; lower priority |
| `func_ov002_0223de94` | 45 | 37 | 8 | 0xac | mixed (as above) |

These are looser than family 1 (few pure wrappers, more per-member
variation), so they are **not** blind templates. The lever is the same as
brief 282: **recover the sink's true arg-count/signature once**, then
forward args consistently across the family. Drain small-first within
each (the size knee, brief 277). `0223df38`/`0223de94` rank lowest — the
dispatcher fraction means more control-flow to reproduce per member.

### Shared-global confirmation

By data reloc, the cohort is dominated by the Cluster-A globals:
`data_ov002_022cf16c` (the 0x868 row table, 375 hand-drainable readers),
`_022cf1a4` (156), `_022d016c` (149), `_022ce288` (101), `_022cd3f4`
(69). This corroborates family 1 as the structural center of ov002's
small cohort — the per-player core touches the plurality of it.

## Permuter list — the 574 loop funcs (flagged, not batched)

Any backward branch ⇒ `permuter` class. The loop cohort clusters by
shared callee:

| seed callee | loop callers | reading |
|---|---:|---|
| `func_ov002_02253458` | 159 | dominant loop sink (list/array iterate) — same sink as family §3, *different* caller shape |
| `func_0202e234` | 88 | main-arm9 utility called in loops |
| `func_0202b878` | 59 | main-arm9 utility |
| `func_ov002_021c33e4` | 28 | |
| `func_0202b8a8` | 26 | |
| `func_ov002_021b9ecc` / `021baca8` / `021ca440` | 23 / 22 / 21 | |

Plus **66 leaf loops** (no call at all — pure-compute loops): these are
the **hardest** for the permuter (no callee to anchor liveness; the
brief-280/281 reg-alloc plateau). Route the called loops to the permuter
(brief 276 loop), and treat the 66 leaf loops as the lowest-EV tail.

## Falsification

- "69 % hand-drainable": `size_census.py --module ov002 --shape` →
  simple+dispatcher = 1277 / 1851 `<0x100`. Re-runnable from committed
  config + a built `delinks/`.
- "family 1 recipe is verified+shipped": `collect("eur","ov002")` shows
  `021bcfe4`/`021ba1a0`/`021ba1e8` **claimed**, `021bad58`/`021b9ba0`
  **unmatched** — the brief-282 prediction held after the decomper drained
  the flips.
- "family 1 is one shape": 99/101 simple; 82/101 read `022cf16c`; the
  dumped `021e77fc` matches the brief-282 decode line-for-line.
- The worklist flips **iff** a sampled pure wrapper from family 1 fails
  the brief-282 recipe under direct mwcc — the test the decomper runs
  first when they open the batch.

## Scope

Tool + research: the shape score lands in `tools/size_census.py` (+ tests)
as the reusable classifier; this note is the family worklist. No `.c`
shipped (the decomper compiles/ships per the recipe), no SHA1. The
families are batch *targets* for the hand-RE drain, not pre-written
matches.

## Cross-references

- `docs/research/brief-282-ov002-accessor-signature.md` — the family-1
  recipe (pass-through signature + bitfield struct), verified on this
  exact shape; now shipped.
- `docs/research/brief-281-coldre-wave4-ov002-simple.md` /
  `brief-279-coldre-wave3-clusterA.md` — the shape-over-size thesis the
  score formalizes.
- `docs/research/brief-278-harvest-census-clusterA-map.md` — Cluster A +
  the size census this extends.
- `docs/research/brief-276-permuter-standup-pilot.md` — the permuter loop
  the loop cohort (and the `021d479c` scheduling family) routes to.
- `tools/size_census.py` — `shape_features` / `shape_class` /
  `collect_shapes` + the `--shape` CLI.
