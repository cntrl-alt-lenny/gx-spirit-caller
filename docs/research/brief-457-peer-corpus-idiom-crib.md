[//]: # (markdownlint-disable MD013 MD041)

# Brief 457 — peer-corpus idiom crib (swarm finding P3)

**Brief:** 457 (decomper). Mine matched-C idioms from the **bit-identical**
compiler corpus to crack our open wall classes. Source of truth:
**RushRE/SonicRushAdventure-Decomp** — mwccarm 2.0/sp1p5, *exactly ours*, and it
ships the **complete verbatim NitroSDK source** (`lib/include/nitro/fx/*.h`,
`lib/NitroSDK/src/fx/*.c`). pret/pokeplatinum **strips** NitroSDK source (links
the real SDK) → **clean negative** for fx bodies.

## Result

- **1 wall cracked + shipped** (`func_02018f2c`, EUR): a Q12 distance function,
  `.s` → matched `.c`, operand-identical, 3-region `ninja sha1` OK.
- **Idiom crib banked** (below + in `ov000_core.h`).
- **Honest near-misses + negatives** documented (cross/dot product reg-alloc,
  overlay arg-homing, pokeplatinum SDK-stripped).

## THE FIXED-POINT CRIB (confirmed from the bit-identical compiler)

NitroSDK Q12 fixed point. `FX32_SHIFT = 12`, `fx32 = s32`, `fx64 = s64`,
`VecFx32 = { fx32 x, y, z; }`.

### FX_Mul — the `smull;adds #0x800;adc;lsr #0xc;orr ...,lsl #0x14` wall

```c
#define FX_Mul(v1, v2) (fx32)(((s64)(v1) * (v2) + 0x800LL) >> 12)
```

Verbatim from `lib/include/nitro/fx/fx.h` (`FX_MulInline`). The `+0x800`
(=`1<<11`) round-bias and the `lsl #0x14` (=32−12) recombine are the fingerprint.
**This is the idiom that cracks the whole fixed-point wall class.** A 64-bit
signed multiply rounded back to Q12.

### Distance / magnitude — `FX_Sqrt(FX_Mul(dx,dx) + FX_Mul(dy,dy))`

```c
fx32 dx = ax - bx, dy = ay - by;
return FX_Sqrt(FX_Mul(dx, dx) + FX_Mul(dy, dy));   /* 2D; add dz term for 3D VEC_Mag */
```

This is `VEC_Mag` / `VEC_Distance`. **`func_0208bf3c` = `FX_Sqrt`** (1 fx32 in,
fx32 out — a hardware-CP leaf, *no* inline body to byte-match). The "sum of
squares" caller is the tell. **CRACKED `func_02018f2c` with this** (see below).

### SDK helper identities (high-confidence by signature)

| our symbol | NitroSDK | note |
|------------|----------|------|
| `func_0208bf3c` | `FX_Sqrt(fx32)` | HW CP-sqrt leaf; sum-of-squares callers = VEC_Mag |
| `func_0208c490` | `FX_Div(fx32,fx32)` | HW CP-divide leaf; **variable** divisors only |
| `func_0208c3e4` | `VEC_DotProduct` | `smull;smlal;smlal;+0x800;>>12` (near-miss, below) |
| `func_0208c348` | `VEC_CrossProduct` | 3× `smull;subs;+0x800;>>12` (near-miss, below) |

### Divide-by-CONSTANT = the `umull;mla;asr #0x1f;mla;adc #0x800;asr #0xc` magic

NOT a distinct SDK call. It's mwcc's signed 64-bit product of an fx32 by a
**compile-time-constant** reciprocal (`FX_Mul(x, K)` strength-reduced). Reproduce
with the FX_Mul body, one operand a literal. Corroborates the project's existing
rule ([[reference_ov010_decomper_track]]/ov016): **constant divisor inlines &
matches; only a VARIABLE divisor calls the HW helper — never C `/` for the
variable case** (mwcc emits `_s32_div_f`, undefined-fails at link).

## The crack — `func_02018f2c` (shipped)

```
bl GetSystemWork ; ldr ×4 fields ; sub dy ; sub dx
smull/adds#0x800/adc/lsr#0xc/orr lsl#0x14  ×2   ; FX_Mul(dx,dx), FX_Mul(dy,dy)
add ; bl func_0208bf3c                          ; FX_Sqrt(sum)
```

```c
fx32 func_02018f2c(void) {
    char *p = GetSystemWork();
    fx32 dy = *(fx32 *)(p + 0x914) - *(fx32 *)(p + 0x90c);
    fx32 dx = *(fx32 *)(p + 0x910) - *(fx32 *)(p + 0x908);
    return func_0208bf3c(FX_Mul(dx, dx) + FX_Mul(dy, dy));
}
```

Operand-identical to baserom on first compile (only the unlinked `bl` reloc
differs → resolves at link). **Declaration order matters:** `dy` before `dx` so
the loads emit in the baserom's `_914,_90c,_910,_908` order; the sum keeps
`FX_Mul(dx,dx)` first (first-evaluated term → first `smull`).

## Near-misses (reg-alloc residue — stays permuter/`.s`, per project canon)

- **`func_0208c348` VEC_CrossProduct**: canonical C compiles to 160 vs 156 bytes
  — 9-register interleave, +1 instr off. Reg-alloc/schedule wall.
- **`func_0208c3e4` VEC_DotProduct**: 2-instr off — baserom materialises the
  `+0x800` in a register (`mov r0,#0x800; adds r0,r4,r0`) where mwcc picks the
  immediate (`adds r0,r4,#0x800`); cascading reg choice (b->z in r1 vs r0).
- **`func_ov011_021d22d4`** (overlay distance, 4 scalar fx32 args): baserom homes
  all 4 args to stack (`stmdb {r0-r3}` then reads back); the direct C keeps them
  in registers. Arg-homing quirk.

These confirm the harvest's structural finding: **even a mature mwccarm-2.0 peer
project (SonicRushAdventure: 99 NON_MATCHING files, 75 decomp.me-scratch links)
leaves the same CSE-of-base / reg-swap / schedule residue we wall on.** The
idioms crack the **tractable tier** (pure FX_Mul / magnitude), not the hard
reg-alloc tier.

## Broader crib (harvested, for future application)

- **Byte-pack**: keep the running word in one reg, table base in another; `& 0xff`
  forces the index mask; truncate table entries with `(u8)`/`(u16)`. (Confirms our
  existing `(u8)` byte-pack lever, ov002_core.h.)
- **Cached-base**: cache the object base ONCE in a `char *` local, fields as
  `*(T*)(p + off)` → each access one `ldr/str [p,#N]`, no recompute. (MMIO
  double-RMW is the exception: use absolute addresses, [[reference_ov016_decomper_track]].)
- **Reg-alloc steering playbook (cheapest first)**: (1) reorder local decls into
  the orig's first-use order; (2) alias a re-read field through `volatile T*` to
  stop a CSE; (3) replace `t=a;a=b;b=t` with XOR-swap when an extra temp appears;
  (4) force/forbid inlining to fix sub-expression eval order. If none take in 1–2
  tries → permuter or `.s`. (The steering knowledge lives in SonicRush + decomp.me
  scratches, NOT in pret docs — pokeplatinum/pokediamond punt to asmdiff
  trial-and-error: clean negative.)

## Negatives

- pokeplatinum/pokediamond: NitroSDK source stripped + no inline reg-alloc lore →
  not a useful corpus for this question.
- `FX_Sqrt`/`FX_Div` have NO arithmetic body to byte-match (MMIO leaves) — don't
  try to reproduce them with smull; just call/identify them.
- No standalone `FX_InvSqrt` in NitroSDK (folded into VEC_Normalize).
