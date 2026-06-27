/* CAMPAIGN-PREP candidate for func_021c3150 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl r5/r4/r6 order; bind row(r8)+arr(r7); reload row+0x1c bound
 *   risk:       cf188 entry-guard is a SEPARATE read from the in-loop bound *(row+0x1c); if mwcc hoists/merges them the entry test or ldr count diverges. reshape-able (keep guard distinct, reload bound).
 *   confidence: med
 */
/* func_ov002_021c3150: player (arg0&1) row at cf16c+idx. Outer guard
 * cf188[idx]; scan first *(row+0x1c) entries of the 0x5d0 array (int*,
 * stride 4): if func_021b91f8(&arr[i], arg1) (i.e. arr[i]==*arg1) then
 * return func_021c30bc(arg0, i). Else fall through, return 0. Bound
 * *(row+0x1c) reloaded each iter (unsigned). */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf188[];
extern int  func_ov002_021b91f8(int *a, int *b);
extern int  func_ov002_021c30bc(int player, int i);

int func_ov002_021c3150(int player, int *key) {
    int idx = (player & 1) * 0x868;
    char *row = (char *)data_ov002_022cf16c + idx;
    int *arr = (int *)(row + 0x5d0);
    int i;
    if (*(int *)((char *)data_ov002_022cf188 + idx) == 0)
        return 0;
    for (i = 0; (unsigned)i < (unsigned)*(int *)(row + 0x1c); i++) {
        if (func_ov002_021b91f8(&arr[i], key))
            return func_ov002_021c30bc(player, i);
    }
    return 0;
}
