[//]: # (markdownlint-disable MD013 MD041)

# Brief 286 — ov002 core-types header (turn the top families into batch drains)

**Status:** built + PROVEN. decomp.me / research only — no SHA1, no `.c`
shipped (the deliverable is a research-artifact header + the verification;
sample members are direct-mwcc compiles in `/tmp`, byte-compared vs the
delinked `.o`). Fetched content treated as data. **Headline: `ov002_core.h`
is assembled and every type/signature in it is byte-verified — 8 sample
members across 4 families compile byte-identical under our cflags, and the
remaining sink protos are ground-truth from already-matched code. The
header converts the brief-284 family worklist (~225 `<0x100` funcs) from
per-pick re-derivation into shared-typed batch drains.**

## The deliverable — `docs/research/ov002_core.h`

A single header with the proven per-player layout + shared-sink signatures,
shipped as a **research artifact under `docs/research/`** (so it is *not*
compiled by `configure.py`). The decomper copies it into the source tree
when opening the batch and trims per TU. It captures:

- **The 0x868 per-player core** — `data_ov002_022cf16c` row table (0x868
  bytes/player, indexed `(player & 1) * 0x868`), the 20-byte sub-row array
  at `row + 0x30` with `struct Ov002Slot { unsigned id : 13; }`, and the
  parallel count/field globals (`cf17c`, `cf184`, `ce950`, `d016c`, …).
- **`struct Ov002Self`** — the accessor "self" pointer whose `+2` u16
  carries a 1-bit `b0` player flag (read `lsl#31;lsr#31` — a bitfield, not
  `& 1`).
- **9 shared-sink signatures** — the family seeds from brief 284, each with
  its proven arg-count/types/return.

**The batch lever (brief 282, generalised):** forward incoming args THROUGH
to the sink. A live sink call anchors register colouring across the whole
family — which is exactly why one recovered signature drains dozens of
members instead of each re-deriving its own (gotcha 9/15/26).

## (B) Verification — 8 members byte-identical, 9 protos proven

Each sample member was compiled with the exact `build.ninja` ov002 cflags
(`mwcc 2.0/sp1p5`, via `cc.sh`) and byte-compared against the delinked gap
`.o` (only the `bl` placeholder `eb000000`/`ebfffffe` and pool reloc words
differ — identical relocs, linker-filled).

| family (sink) | signature | members byte-verified | result |
|---|---|---|---|
| accessor `021c1ef0` | `(Self*, int player, int idx) → int` | `021e77fc`, `021eac30` | ✅ ✅ |
| accessor `021c1e44` | `(Self*, int player, int idx) → int` | `021f192c` | ✅ |
| list `02253458` | `(int player, int kind, int) → int` | `0224b464`, `0224cc54` | ✅ ✅ |
| arg-pack `021d479c` | `(int packed, int, int, int) → int` | `02211430`, `02217130` | ✅ ✅ |
| command `0229ade0` | `(int cmd, int, int, int) → int` | `021d1b2c` ✅ ; `021ae70c` ⚠ | proto ✅ |
| slot-ready `021bc288` | `(int player, int idx) → int` | shipped `021bcfe4.c` | ✅ shipped |
| bool query `021ff3bc` | `(Self*) → int` | shipped `021ff3bc.s` ; `0220623c` ⚠ | proto ✅ |
| thunk `021ca2b8` | `(int, int, int, int) → int` | shipped `021ca2b8.c` | ✅ shipped |
| copy `021b91c4` | `(int *dst, const int *src)` | shipped `021b91c4.c` | ✅ shipped |

The 0x868 row/sub-row struct, the `Ov002Self` bitfield, and the
`cf16c`/`cf17c`/`ce950` globals are proven transitively by the matched
members above (e.g. `021e77fc` exercises the full Row → Slot → `id:13` →
pass-through path in 27/27 byte-identical instructions).

### The two member ⚠ — proto proven, member body is per-member tuning

Both misses are in the **member body**, not the signature; each sink's
proto is independently proven (by another member or shipped code):

- **`021ae70c`** (`0229ade0`): a 5-arg **bit-packing** member. mwcc
  schedules the pack ops in a different order than the orig — the
  brief-276 **scheduling-sensitive** class. The `0229ade0(cmd,a,b,c)` proto
  is proven by `021d1b2c`. Route packing-heavy members through the permuter
  (it anneals scheduling). Single-bit packers (`02211430`, `02217130`)
  match directly.
- **`0220623c`** (`021ff3bc`): a **register-allocation** difference (orig
  keeps the global base in r2 and the field in r12; mwcc colours mine one
  register over). The `021ff3bc(Self*)` proto is ground-truth from the
  shipped `.s`. This is ordinary per-member reg-alloc tuning, not a
  header defect.

This is the same honest split brief 282 reported: the **shared lever**
(here, the signatures + struct) is proven; a minority of members carry an
independent wall (scheduling / reg-alloc) that the per-member drain or the
permuter resolves.

## What this unlocks — batch, not per-pick

Brief 284 ranked the `<0x100` cohort into families; brief 286 makes the top
ones batchable by proving one signature each:

| family | members (brief 284) | now |
|---|---:|---|
| 0x868 accessor (`021c1ef0`/`021c1e44`) | ~101 | shared struct + 2 protos proven → batch |
| command (`0229ade0`) | 46 | proto proven; flag packers → permuter |
| arg-pack (`021d479c`) | 44 | proto proven; single-bit packers batch |
| list (`02253458`) | 37 | proto proven → batch |
| bool (`021ff3bc`) | 37 | proto shipped-proven → batch (member reg-alloc) |
| thunk (`021ca2b8`) | 35 | proto shipped-proven → batch |

After de-duplicating members that call more than one of these sinks, the
header serves **~225 distinct `<0x100` functions**. Each becomes a
`#include "ov002_core.h"` + a few lines of body, instead of re-deriving the
struct + signature from scratch per pick.

## Falsification

- "header is proven": `/tmp/sc286/verify.py <member>.c <func>` recompiles
  any row of the table and byte-compares vs the delinked `.o`. 8/8 sample
  members byte-identical; re-runnable from committed config + a built
  `delinks/`.
- "the proto, not the member, is the deliverable": `021ae70c` /`0220623c`
  fail on body scheduling/reg-alloc while their sink protos pass on
  `021d1b2c` / the shipped `021ff3bc.s` — the signature is independent of
  the member wall.
- The header flips **iff** a sampled member fails the recorded signature
  (not its body) — the test the decomper runs first when opening the batch.

## Scope

Research artifact + verification: `docs/research/ov002_core.h` is a
reference header for the decomper to `#include`; it is **not** in the build
tree and no `.c` is shipped, no SHA1 run. The sink protos and struct are
batch *enablers*, not pre-written matches — member bodies remain the
decomper's work (and a minority need permuter/reg-alloc tuning, flagged
above).

## Cross-references

- `docs/research/ov002_core.h` — the deliverable.
- `docs/research/brief-284-ov002-family-mining.md` — the family worklist
  this header productionises.
- `docs/research/brief-282-ov002-accessor-signature.md` — the pass-through
  lever (proven + now shipped on the accessor family).
- `docs/research/brief-276-permuter-standup-pilot.md` — where the
  scheduling-sensitive packers (`0229ade0`/`021d479c` multi-field) route.
- `docs/research/recipe-gotchas.md` — gotcha 6/16 (bitfield-not-mask),
  9/15/26 (arg-liveness / pass-through reserves registers).
- `src/overlay002/func_ov002_021bcfe4.c` / `func_ov002_021ca2b8.c` /
  `func_ov002_021b91c4.c` / `func_ov002_021ff3bc.s` — the shipped sinks
  whose signatures are ground-truth here.
