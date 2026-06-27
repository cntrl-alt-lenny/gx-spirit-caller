/* CAMPAIGN-PREP candidate for func_021deb28 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: zeroed 0x18 struct; merged=(f2&~1)|((u16)a0&1) bound to a local; pass merged (r3 no-reload); a0 held in r4
 *   risk:       struct-guessed: 021debe0 arg-count is inferred — orig leaves merged-f2 in r3 at the call (no reload), modeled as a 4th arg. If it is really 3-arg the extra r3 setup is harmless-but-different. Bind keeps r3 live (reshape-able).
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

/* r3 at the call is the merged f2 value (computed, not reloaded). Declared
 * 4-arg so the bound local stays live in r3 across the store. */
extern void func_ov002_021debe0(struct st_t *p, int a0, int a1, int merged);

void func_ov002_021deb28(int a0, int a1)
{
    struct st_t st;
    int merged;

    st.h0 = 0;
    st.f2 = 0;
    st.w4 = 0;
    st.w8 = 0;
    st.wc = 0;
    st.w10 = 0;
    st.w14 = 0;

    merged = (st.f2 & ~1) | ((u16)a0 & 1);
    st.f2 = (u16)merged;

    func_ov002_021debe0(&st, a0, a1, merged);
}
