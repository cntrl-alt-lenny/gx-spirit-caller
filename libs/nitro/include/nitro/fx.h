/*
 * nitro/fx.h — NitroSDK fixed-point math surface.
 *
 * The DS has no FPU. Nintendo's FX library represents most world-space
 * values as 1.19.12 fixed-point (`fx32`) or 1.3.12 (`fx16`), with a
 * 12-bit fractional part. The corresponding ops live in two hardware
 * blocks and their SDK wrappers:
 *
 *   FX_Div / FX_Sqrt / FX_Inv  — ARM9 math coprocessor-backed divider
 *   FX_Sin / FX_Cos / FX_Atan2 — LUT-based, in .rodata (16384 entries)
 *
 * None of these are named in `config/eur/**/symbols.txt` yet — dsd
 * init only labelled the 18 BIOS SWI thunks at the top of ARM9 main.
 * Expect them to surface as `func_0xxxxxxx` is identified during
 * matching. When the decomper renames the first one to `FX_Sqrt` /
 * `FX_MulFx` / etc., this header is ready for them to `#include
 * <nitro/fx.h>` and have the signatures already declared.
 *
 * Signatures follow the canonical NitroSDK layout used by
 * pokeplatinum, dqix, NitroSDK-Decomp, etc. If mwcc later refuses a
 * match because our signature disagrees with the game's actual
 * calling convention, adjust here. Extend the visible surface as
 * needed — the point of this header is coverage, not completeness.
 */

#ifndef NITRO_FX_H_
#define NITRO_FX_H_

#include <nitro/types.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Constants
 * ------------------------------------------------------------------------
 *
 * FX_SHIFT == 12 : 12 fractional bits.
 * FX32_ONE       : 1.0 encoded in fx32 (== 1 << FX_SHIFT == 0x1000).
 * FX32_HALF etc. : common literals in encoded form.
 *
 * Use the FLT/INT conversion macros for authored constants so literal
 * 1.0 doesn't leak into game code as the magic number 0x1000. */

#define FX_SHIFT        12

#define FX32_ONE        (1 << FX_SHIFT)
#define FX32_HALF       (FX32_ONE / 2)
#define FX32_ZERO       0

#define FX16_ONE        (1 << FX_SHIFT)
#define FX16_HALF       (FX16_ONE / 2)
#define FX16_ZERO       0

#define FX64_ONE        ((fx64)1 << FX_SHIFT)

/* ------------------------------------------------------------------------
 * Conversion macros
 *
 * FX32_INT(i) / FX16_INT(i)     : int -> fx
 * FX32_FLT(f) / FX16_FLT(f)     : float literal -> fx
 * FX_FX32_TO_INT(x)             : fx -> int (truncation)
 * FX_FX32_TO_F32(x)             : fx -> float
 *
 * Macros (not inline funcs) to keep the CodeWarrior output identical
 * to what the SDK emits. */

#define FX32_INT(i)             ((fx32)(i) << FX_SHIFT)
#define FX16_INT(i)             ((fx16)((i) << FX_SHIFT))

#define FX32_FLT(f)             ((fx32)((f) * (float)FX32_ONE))
#define FX16_FLT(f)             ((fx16)((f) * (float)FX16_ONE))

#define FX_FX32_TO_INT(x)       ((s32)((x) >> FX_SHIFT))
#define FX_FX32_TO_F32(x)       ((f32)(x) / (f32)FX32_ONE)

#define FX_FX16_TO_INT(x)       ((s32)((x) >> FX_SHIFT))
#define FX_FX16_TO_F32(x)       ((f32)(x) / (f32)FX16_ONE)

#define FX32_TO_FX16(x)         ((fx16)(x))
#define FX16_TO_FX32(x)         ((fx32)(x))

/* ------------------------------------------------------------------------
 * Vector / matrix types
 *
 * Forward declarations only — field layouts are added in nitro/fx_vec.h /
 * nitro/fx_mtx.h as those surfaces get decomp'd. Opaque here so code
 * taking pointers compiles now. */

typedef struct VecFx32 VecFx32;
typedef struct VecFx16 VecFx16;
typedef struct MtxFx33 MtxFx33;
typedef struct MtxFx43 MtxFx43;
typedef struct MtxFx44 MtxFx44;

/* ------------------------------------------------------------------------
 * Scalar arithmetic
 *
 * FX_MulFx :  a * b  in fx32 (uses 64-bit intermediate to avoid overflow)
 * FX_DivFx :  a / b  in fx32 (hardware divider)
 * FX_InvFx :  1 / x  in fx32
 * FX_Sqrt  :  sqrt(x) for x >= 0
 * FX_ModS32:  signed mod */

fx32 FX_MulFx(fx32 a, fx32 b);
fx32 FX_DivFx(fx32 numer, fx32 denom);
fx32 FX_InvFx(fx32 x);
fx32 FX_Sqrt(fx32 x);
s32  FX_ModS32(s32 numer, s32 denom);

/* ------------------------------------------------------------------------
 * LUT-backed trigonometry
 *
 * Angles are encoded in the NitroSDK's 16-bit sweep: 0 = 0 deg, 0x10000
 * wraps (matches the HW rotation registers). Functions take u16 angle;
 * many callers pass s16 truncated to u16 and rely on two's-complement
 * wrapping. */

fx16 FX_SinIdx(u16 angle_idx);
fx16 FX_CosIdx(u16 angle_idx);
u16  FX_Atan2Idx(fx32 y, fx32 x);

/* ------------------------------------------------------------------------
 * Low-level primitives (hardware wrappers)
 *
 * FX_InitConsole / FX_InitDivider / FX_InitSqrt exist in the SDK but
 * are generally only called from ARM9 startup; re-declare here when
 * their callsites get decomp'd. */

#ifdef __cplusplus
}
#endif

#endif /* NITRO_FX_H_ */
