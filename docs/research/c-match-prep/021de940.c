/* CAMPAIGN-PREP candidate for func_021de940 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: zeroed 0x18 struct; h0=(u16)a3; f2 bit0=(u16)(a0^a2)&1; mask=1<<(a1+a0*16); b=0xb
 *   risk:       store-order: orig interleaves strh a3->[sp+0] mid-build then strh f2->[sp+2] last, amid the w4..w14 zero stores. If mwcc groups the stores or reorders h0 vs f2 it diverges. struct-guessed 0x18.
 *   confidence: med
 */
typedef unsigned short u16;

struct st_t {
    u16 h0;
    u16 f2;
    int w4;
    int w8;
    int wc;
    int w10;
    int w14;
};

extern int func_ov002_021de134(struct st_t *p, int mask, int b, int c);

int func_ov002_021de940(int a0, int a1, int a2, int a3)
{
    struct st_t st;
    int mask;
    int r;

    st.h0 = 0;
    st.f2 = 0;
    st.w4 = 0;
    st.w8 = 0;
    st.wc = 0;
    st.w10 = 0;
    st.w14 = 0;

    mask = 1 << (a1 + a0 * 16);
    st.h0 = (u16)a3;
    st.f2 = (st.f2 & ~1) | ((u16)(a0 ^ a2) & 1);

    r = func_ov002_021de134(&st, mask, 0xb, 0);
    return (mask & r) ? 1 : 0;
}
