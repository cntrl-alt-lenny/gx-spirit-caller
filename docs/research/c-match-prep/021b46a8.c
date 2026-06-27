/* CAMPAIGN-PREP candidate for func_021b46a8 (ov010, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind ctx in r4 across uses; if-return early exits = conditional ldm epilogues; store r6 before call
 *   risk:       ctx->field_0 store maps to str r6,[r4]; field_0 collides with struct head. struct-guessed: offsets 0x4/0x84/0xe0/0x220 inferred from asm displacements, confirm against real Ctx struct.
 *   confidence: med
 */
typedef struct Ctx021b46a8 {
    /* 0x000 */ char _pad0[0x4];
    /* 0x004 */ int field_4;
    /* 0x008 */ char _pad8[0x7c];
    /* 0x084 */ int field_84;
    /* 0x088 */ char _pad88[0x58];
    /* 0x0e0 */ int field_e0;
    /* 0x0e4 */ char _pade4[0x13c];
    /* 0x220 */ unsigned int field_220;
} Ctx021b46a8;

typedef struct Glob021b46a8 {
    /* 0x000 */ char _pad0[0x12c];
    /* 0x12c */ int field_12c;
} Glob021b46a8;

typedef struct Arg021b46a8 {
    /* 0x00 */ short field_0;
    /* 0x02 */ short field_2;
    /* 0x04 */ short field_4;
    /* 0x06 */ short field_6;
} Arg021b46a8;

extern Glob021b46a8 data_ov010_021b91b4;
extern Ctx021b46a8 data_ov010_021b9260;
extern void func_02037208(int a, int b, int c, int d);
extern int func_020b3870(int a, int b);
extern int func_ov005_021ac9c8(int a);
extern void func_ov010_021b3a14(void *p);

void func_ov010_021b46a8(int r0arg, Arg021b46a8 *r1arg)
{
    Ctx021b46a8 *ctx = &data_ov010_021b9260;
    int n;
    int v;

    n = func_ov005_021ac9c8(data_ov010_021b91b4.field_12c);
    v = 0;
    if (n > 0) {
        v = func_020b3870((int)r1arg->field_2 - 0x24, n);
    }

    if (ctx->field_4 != 2)
        return;
    if ((int)r1arg->field_6 - (int)r1arg->field_2 < n)
        return;
    if (v == ctx->field_e0) {
        ctx->field_220 |= 0x10;
        return;
    }

    func_ov010_021b3a14(&ctx->field_84);
    ctx->field_0 = r0arg;
    func_02037208(0x38, 0x38 - 0x39, 0, 1);
}
