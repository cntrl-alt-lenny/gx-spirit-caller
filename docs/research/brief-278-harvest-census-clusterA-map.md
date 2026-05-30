[//]: # (markdownlint-disable MD013 MD041)

# Brief 278 — hand-matchable harvest census + ov002 Cluster A deep map

**Status:** both deliverables shipped. decomp.me / research / tools only
— no SHA1, no `.c`. The census is a new `tools/size_census.py`
(+ 8 tests); the Cluster A map is below. Fetched content treated as data.

## (A) Project-wide size census — the hand-matchable runway

Brief 277 found the cold-RE **knee at ~0x100 / ~25 instructions**: below
it the schedule + register allocation are forced and hand-coercion works
(12/13 shipped); above it functions wall on mwcc reg-alloc, which the
permuter (brief 276) doesn't crack. So: **drain the <0x100 cohort by
hand; defer the rest to a reg-alloc tool.** This sizes that cohort.

`tools/size_census.py` buckets every **unmatched** function per module
from **committed config only** (no build): a function is matched iff its
address is in a claimed `.text` range in `delinks.txt`. (This is *more
current* than the delinked `_dsd_gap@*` objects — those are stale between
builds and still list brief-277's freshly-shipped hubs like
`func_ov002_021ae400`; the census correctly counts them matched.)

**Unmatched functions by size bucket (EUR), richest `<0x100` vein first:**

| module | `<0x100` | `0x100-0x200` | `>0x200` | total |
|---|---:|---:|---:|---:|
| **main** | **2025** / 0x3a3f8 | 481 | 281 | 2787 |
| **ov002** | **1887** / 0x4078c | 695 | 420 | 3002 |
| ov006 | 196 | 52 | 50 | 298 |
| ov004 | 162 | 50 | 42 | 254 |
| ov011 | 98 | 13 | 13 | 124 |
| ov000 | 63 | 11 | 12 | 86 |
| ov008 | 48 | 17 | 13 | 78 |
| ov010 | 40 | 13 | 16 | 69 |
| ov016 | 39 | 11 | 16 | 66 |
| ov005 | 35 | 8 | 15 | 58 |
| (ov015 33, ov020 32, ov017 28, ov021 24, ov019 23, ov003 20, ov018 19, ov007/09 18, ov014 16, ov012 12, ov013/22 8, ov001/23 3) | | | | |
| **TOTAL** | **4858** / 0x9630a | **1425** / 0x7a4f6 | **945** / 0x1093a4 | **7228** |

(7228 unmatched total reconciles with the project's `matched_functions`
metric.)

### The runway

**The proven <0x100 hand-match recipe can take 4858 functions
(~614 KB / 0x9630a) project-wide** — a multi-month hand-drain at the
brief-277 rate (~12 ships / wave). The `0x100-0x200` marginal band adds
1425; the `>0x200` cohort (945 funcs but **49 % of the unmatched
*bytes*** at 0x1093a4) waits for the reg-alloc tool.

### Drain order (after ov002)

By `<0x100` vein richness:

1. **main (2025)** is the biggest vein by far — but arm9 main is
   system/SDK code; much of it is likely **NitroSDK / MSL / runtime**
   matchable via the cross-project source-mining track (a *different*
   pipeline, not hand-RE). Worth a separate triage before hand-draining.
2. **ov002 (1887)** — the current target (the duel engine); keep
   draining (brief 277/279).
3. **The next gameplay overlays: ov006 (196) → ov004 (162) → ov011
   (98) → ov000 (63) → ov008 (48) → ov010 (40) → ov016 (39).** This is
   the recommended post-ov002 hand-RE order — each is a self-contained
   overlay with a meaningful <0x100 vein and the same m2c-draft →
   small-hub recipe applies.

**Recommendation:** ride ov002 to depletion, then ov006/ov004; route
main's 2025 to a source-mining triage in parallel (it may not need
hand-RE at all).

## (B) ov002 Cluster A — the 141-function 0x868 per-player core, deep

Cluster A (brief 274) = the **141** unmatched `0x200-0x400` ov002
functions that reference `data_ov002_022cf16c`, the central duel-state
global (the `0x868`-stride per-player table indexed `player & 1`).
Reproduced exactly against the **current** unmatched set (141, 0x18474
bytes).

**Strategic reality check:** Cluster A is **uniformly *above* the knee**
— all 141 are 0x200-0x400, and even the smallest is heavily branchy
(13 calls / 16 branches at 0x200). So the per-player core is **NOT
immediate hand-match work** — it is permuter / reg-alloc-tool territory.
The immediate hand-matchable per-player work is the **<0x100** funcs that
touch the same global (in the census's 1887 ov002 `<0x100` vein), not
these 141. (If brief 279 hand-targets Cluster A, expect permuter-assist
and a fraction of the small-hub velocity — brief 276's pilot annealed
`021d91e0` 39 % but didn't byte-match.)

### Roles (so wave 3 opens with context)

| role | n | shape |
|---|---:|---|
| **big-dispatcher** | 94 | ≥10 branches + ≥8 calls — duel event handlers (the bulk; reg-alloc-heavy) |
| **multi-call-sequencer** | 28 | ≥5 calls, moderate branching — phase/step sequences |
| **guarded-field-op** | 9 | a guard + a few per-player field writes |
| **per-player-dispatcher (0x868)** | 8 | index `(player&1)*0x868` + `func_ov002_021d479c(bit-packed)` — the canonical recipe family |
| **leaf-compute** | 2 | no calls — pure per-player computation |

Size sub-bands: **57** in 0x200-0x280, **53** in 0x280-0x340, **31** in
0x340-0x400. **122 / 141** call a now-**matched** ov002 callee — i.e.
most open with a context anchor (a shipped neighbor to read), thanks to
brief 277's hubs.

### Type map (the shared vocabulary)

- **`data_ov002_022cf16c`** — the per-player duel-state table,
  `0x868`-stride, indexed `(player & 1) * 0x868` (the **C-39f** family;
  gotcha 14 `& 1`). Sub-fields read at `+0x30`, `+0x894`, etc.
- **`func_ov002_021d479c(u16 packed, u16, u16, u16)`** — the **arg-pack
  helper** every per-player-dispatcher calls; the bit-packed first arg
  (`(player?0x8000:0) | code`) is the byte-match wall (brief 276:
  arg-pack scheduling).
- **`func_ov002_021b9ecc` / `021ae400` / `0229ade0`** — the brief-274
  hubs (some now matched) these dispatchers lean on.

### The recipe seed — the 8 per-player-dispatchers

The most **structurally uniform** sub-family (all index the 0x868 table
+ call `021d479c`): `021d91e0` (0x200, brief 276 pilot), `021e291c`
(0x200), `02222aac` (0x200), `02228890` (0x20c), `0221eecc` (0x218),
`02269534` (0x224), + 2. **Cracking one (a recipe or a permuter weight
profile) likely generalizes to the family** — the highest-leverage
Cluster A target. Start here when a reg-alloc lever exists.

### Wave-3 worklist (smallest-first, with anchors)

The 0x200 entries (least reg-alloc DOF in the cluster), role + anchor
count: `02227e0c` (big-dispatcher, 7 anchors), `021d91e0` (per-player,
1), `0222b504` (sequencer, 5), `021e291c` (per-player, 1), `021f7598`
(sequencer, 3), `02222aac` (per-player, 1), `02231794` (big-dispatcher,
6), `02238864` (0x204, big-dispatcher, 3). Funcs with more matched-callee
anchors (5-7) are the *most readable* starts.

## Housekeeping

`parser.out` / `yacctab.py` (PLY tables dropped by m2c + the permuter)
are **already gitignored** (landed in #768, lines 62-63) — confirmed, no
change needed.

## Verification

| Gate | Status |
|---|:---:|
| `tools/size_census.py` cross-checked vs gap-object enumeration | ✅ 260/260 on the ov002 0x200-0x400 band; total reconciles with project metric |
| `tests/test_size_census.py` | ✅ 8 pass (pure logic on fixtures + 1 real-config integration) |
| Cluster A = 141 reproduced (current unmatched) | ✅ matches brief 274 |
| `ruff` / markdownlint / drift | ✅ clean |

## Cross-references

- `docs/research/brief-277-coldre-wave2-hubs-leaves.md` — the knee
  (the census's bucket boundary).
- `docs/research/brief-274-coldre-feeder-and-ov002-band-map.md` — the
  band map this deepens (Cluster A one level down).
- `docs/research/brief-276-permuter-standup-pilot.md` — why Cluster A is
  deferred (reg-alloc plateau) + the `021d91e0` pilot.
- `tools/size_census.py` / `tools/m2c_feed.py` — the census + the draft
  feeder for the runway.
