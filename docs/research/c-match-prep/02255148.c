/* CAMPAIGN-PREP candidate for func_02255148 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: bind d016c base + 0x13a4 in callee regs across both loops; arg = d016c[0xcec]^k reloaded per outer iter; &&-chain guard then sink
 *   risk:       reshape-able: orig has a redundant `mov r6,r9; mov r8,r6` (inner-start held via an extra reg); a plain `for(j=0...)` likely drops it (1-2 mov diff). If it persists, init j from an outer zero local.
 *   confidence: med
 */
/* func_ov002_02255148: 2x5 nested scan. For k in 0..1: arg = *(int*)(d016c
 * +0xcec) ^ k; for j in 0..4: if 021baca8(arg,j,0x13a4)!=0 && 022550b8(arg)!=0
 * then 021de480(arg,j,0,0) and return 1. Returns 0 if nothing fires.
 * The d016c base stays in one reg across both loops; 0x13a4 stays hoisted. */
extern char data_ov002_022d016c[];
extern int  func_ov002_021baca8(int a, int b, int code);
extern int  func_ov002_022550b8(int a);
extern int  func_ov002_021de480(int a, int b, int c, int d);

int func_ov002_02255148(void) {
    int k, j;
    int arg;

    for (k = 0; k < 2; k++) {
        arg = *(int *)(data_ov002_022d016c + 0xcec) ^ k;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021baca8(arg, j, 0x13a4) != 0 &&
                func_ov002_022550b8(arg) != 0) {
                func_ov002_021de480(arg, j, 0, 0);
                return 1;
            }
        }
        }
    return 0;
}
