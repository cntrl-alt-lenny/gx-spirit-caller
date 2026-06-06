[//]: # (markdownlint-disable MD013 MD041)

# Brief 360 — ov002 byte-pack drain wave (vein recalibration)

**Brief:** 360 (decomper). Work the `func_021d479c` arg-pack family as a normal drain
wave with the `(u8)` byte-pack lever; sweep the per-player slot-dispatchers
(`021d677c`/`7054`/`7100`); gate = 3-region `ninja sha1`. The 358 routing pass
estimated the byte-pack class at **~30–50 matchable**. Target ~12–18.

## Headline — 2 clean matches + a vein recalibration

**2 shipped (`021d8414`, `0223a87c`), 3-region `ninja sha1` = EUR/USA/JPN OK.** Well
under the 12–18 target — because the **clean byte-pack vein is far thinner than the
358 estimate suggested.** This wave's main result is a *measurement*: the easy
byte-pack functions were largely drained in 358; what remains is finicky or large.

The `(u8)` lever and the `goto` lever both work (re-confirmed). The constraint is not
the lever — it's that very few uncarved functions have the clean
small-byte-pack-with-simple-guard shape that the lever applies to.

## The 2 clean picks

- **`021d8414`** (0x60) — a 7-arg arg-pack with three packed payloads, the last a
  `(u8)lo | ((u8)hi << 8)` byte-pack. Direct application of the lever.
- **`0223a87c`** (0xd0) — a **medium guard-chain byte-pack**: 3 guards that branch to
  a shared `return 0`, then arg-pack two byte-packed payloads. Matched with the `(u8)`
  lever for the payloads **and** the `goto end` lever for the shared-epilogue guards
  (the ≥2-shared-return case from 358). This is the most useful new shape — a clean
  medium-tier template.

## Why the vein is thinner than "30–50" — the measurement

I enumerated the **117 uncarved `func_021d479c` callers** and classified them:

| class | count | matchable? |
|---|---:|---|
| **byte-pack-payload** (`orr …,lsl#8`) | **15** | the lever applies — **but all are large** (0xd0–0x1560) except the already-drained small ones |
| non-byte-pack arg-pack (bit-combine / fixed-point / table / guard+store) | ~100 | mostly **finicky** (see below) |

The "30–50" figure was the *whole* arg-pack family; the **byte-pack subset is ~15**,
and of those only the small ones (the `021d5xxx` cluster, ~7) and two medium ones
(`021d8414`, `0223a87c`) are clean drains. The other 13 byte-pack callers are **large
command-builders** (0x19c–0x1560: `021dee94`, `0226a504`, `021d8474`, `02219f7c`,
`021dd950`, …) — real reverse-engineering, not a drain.

## The finicky tail — 9 near-misses cataloged (not shipped)

Outside the byte-pack cluster, the small arg-pack callers are **1–2-register-off
near-misses**, by class:

| class | examples | route |
|---|---|---|
| reg-mirror / reg-alloc (per-player math shifts the whole allocation) | `021e2cd4`, `021d81d4`, `021df62c`, `021d677c`, `0223a3b0` | `.s` / permuter |
| scheduling (a global load hoisted early vs late) | `0225a51c`, `021b0184`, `021b01f4` | **permuter** (anneals scheduling) |
| inline-branch / case-order (orig's specific `beq`-chain order) | `02211934` | `.s` / permuter |

These are the same walled classes 358 identified: the permuter plateaus on reg-alloc,
recovers scheduling (but its target-`.s` plumbing for overlay-swap gap funcs is still
blocked — see 358). `asm_escape --c` doesn't fit (not commutative swaps).
**Per the brief, the scheduling class is deferred pending the two harness fixes.**

The per-player slot-dispatchers the brief listed (`021d677c`/`7054`/`7100`) fall in the
reg-alloc-finicky bucket: `021d677c` came to a commutative-add canonicalisation
(`add r2,r2,ip` vs `add r2,ip,r2`) plus a reg-mirror. Not clean drains.

## Recipes re-confirmed / banked

- `(u8)lo | ((u8)hi << 8)` → `and; and; orr …,lsl#8` (the lever), on the 7-arg
  (`021d8414`) and medium guard-chain (`0223a87c`) shapes.
- `goto end` for a guard chain with ≥2 shared `return 0` (`0223a87c`) — the medium
  byte-pack template.
- mwcc is **C89**: declarations must precede statements (a mid-block `int v = …` is a
  syntax error — declare at the top).
- a guard sink declared in `core.h` (e.g. `func_021c1e44(self,a,b)`,
  `func_0223de94→ u16`) must be used at its declared arity/type — re-externing it
  differently is a compile error.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (2 `.c`, byte-identical) |
| `check_match_invariants.py` | 0 errors |
| `ruff check .` | clean |
| `tests/` | passed |
| GOTCHA-18 cross-wire | clean (no pick references an ov000/005/008 sym; sha1 proves isolation) |

Carve-size audit: both sizes match the true gap-symbol size. EUR-only config change
(+2 `complete` blocks); `ov002_core.h` §VERIFIED extended. (Benign `mwldarm` warning:
the local `struct` for `Ov002Self`/`node` differs across TUs — name-reuse only, no
effect on the bytes; sha1 passes.)

## Recommendation for the brain — recalibrate

The byte-pack vein is **not** a 30–50 easy drain. The realistic clean count was **~9**
(7 small in 358 + `021d8414` + `0223a87c`), and it is now **essentially tapped**.
What remains:

1. **13 large byte-pack command-builders** (0x19c–0x1560) — matchable in principle
   (the `0223a87c` template scales), but each is 30–60 min of real RE. Only worth it
   if the brain wants ov002 `complete_units` specifically; not an efficient drain.
2. **~100 finicky non-byte-pack arg-packs** — the reg-alloc/scheduling/inline-branch
   tail. Route, don't grind: scheduling → permuter (once the 358 harness gaps close);
   reg-alloc → `--whole-function` `.s`; large → RE.

**So: pivot the clean-C decomper to a fresh overlay's easy tier** (the scaffolder's
co-drain overlays still have unmined small tiers), and treat ov002's remaining
arg-pack family as a permuter/.s endgame rather than a drain. The `0223a87c` guard-
chain template is banked if a future pass wants the medium byte-pack builders.

## Cross-references

- `docs/research/brief-358-ov002-routing-pass.md` — the source of the "~30–50"
  estimate (the whole arg-pack family) and the permuter-plateau / harness-gap findings
  this wave builds on.
- `src/overlay002/ov002_core.h` — §VERIFIED through brief 360 + the `0223a87c` medium
  guard-chain template + the recalibration.
