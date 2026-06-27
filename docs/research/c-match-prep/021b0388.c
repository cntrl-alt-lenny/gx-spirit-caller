/* CAMPAIGN-PREP candidate for func_021b0388 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     compute idxA/idxB once (CSE byte offsets); unsigned clamp cmp; per-arm return codes
 *   risk:       permuter-class + struct-guessed: orig pins idxA->r5, idxB->r4, arg0->r6 across the whole chain (mwcc may swap r4/r5); AND _LIT3/_LIT4 (cf194 vs cf16c) pool-order is GUESSED — if reversed the two func_021b4054 table relocs swap.
 *   confidence: low
 */
/* func_ov002_021b0388: state-machine entry returning a status code 0..9.
 * Two parity-mul byte offsets into data_ov002_022cf18c: idxA=((1-arg0)&1)*0x868,
 * idxB=(arg0&1)*0x868, reused across the guard chain. Walks predicate calls
 * (021b025c/02f0/4054/bf50) and field comparisons in data_ov002_022d016c. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf18c[];
extern char data_ov002_022cf194[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021b025c(void);
extern int  func_ov002_021b02f0(int arg0);
extern int  func_ov002_021b4054(int arg0, int arg1, int arg2, int arg3);
extern int  func_ov002_021bbf50(int arg0);

int func_ov002_021b0388(int arg0) {
    int idxA = ((1 - arg0) & 1) * 0x868;
    int idxB = (arg0 & 1) * 0x868;
    if (*(int *)(data_ov002_022cf18c + idxA) != 0) return 2;
    if (*(int *)(data_ov002_022cf18c + idxB) != 0) return 0;
    if (func_ov002_021b025c() != 0) return 3;
    if (func_ov002_021b02f0(arg0) != 0) return 4;
    if (func_ov002_021b4054(*(int *)(data_ov002_022d016c + 0xcec), 0xb,
                            (int)data_ov002_022cf194, 5) != 0) {
        *(int *)(data_ov002_022d016c + 0xe0) = 1;
        return func_ov002_021bbf50(arg0) > 0 ? 6 : 0;
    }
    if (func_ov002_021b4054(arg0, 0xb, (int)data_ov002_022cf16c, 1) != 0)
        return 7;
    if (*(int *)(data_ov002_022cf18c + idxB) != 0) return 8;
    {
        int a = *(int *)(data_ov002_022cf18c + idxA);
        if (a == 0) return 1;
        if ((unsigned int)*(int *)(data_ov002_022d016c + 0xcf0) >=
            (unsigned int)(*(int *)(data_ov002_022d016c + 0xcf4) + 4)) {
            if (*(int *)(data_ov002_022cf18c + idxB) > a) return 9;
        }
    }
    return 0;
}
