/* CAMPAIGN-PREP candidate for func_02288524 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order first-use; hold stride bind, reload sel+remul at loop tail
 *   risk:       orig reloads [r7,#2] and re-muls prod each iter; if mwcc hoists the player index out of the loop bound, the bottom mul/ldrh diverge. reshape-able (keep ctx->sel inside the while condition).
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

typedef struct { u16 unk0; u16 sel; } Ctx;

extern u32 data_ov002_022cf16c[];
extern u32 data_ov002_022cf180[];
extern int func_0202b878(int);
extern int func_0202b8f0(int);
extern int func_ov002_02291248(Ctx *);

int func_ov002_02288524(Ctx *ctx)
{
    u32 stride = 0x868;
    u32 prod;
    s32 i;
    char *base;
    u32 thr;
    s32 val;

    if (func_ov002_02291248(ctx) == 0)
        return 0;

    prod = (ctx->sel & 1) * stride;
    i = 0;
    if (*(u32 *)((char *)data_ov002_022cf180 + prod) > 0) {
        base = (char *)data_ov002_022cf16c;
        thr = stride + 0x15c;
        do {
            val = (*(u32 *)(base + prod + i * 4 + 0x418) << 19) >> 19;
            if (func_0202b878(val) == 9) {
                if (func_0202b8f0(val) >= (int)thr)
                    return 1;
            }
            i++;
        } while ((u32)i < *(u32 *)((char *)data_ov002_022cf16c + (ctx->sel & 1) * stride + 0x14));
    }
    return 0;
}
