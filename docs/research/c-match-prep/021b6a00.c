/* CAMPAIGN-PREP candidate for func_021b6a00 (ov010, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two ab3b4 calls (b then hw); table fetch via +lsl#2; bit-test hw>>5; bind g in r9
 *   risk:       Function TRUNCATED (ends at the r4!=0 / ab260!=0 branch, mov r2,#2;bl ab384 with no tail). field_348/210 table indexing guessed via displacement arithmetic. struct-guessed + incomplete-asm.
 *   confidence: low
 */
typedef struct Glob021b6a00 {
    /* 0x000 */ char _pad0[0x84];
    /* 0x084 */ int field_84;
    /* 0x088 */ char _pad88[0x8];
    /* 0x090 */ int field_90;
    /* 0x094 */ char _pad94[0x2b0];
    /* 0x344 */ int field_344;
    /* 0x348 */ int field_348[1];
    /* 0x34c */ char _pad34c[0x8];
    /* 0x354 */ int field_354;
} Glob021b6a00;

extern int data_02106804[];
extern Glob021b6a00 data_ov010_021b9884;
extern int data_ov010_021b9890[];
extern int func_ov005_021ab260(int a, int b);
extern int func_ov005_021ab384(int a, int b, int c);
extern int func_ov005_021ab3a0(int a, int b);
extern int func_ov005_021ab3b4(int a, int b);

int func_ov010_021b6a00(int idx, int *outA, int *outB)
{
    Glob021b6a00 *g = &data_ov010_021b9884;
    int a;
    int b;
    int hw;
    int base0;
    int base1;
    int r7;

    a = func_ov005_021ab3a0(g->field_90, idx);
    b = func_ov005_021ab3b4(g->field_90, idx);
    hw = func_ov005_021ab3b4(g->field_90, idx);
    hw = (hw << 16) >> 16;
    hw &= 0xffff;

    if (a == 0) {
        base0 = (&g->field_348)[b];
        base1 = g->field_354;
    } else {
        base0 = (&g->field_348)[a + (int)0xfffffd76 + (0x210 - 0x348) / 4];
        base1 = g->field_344;
    }
    r7 = base1 + base0;

    if (outA != 0) {
        if (func_ov005_021ab384(g->field_84, idx, 8) != 0)
            *outA = 4;
        else
            *outA = 0x3fff;
    }

    if (outB != 0) {
        if (func_ov005_021ab260(g->field_84, idx) != 0) {
            func_ov005_021ab384(g->field_84, idx, 2);
            /* tail truncated */
        } else if (func_ov005_021ab384(g->field_84, idx, 8) != 0) {
            *outB = 0x3fff;
        } else {
            if ((data_02106804[hw >> 5] & (1 << (hw & 0x1f))) != 0)
                *outB = 3;
            else
                *outB = 2;
        }
    }

    return r7;
}
