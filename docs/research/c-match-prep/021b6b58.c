/* CAMPAIGN-PREP candidate for func_021b6b58 (ov010, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     021b46a8 clone with offsets +8/+4 shifted: ctx->field_0 guard, store r6 at +4, field_358
 *   risk:       Clone of 021b46a8; ctx read base is [r4] (offset 0) not [r4,#4] so field_4 differs from sibling. struct-guessed: 0x8c/0xe8/0x358 displacements inferred; confirm against real Ctx.
 *   confidence: med
 */
typedef struct Ctx021b6b58 {
    /* 0x000 */ int field_0;
    /* 0x004 */ int field_4;
    /* 0x008 */ char _pad8[0x84];
    /* 0x08c */ int field_8c;
    /* 0x090 */ char _pad90[0x58];
    /* 0x0e8 */ int field_e8;
    /* 0x0ec */ char _padec[0x26c];
    /* 0x358 */ unsigned int field_358;
} Ctx021b6b58;

typedef struct Glob021b6b58 {
    /* 0x000 */ char _pad0[0x94];
    /* 0x094 */ int field_94;
} Glob021b6b58;

typedef struct Arg021b6b58 {
    /* 0x00 */ short field_0;
    /* 0x02 */ short field_2;
    /* 0x04 */ short field_4;
    /* 0x06 */ short field_6;
} Arg021b6b58;

extern Glob021b6b58 data_ov010_021b9884;
extern Ctx021b6b58 data_ov010_021b9890;
extern void func_02037208(int a, int b, int c, int d);
extern int func_020b3870(int a, int b);
extern int func_ov005_021ac9c8(int a);
extern void func_ov010_021b3a14(void *p);

void func_ov010_021b6b58(int r0arg, Arg021b6b58 *r1arg)
{
    Ctx021b6b58 *ctx = &data_ov010_021b9890;
    int n;
    int v;

    n = func_ov005_021ac9c8(data_ov010_021b9884.field_94);
    v = 0;
    if (n > 0) {
        v = func_020b3870((int)r1arg->field_2 - 0x24, n);
    }

    if (ctx->field_0 != 2)
        return;
    if ((int)r1arg->field_6 - (int)r1arg->field_2 < n)
        return;
    if (v == ctx->field_e8) {
        ctx->field_358 |= 0x10;
        return;
    }

    func_ov010_021b3a14(&ctx->field_8c);
    ctx->field_4 = r0arg;
    func_02037208(0x38, 0x38 - 0x39, 0, 1);
}
