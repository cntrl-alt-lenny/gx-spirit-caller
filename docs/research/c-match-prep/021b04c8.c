/* CAMPAIGN-PREP candidate for func_021b04c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Parity (s&1)/((s^1)&1)*0x868 stores in order; &&-guard; if/elif verdict; bind H[4]
 *   risk:       reshape-able: a==0&&b==0 guard then a!=0&&b==0 verdict re-tests a/b; mwcc may CSE the cmps differently — flip to nested if to match the cmpeq chain.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021b04c8 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: parity-index stores (s&1 / (s^1)&1)*0x868
 * base, store-order a-then-b, &&-guard chain, if/elif state set; bind H[4] once.
 * func_021b0388(side) called twice (side, side^1); both results steer two stores
 * into data_022cf198 at the two parity halves, then a 1/2/3 verdict into G[0xd00].
 */
extern int func_ov002_021b0388(int);
extern int  data_ov002_022d016c[];   /* G: word struct, byte-offset access */
extern int  data_ov002_022cd744[];   /* word array, indexed by G[0xcec]      */
extern int  data_ov002_022cd73c[];   /* H: word struct (H[1] == [+0x4])      */
extern int  data_ov002_022cf198[];   /* parity-store base, +0/+0x868 halves  */

int func_ov002_021b04c8(void) {
    int a, b, s;
    if (*(int *)((char *)data_ov002_022d016c + 0xd0c) != 0) {
        if (data_ov002_022cd744[*(int *)((char *)data_ov002_022d016c + 0xcec)] == 2)
            return 0;
    }
    a = func_ov002_021b0388(*(int *)((char *)data_ov002_022cd73c + 0x4));
    b = func_ov002_021b0388(*(int *)((char *)data_ov002_022cd73c + 0x4) ^ 1);
    if (a == 0 && b == 0 && *(int *)((char *)data_ov002_022d016c + 0xe0) == 0) {
        s = *(int *)((char *)data_ov002_022cd73c + 0x4);
        *(int *)((char *)data_ov002_022cf198 + (s & 1) * 0x868) = a;
        *(int *)((char *)data_ov002_022cf198 + ((s ^ 1) & 1) * 0x868) = b;
        if (a != 0 && b == 0)
            *(int *)((char *)data_ov002_022d016c + 0xd00) = 1;
        else if (a == 0 && b != 0)
            *(int *)((char *)data_ov002_022d016c + 0xd00) = 2;
        else
            *(int *)((char *)data_ov002_022d016c + 0xd00) = 3;
        *(int *)((char *)data_ov002_022d016c + 0xe0) = 1;
        return 1;
    }
    return 0;
}
