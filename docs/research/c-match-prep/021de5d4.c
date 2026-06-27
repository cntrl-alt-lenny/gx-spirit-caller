/* CAMPAIGN-PREP candidate for func_021de5d4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: zeroed 0x18 stack struct (decl-order word clears); f2 bit0=(u16)a0&1; mask=1<<(a1+a0*16); 021de41c template
 *   risk:       struct-guessed/store-order: orig zeros word0 first then clears w4..w14 just before the call and strh f2 last; if mwcc emits memset or reorders the [+0]/[+2] stores it diverges. 0x18 layout inferred.
 *   confidence: med
 */
typedef unsigned short u16;

/* 0x18 stack struct: u16 h0(+0), u16 f2(+2, bit0=flag), 5 zero words (+4..+0x14). */
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

int func_ov002_021de5d4(int a0, int a1, int a2)
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
    st.f2 = (st.f2 & ~1) | ((u16)a0 & 1);

    r = func_ov002_021de134(&st, mask, 0xf, a2);
    return (mask & r) ? 1 : 0;
}
