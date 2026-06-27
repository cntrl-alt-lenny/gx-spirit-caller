/* CAMPAIGN-PREP candidate for func_021b4e6c (ov010, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     tst-bit ctrl chain; store-order field_48/4e/4c exactly; signed-short cmp via ldrsh; flag in r1
 *   risk:       Function TRUNCATED in batch (ends at cmp r1,#1;bne .L_830 — tail past 0x830 missing). Body after flag-check guessed; func_ov010_021b23f4 call inferred. struct-guessed AND incomplete-asm: tail unknown.
 *   confidence: low
 */
typedef struct GlobA021b4e6c {
    /* 0x000 */ char _pad0[0xb0];
    /* 0x0b0 */ int field_b0;
    /* 0x0b4 */ char _padb4[0x24];
    /* 0x0d8 */ int field_d8;
} GlobA021b4e6c;

typedef struct CtxB021b4e6c {
    /* 0x000 */ char _pad0[0x220];
    /* 0x220 */ unsigned int field_220;
} CtxB021b4e6c;

typedef struct InputC021b4e6c {
    /* 0x00 */ char _pad0[0x52];
    /* 0x52 */ unsigned short field_52;
    /* 0x54 */ unsigned short field_54;
} InputC021b4e6c;

typedef struct StateD021b4e6c {
    /* 0x00 */ char _pad0[0x48];
    /* 0x48 */ short field_48;
    /* 0x4a */ char _pad4a[0x2];
    /* 0x4c */ unsigned short field_4c;
    /* 0x4e */ unsigned short field_4e;
} StateD021b4e6c;

extern InputC021b4e6c data_02104bac;
extern GlobA021b4e6c data_ov010_021b91b4;
extern CtxB021b4e6c data_ov010_021b9260;
extern StateD021b4e6c data_ov010_021b93d0;
extern void func_ov010_021b23f4(void);
extern int func_ov010_021b2480(int a);
extern int func_ov010_021b2488(int a);

void func_ov010_021b4e6c(void)
{
    CtxB021b4e6c *ctx = &data_ov010_021b9260;
    StateD021b4e6c *st = &data_ov010_021b93d0;
    int lo;
    int hi;
    int flag;
    unsigned short ctrl;

    lo = func_ov010_021b2480(data_ov010_021b91b4.field_d8);
    hi = func_ov010_021b2488(data_ov010_021b91b4.field_d8);
    flag = 0;
    if (hi < 0)
        hi = 0;

    ctrl = data_02104bac.field_54;
    if (ctrl & 0x2) {
        ctx->field_220 |= 0x4;
    } else {
        ctrl = data_02104bac.field_52;
        if ((ctrl & 0x40) && (short)st->field_48 > lo) {
            st->field_48 = st->field_48 - st->field_4c;
            flag = 1;
            if ((short)st->field_48 < lo)
                st->field_48 = lo;
            st->field_4e = st->field_4e + 1;
        } else if ((ctrl & 0x80) && (short)st->field_48 < hi) {
            st->field_48 = st->field_48 + st->field_4c;
            flag = 1;
            if ((short)st->field_48 > hi)
                st->field_48 = hi;
            st->field_4e = st->field_4e + 1;
        } else {
            st->field_4c = 1;
            st->field_4e = 0;
        }
    }

    if (st->field_4e > 0xa) {
        st->field_4e = 0;
        st->field_4c = st->field_4c + 1;
        if (st->field_4c > 0xc)
            st->field_4c = 0xc;
    }

    if (flag == 1) {
        func_ov010_021b23f4();
    }
}
