/* CAMPAIGN-PREP candidate for func_0220419c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfields a/b/c; mla parity-base + b*0x14 slot precomputed; if-assign guard chains
 *   risk:       reg-reuse of r5(code) + r1(=a) + r2(=b) reused as both compare-operands and call-args. mwcc will likely re-extract bitfields or reload ctx fields instead of mirroring r1/r2 — permuter-class register rotation; also slot index expr may diverge.
 *   confidence: low
 */
#include "types.h"

typedef struct Code_19c {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_19c;

typedef struct Obj_19c {
    u16 pad0;
    Code_19c code;   /* +0x2 */
} Obj_19c;

typedef struct Ctx_19c {
    int f0;          /* +0x0 */
    int f4;          /* +0x4 */
    u8 pad8[0x14];
    int f1c;         /* +0x1c */
    int f20;         /* +0x20 */
} Ctx_19c;

extern int data_ov002_022cf1a8[2][0x868 / 4];
extern Ctx_19c data_ov002_022cd3f4;
extern int func_ov002_021c8940(int a, int b);

int func_ov002_0220419c(Obj_19c *obj) {
    int a;
    int b;
    int *base;
    int slot;
    Ctx_19c *ctx;
    a = obj->code.a;
    b = obj->code.b;
    base = data_ov002_022cf1a8[a & 1];
    slot = base[b * 0x14 / 4];
    if (obj->code.c != 0xd) {
        return 1;
    }
    ctx = &data_ov002_022cd3f4;
    if (ctx->f0 == a && ctx->f1c == b) {
        if (func_ov002_021c8940(ctx->f4, ctx->f20) != 0 && slot == 0) {
            return 1;
        }
        return 0;
    }
    if (ctx->f4 == a && ctx->f20 == b) {
        if (func_ov002_021c8940(ctx->f4 /*->f1c reload*/, ctx->f1c) != 0 && slot == 0) {
            return 1;
        }
        return 0;
    }
    return 0;
}
