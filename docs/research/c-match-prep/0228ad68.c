/* CAMPAIGN-PREP candidate for func_0228ad68 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hold stride+base bind; reload sel and re-mul prod at loop tail; off counter
 *   risk:       orig recomputes prod (r0=bit*r5) at loop bottom and reloads [r4,#2], but holds r8=base; if mwcc hoists prod, the tail mul diverges. note db10 arg order r0=val,r1=0,r2=1. reshape-able (re-read ctx->sel in while cond).
 *   confidence: med
 */
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

typedef struct { u16 unk0; u16 sel; } Ctx;

extern char data_ov002_022cf16c[];
extern u32 data_ov002_022cf178[];
extern int func_ov002_0227db10(int, int, int);

int func_ov002_0228ad68(Ctx *ctx)
{
    u32 stride = 0x868;
    u32 prod;
    s32 i;
    char *base;
    s32 off;
    s32 one;
    s32 val;

    prod = (ctx->sel & 1) * stride;
    i = 0;
    if (*(u32 *)((char *)data_ov002_022cf178 + prod) > 0) {
        base = data_ov002_022cf16c;
        off = 0;
        one = 1;
        do {
            val = (*(s32 *)(base + prod + off + 0x120) << 19) >> 19;
            if (func_ov002_0227db10(val, 0, one) != 0)
                return 1;
            i++;
            off += 4;
            prod = (ctx->sel & 1) * stride;
        } while ((u32)i < *(u32 *)(base + prod + 0xc));
    }
    return 0;
}
