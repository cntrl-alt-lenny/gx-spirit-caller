/* CAMPAIGN-PREP candidate for func_021de41c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     zeroed 0x18 stack struct; store-order word clears; ldrh/bic/orr bit0 merge at +2
 *   risk:       Orig clears via single lr=0 reg stored word-by-word then strh h0 BEFORE the bic/orr at +2; mwcc may emit memset or reorder the [+0]/[+2] halfword stores. struct-guessed (field sizes inferred; confirm 0x18 layout).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021de41c (ov002, class D) — MED tier.
 *   recipe: zero 0x18 stack struct (decl-order field stores); merge bit0=a0&1 into [+2]; call
 * func_021de41c(a0,a1,a2): build a zeroed 0x18 struct, st.h0=(u16)a1, st.f2.bit0=a0&1,
 *   then 021de134(&st, a2, 0xe, 2).
 */

typedef unsigned short u16;

struct st_t {
    u16 h0;     /* +0x00 */
    u16 f2;     /* +0x02, bit0 = a0&1 */
    int w4;     /* +0x04 */
    int w8;     /* +0x08 */
    int wc;     /* +0x0c */
    int w10;    /* +0x10 */
    int w14;    /* +0x14 */
};

extern void func_ov002_021de134(struct st_t *p, int a2, int b, int c);

void func_ov002_021de41c(int a0, int a1, int a2)
{
    struct st_t st;

    st.h0 = 0;
    st.f2 = 0;
    st.w4 = 0;
    st.w8 = 0;
    st.wc = 0;
    st.w10 = 0;
    st.w14 = 0;

    st.h0 = (u16)a1;
    st.f2 = (st.f2 & ~1) | ((u16)a0 & 1);

    func_ov002_021de134(&st, a2, 0xe, 2);
}
