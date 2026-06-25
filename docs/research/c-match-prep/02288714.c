/* CAMPAIGN-PREP candidate for func_02288714 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla base+sel*stride; i counter 0..4 step 0x14; bind base+stride
 *   risk:       loop is count 0..5 (cmp #5/blt) with i stepping 0x14; the placeholder do-while tail is wrong C — must be for(n=0;n<5;n++) with separate i+=0x14. reshape-able (rewrite loop as counted n<5, keep i as parallel byte offset).
 *   confidence: low
 */
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

typedef struct { u16 unk0; u16 sel; } Ctx;

extern char data_ov002_022cf16c[];
extern int func_0202f9e8(int);

int func_ov002_02288714(Ctx *ctx)
{
    s32 i = 0;
    char *base = data_ov002_022cf16c;
    u32 stride = 0x868;
    char *p;
    s32 a;
    u16 b;

    do {
        p = base + (ctx->sel & 1) * stride + i;
        a = (*(s32 *)(p + 0x30) << 19) >> 19;
        b = *(u16 *)(p + 0x38);
        if (b != 0) {
            if (func_0202f9e8(a) != 0)
                return 1;
        }
        i += 0x14;
    } while (++( *(volatile int*)0, i ) , 0);
    return 0;
}
