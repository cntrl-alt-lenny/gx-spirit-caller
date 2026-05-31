[//]: # (markdownlint-disable MD013 MD041)

# Brief 282 — canonical ov002 per-player-accessor signature + struct

**Status:** signature + struct recovered and verified. decomp.me /
research only — no SHA1, no `.c` shipped (pilots are direct-mwcc compiles
in `/tmp`, byte-compared vs the delinked `.o`). Fetched content as data.

## Headline

**The wave-4 register wall is a signature-liveness artifact, and the fix
is recovered + verified: pass the incoming args THROUGH to the row
helper.** 3 of the 5 deferred picks (`021ba1a0`, `021ba1e8`, `021bcfe4`)
flip to **byte-identical** with the canonical signature `f(int player,
int idx)` + the bitfield struct. The other 2 are **mis-grouped** — they
are different walls (leaf reg-alloc; predication), not the signature
issue — so they go to the permuter / gotcha-5+6, not this fix.

## (A) The mechanism — why minimal signatures lose a register

The matched `0x868` family (e.g. `func_ov002_02205508`,
`func_ov002_022003c4`) takes a **pointer/player + extra args** and
**passes them through to a row helper**. When the function calls
`helper(addr, idx)`, `idx` arrives in `r1` and is **never touched** in
the body, so mwcc keeps it **live in r1** across the function — `r1` is
reserved, and the index/value temp colours **r2**. A minimal
`f(int arg0)` frees `r1`, so mwcc colours that temp **r1** — the
1-register-off wall. (`(void)arg1` doesn't help — mwcc drops a dead
param; the arg must be *used*, i.e. passed to the helper.)

This is the **arg-liveness lever** (gotcha 9/15) specialized to the
per-player family: **recover the row helper's true arg-count and forward
the args.**

## (B) Verification — 3/5 byte-identical

Each compiled under our cflags (`mwcc 2.0/sp1p5`) and byte-compared vs
the delinked `.o` (only the `bl` placeholder `eb000000`/`ebfffffe`
differs — identical reloc, linker-filled).

| pick | shape | fix | result |
|---|---|---|---|
| `021ba1a0` | per-player append `helper(&row[p][0x260+cnt*4], idx); cnt++` | `f(int arg0, int arg1)`, **arg1→helper** | ✅ byte-identical (15/15) |
| `021ba1e8` | same, `+0x3a0`, count table `cf184` | same | ✅ byte-identical |
| `021bcfe4` | 2-D `row[p][idx*20].f30` guard → `helper(p, idx)` | `f(int player, int idx)`, **both→helper**, **bitfield struct** | ✅ byte-identical (19/19) |
| `021bad58` | 2-D **leaf** (2 tables, no helper) | — | ❌ leaf reg-alloc plateau (mine 21 vs orig 22 insns); no pass-through to anchor → permuter |
| `021b9ba0` | `f(int *self)` two bitfields + early-return | — | ❌ **predication** (mwcc predicates the tail vs orig `popeq`) + needs the bitfield struct; not a signature issue |

`021bcfe4` needed BOTH levers: the `(player, idx)` pass-through **and**
the field-as-bitfield (else mwcc folds `(v<<19)>>19` into a `tst #0x1fff`
mask instead of orig's `lsl#19; lsr#19`).

## The canonical signature + struct (for the decomper to include)

```c
/* ov002 per-player core — canonical layout + signature (brief 282).
 *
 * Per-player tables are 0x868 bytes/player, indexed (player & 1):
 *   data_ov002_022cf16c   row table (the dominant Cluster-A global)
 *   data_ov002_022cf17c / _022cf184            parallel per-player count tables
 *   data_ov002_022cf1a4 / _022cf1ac            parallel per-player field tables
 * Within a player row, 20-byte (0x14) sub-rows are indexed by `idx`.
 * The +0x30 field is a 13-bit value (orig reads it `lsl#19; lsr#19`)
 * — type it as an UNSIGNED BITFIELD, never `(v<<19)>>19` (mwcc folds
 * that to `& 0x1fff`; gotcha 6/16).
 */
typedef unsigned short u16;

struct Ov002SubRow {        /* at (rowbase + player*0x868 + idx*20) */
    char  _pad30[0x30];
    unsigned f30 : 13;      /* 13-bit field at +0x30 (bitfield, not a mask) */
    unsigned _f30_hi : 19;
};

/* CANONICAL SIGNATURE for a per-player accessor that calls a row helper:
 *
 *     ret func_ov002_XXXX(int player, int idx) {
 *         ... compute row[player&1][idx] ...
 *         return helper(player_or_addr, idx);   // forward idx (and player)
 *     }
 *
 * Forwarding the incoming args to the helper keeps them live in r0/r1,
 * reserving those registers so the row/index temp colours r2+ — matching
 * the original. A minimal f(int arg0) frees r1 and colours the temp one
 * register lower (the wave-4 1-reg-off wall).
 */
```

## Recovery recipe (generalises to the Cluster-A pass-through tier)

1. m2c-draft the pick (`tools/m2c_feed.py`); read the **helper call** —
   which incoming args reach it.
2. Give the function those args; **forward them to the helper** (don't
   recompute / drop them). `idx` forwarded → stays in `r1`.
3. Type any small field read at a fixed offset as an **unsigned
   bitfield** (gotcha 6), not a shift expression.
4. Compile + objdiff; the temp should now colour r2+ and match.

**Not covered by this fix:** leaf accessors (no helper to anchor
liveness — `021bad58`; reg-alloc plateau → permuter) and
predication-tail accessors (`021b9ba0` → gotcha 5 early-return + gotcha 6
bitfield). The brief-281 group of "5 deferred" mixed these in; the
signature fix converts the **pass-through-helper accessors** (the
dominant Cluster-A shape — likely many of the 141), not all 5.

## Falsification

- `func_ov002_021ba1a0`: `f(int arg0)` → temp in `r1` (the wall);
  `f(int arg0, int arg1)` + `helper(addr, arg1)` → temp in `r2` =
  byte-identical. Reproducible by toggling the 2nd arg.
- `func_ov002_021bcfe4`: shift-expression `f30` → `tst #0x1fff` (mask,
  diverges); `unsigned f30:13` bitfield → `lsl#19; lsr#19` = match.
- Leaf `021bad58` does **not** flip (no helper) — confirms the lever is
  helper-arg liveness, not just arg count.

## Scope

Research-only: the canonical signature + struct header above is the
decomper's deliverable to `#include` / inline; no `.c` shipped, no tool.
The brief-280 SDK leftovers fold into the normal drain (no separate
track), per the brief note.

## Cross-references

- `docs/research/brief-281-coldre-wave4-ov002-simple.md` — the 5 deferred
  picks + the 1-reg-off wall this resolves.
- `docs/research/brief-278-harvest-census-clusterA-map.md` — Cluster A
  (the 0x868 per-player core this signature serves).
- `docs/research/recipe-gotchas.md` — gotcha 9/15 (arg-liveness, the
  lever here), gotcha 6/16 (bitfield-not-mask), gotcha 5 (early-return,
  for `021b9ba0`).
- `src/overlay002/func_ov002_02205508.c` / `func_ov002_022003c4.c` — the
  matched siblings whose signatures seeded the recovery.
