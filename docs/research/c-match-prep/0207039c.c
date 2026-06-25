/* CAMPAIGN-PREP candidate for func_0207039c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     global->p4->ctx chain; tail-call returns helper; range-check via +0xf6 mask
 *   risk:       the `(u8)(m8 + 0xf6) > 1` membership test: orig emits `add #0xf6;and #0xff;cmp #1;bhi` — must write `+0xf6` (not the equivalent `-0xa`) or mwcc picks a sub form (reshape-able). m44 returned both when !=0 and =0; offsets struct-guessed.
 *   confidence: med
 */
/* func_0207039c (main, class C): deref the global root chain to the active
 * ctx, then a guard cascade returning a field / a call / -1 / 0. */

struct CtxA4 {
    char          _pad_00[0x8];
    unsigned char m8;        /* +0x8 */
    unsigned char m9;        /* +0x9 */
    char          _pad_0a[0x44 - 0xa];
    int           m44;       /* +0x44 */
};
struct Root039c {
    char         _pad_00[0x4];
    struct Mid039c *p4;      /* +0x4 */
};
struct Mid039c {
    char         _pad_00[0xa4];
    struct CtxA4 *ctx;       /* +0xa4 */
};

extern char data_021a63d0[];
extern int  func_02074938(struct CtxA4 *p);

int func_0207039c(void) {
    struct CtxA4 *p;

    p = ((struct Root039c *)data_021a63d0)->p4->ctx;
    if (p == 0) return 0;

    if (p->m9 != 0)
        return func_02074938(p);

    if (p->m44 != 0) return p->m44;
    if (p->m8 == 4) return 0;
    if ((unsigned char)(p->m8 + 0xf6) > 1) return ~0;
    return 0;
}
