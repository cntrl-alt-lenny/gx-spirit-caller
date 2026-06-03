[//]: # (markdownlint-disable MD013 MD041)

# Brief 318 — ov004 clean-C wave 2

**Brief:** 318 (decomper). Continue the ov004 clean-C drain (wave 1 = brief 316,
17 `.c`). ARM `<0x100` cohort (97 remaining). Recipe: `m2c_feed` →
`#include "ov004_core.h"` + guards → coerce → 3-region `ninja sha1`. Gate =
`ninja sha1`, NOT `ninja check` (ov004 label drift is benign, brief 818).
Family-first. Target ~12-18.

## Headline

**15 shipped, 3-region `ninja sha1` = OK.** The clean families (message,
handle-free, accessor/predicate, timer, struct-copy, sequence, cell-config)
matched reliably. The wave also surfaced a large **`changed`-bool reg-wall
family (~8 funcs)** and a few smaller reg-walled clusters, all deferred. Attempt
rate ~15/27 ≈ 56%.

## The 15 picks

| family | funcs |
|---|---|
| id-latch (sibling of 021cbf38) | `021da848` |
| handle-free (sibling of 021c9f94) | `021cfba0` (×3 handles) |
| status-message (`02034888`/`02037208`) | `021ceb24`, `021d97c8`, `021d9778`, `021ce9e4`, `021d9724` |
| timer-setter | `021d47bc`, `021d4958` |
| sequence / forwarder | `021d9ea4`, `021d3b74` |
| struct-copy dispatch | `021cc74c` (Copy32/Fill32 + guard-flip) |
| b500 state machine | `021d7c00` |
| MMIO | `021d8cd0` (sub-engine BLDALPHA) |
| cell-config | `021da898` (`021ca0a4` 6-arg + `021da100` + guarded `021d9ef0`) |

## Recipes banked (wave 2)

1. **Status-message family** (`func_02037208(ID, ID-(ID+1), 0, 1)`): writing the
   literal toast id with a literal `-1` reproduces mwcc's `mov r0,#ID; sub
   r1,r0,#(ID+1)` (it does NOT fold the −1 to `mvn` here) — confirmed for ids
   66/58/56. The packet buffer is a 2-`u16` local `{tag, b500.field}` passed to
   `02034888(3, buf, 4)`.
2. **handle-free** = N guarded `func_02006e1c(rec->unkN)` frees then N clears
   (021c9f94 ×2 wave 1, 021cfba0 ×3).
3. **struct-copy dispatch** (`021cc74c`): `Copy32(dst, src, n)` / `Fill32(value,
   dest, size)`; guard-flip so the empty-record `Fill32` path lands last.
4. (reconfirmed) cached-base for b500; guard-flip block layout; the `data_0210xxxx`
   main-symbol mislabel fix.

## Walls surfaced (deferred — reg-alloc / permuter tail)

- **`changed`-bool family (~8 funcs:** `021d48bc`, `021d52a0`, `021d4044`,
  `021d427c`, `021d43a0`, `021d4d8c`, `021d4804`, `021d5a10`**).** Shape:
  `int changed = 0; if (rec.unk38) { rec.unk38 = 0; changed = 1; } if (changed)
  …`. The orig reuses the dead `unk38` register (r0) for `changed`; mwcc
  allocates a fresh r1. One register off, on every member. Tried: store-`changed`
  instead of `0`, `!!`, explicit temp — none steer it. Prime permuter/`.s` target.
- **two-const message** (`021d1264`, `021d12b0`, `021d1308`): the two constant
  temps (buf value + a b500-field value) swap ip↔lr vs orig.
- **materialized-bool-global** (`021d4870`, `021d57ec`): `if (global != 0)
  return` — orig materialises the bool (`movne#1;moveq#0`), mwcc branches direct.
- **fn-ptr B6C dispatch** (`021cb518`, `021d6ed0`): field-address pooling on the
  `data_021040ac.B6C` increment (same wall as ov011 `021d0afc`).
- field-address pooling (`021cc2a4` RMW, `021d641c` base+212); dense jump table
  (`021ced78`); stack-heavy (`021ca128`, `021cfbec`); MMIO bitfield reg-alloc
  (`021d8d1c`).

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | **OK** (byte-identical, all 15 carved) |
| USA / JPN `ninja sha1` | OK (intact; EUR-only ship) |
| `check_match_invariants.py` | 0 errors (5027 warns, pre-existing + benign ov004 drift) |
| `ruff check .` | clean |
| `tests/` | passed |
| `ninja check` | NOT run (benign ov004 label drift, per the brief) |

EUR-only config change (`config/eur/.../ov004/delinks.txt` +15 `complete`
blocks). `src/overlay004/` gains 15 `.c`; `ov004_core.h` §VERIFIED extended.

## Recommendation for the brain

1. **ov004 clean-C is still rich** — ~82 ARM `<0x100` remain; clean families
   sustain ~12-15/wave. Several more message / timer / accessor functions exist.
2. **The `changed`-bool family (~8) is the dominant reg-wall** — a uniform 1-reg
   miss across siblings; ideal for a permuter pass or register-rename `.s` batch.
3. The THUMB `021dbxxx` utility cohort remains `.s`-escape territory (Thumb-align
   wall) — unchanged from wave 1.

## Cross-references

- `docs/research/brief-316-ov004-clean-c-wave1.md` — wave 1 (the pivot + recipe).
- `src/overlay004/ov004_core.h` — §VERIFIED updated with the wave-2 families.
