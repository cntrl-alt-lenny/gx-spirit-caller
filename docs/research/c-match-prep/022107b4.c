/* CAMPAIGN-PREP candidate for func_022107b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :6^:1 parity; conditional ldreqh sign-load; movne const return
 *   risk:       conditional-load + arg fold: orig does cmp g[0]==0x183e; ldreqh r1 then UNCONDITIONALLY bl -- a plain if() before the call should match, but mwcc may hoist/predicate differently. struct-guessed (g base via [0x48c], g-24 short field).
 *   confidence: med
 */
/* func_ov002_022107b4 (ov002, cls D): load g=*(022ce288+0x48c); parity from g->off2
 * (:6 bit5 ^ :1 bit0); if (arg0==parity && arg1==0xb): if g->off0 == 0x183e then arg1
 * = *(short)(g-24); call 022536e8(arg0/eh..,arg1); if result!=0 return 0x800 else 0.
 * LIT0=022ce288, off 0x48c holds the entity ptr; LIT1=0x183e. ip=g held in lr. */
extern int *data_ov002_022ce288[];
extern int  func_ov002_022536e8(int a, int b);
int func_ov002_022107b4(int a0, int a1) {
    unsigned short *g = (unsigned short *)data_ov002_022ce288[0x48c / 4];
    unsigned short h = g[1];           /* off2 */
    int parity = ((h << 0x11) >> 0x1f) ^ ((h << 0x1f) >> 0x1f);
    if (a0 != parity || a1 != 0xb)
        return 0;
    if (g[0] == 0x183e)
        a1 = *(short *)((char *)g - 24);
    if (func_ov002_022536e8(a0, a1) != 0)
        return 0x800;
    return 0;
}
