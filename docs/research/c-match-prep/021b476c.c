/* CAMPAIGN-PREP candidate for func_021b476c (ov010, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitmask bit-test idx>>5 / 1<<(idx&0x1f); signed halfword (x<<16>>16)&0xffff; bind ctx in r5
 *   risk:       bit-test branch polarity: orig does tst then moveq r2,#0 / cmp / streq 2 / strne 0x3fff (clear=2, set=0x3fff). My if() may invert the eq/ne legs. reshape-able: swap the two store branches.
 *   confidence: low
 */
typedef struct Glob021b476c {
    /* 0x000 */ char _pad0[0x128];
    /* 0x128 */ int field_128;
} Glob021b476c;

typedef struct Ctx021b476c {
    /* 0x000 */ char _pad0[0x7c];
    /* 0x07c */ int field_7c;
    /* 0x080 */ char _pad80[0xe4];
    /* 0x164 */ int field_164;
    /* 0x168 */ int *field_168;
    /* 0x16c */ int field_16c;
} Ctx021b476c;

extern int data_021067d4[];
extern Glob021b476c data_ov010_021b91b4;
extern int data_ov010_021b91c0[];
extern Ctx021b476c data_ov010_021b9260;
extern int func_ov005_021ab260(int a, int b);
extern int func_ov005_021ab384(int a, int b, int c);
extern int func_ov005_021ab3a0(int a, int b);
extern int func_ov005_021ab3b4(int a, int b);

int func_ov010_021b476c(int idx, int *outA, int *outB)
{
    Ctx021b476c *ctx = &data_ov010_021b9260;
    int a;
    int hw;
    int r4;

    a = func_ov005_021ab3a0(data_ov010_021b91b4.field_128, idx);
    hw = func_ov005_021ab3b4(data_ov010_021b91b4.field_128, idx);
    hw = (hw << 16 >> 16) & 0xffff;

    if (a != 0) {
        r4 = ctx->field_164 + data_ov010_021b91c0[a + (int)0xfffffd76];
    } else {
        r4 = ctx->field_16c + ctx->field_168[hw];
    }

    if (outA != 0) {
        if ((data_021067d4[idx >> 5] & (1 << (idx & 0x1f))) != 0)
            *outA = 0x3fff;
        else
            *outA = 2;
    }

    if (outB != 0) {
        if (func_ov005_021ab260(ctx->field_7c, idx) == 0) {
            *outB = 0x3fff;
        } else {
            if (func_ov005_021ab384(ctx->field_7c, idx, 2) != 0)
                *outB = 0;
            else
                *outB = 1;
        }
    }

    return r4;
}
