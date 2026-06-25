/* CAMPAIGN-PREP candidate for func_020526b8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store v->x2c; call; reload *g; store returned r0/r1 pair to x24/x28 in order
 *   risk:       Orig keeps the PRODUCT id*0x30 in r4 across the call (one mul) and reloads only *g; if mwcc keeps `id` instead and re-issues the mul after the call, an extra mul diverges. permuter-class (raw byte-product not directly nameable in typed C).
 *   confidence: med
 */
/* func_020526b8 — main, cls C. mul-index base, store post-call pair. COMPLETE.
   idx product id*0x30 held in callee-saved r4 across the bl; *g reloaded after
   the call (call clobbers, must reload). func_020930b0 returns the (r0,r1) pair. */
typedef struct Ring {
    unsigned char _p0[0x24];
    int           x24;    /* +0x24 */
    int           x28;    /* +0x28 */
    int           x2c;    /* +0x2c */
} Ring;                   /* sizeof == 0x30 */

extern Ring *data_0219e3ec;
extern long long func_020930b0(void);

int func_020526b8(int id, int v)
{
    if (data_0219e3ec == 0)
        return 0;

    data_0219e3ec[id].x2c = v;
    {
        long long r = func_020930b0();
        data_0219e3ec[id].x24 = (int)r;
        data_0219e3ec[id].x28 = (int)((unsigned long long)r >> 32);
    }
    return 1;
}
