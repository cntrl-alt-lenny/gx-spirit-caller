/* CAMPAIGN-PREP candidate for func_0203a8dc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     lsr#0x14&0xf discriminant; bind r5(field_14) and r6(irq) across calls; multi-cmp && chain via cmpne
 *   risk:       orig computes disc=(r5>>0x14)&0xf BEFORE the two bl calls and keeps r4/r5/r6 live across them; if mwcc recomputes the shift+mask after the calls the and/mov ordering diverges. reshape-able (compute disc early into its own local)
 *   confidence: med
 */
#include <stdio.h>

typedef unsigned int u32;
typedef int s32;

struct Ctx_a8dc {
    unsigned char _pad0[0x8];
    u32 *field_8;      /* +0x8 : if !=0 -> [field+4]=0; field_8=0 */
    unsigned char _pad0c[0x14 - 0xc];
    u32 field_14;      /* +0x14 : lsr#0x14 & 0xf discriminant */
};

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern u32 data_0219c494;
extern void func_0207cff4(u32 *g, struct Ctx_a8dc *ctx);
extern void func_02038c98(struct Ctx_a8dc *ctx, int one);
extern void func_02089008(u32 r5, int z);

void func_0203a8dc(struct Ctx_a8dc *ctx) {
    u32 *p;
    int irq;
    u32 r5;
    int disc;

    p = ctx->field_8;
    if (p != 0) {
        p[1] = 0;
        ctx->field_8 = 0;
    }
    irq = OS_DisableIrq();
    r5 = ctx->field_14;
    disc = (r5 >> 0x14) & 0xf;
    func_0207cff4(&data_0219c494, ctx);
    func_02038c98(ctx, 1);
    if (disc != 0xc && disc != 0xd && disc != 0x6) {
        func_02089008(r5, 0);
    }
    OS_RestoreIrq(irq);
}
