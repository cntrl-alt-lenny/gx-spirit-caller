/* CAMPAIGN-PREP candidate for func_022558ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: bind code=0x1784 callee reg (+0x190 for g1, plain g2/g3); pre-materialize 0/1 args; keep invariant guards 2/3 inside the loop via &&
 *   risk:       reshape-able: orig pre-loads the constant guard args 0 and 1 into callee regs (mov r7,#0;mov r5,#1) before the loop and does NOT hoist the invariant guards 2/3; mwcc may hoist or re-materialize. If so, force with named locals.
 *   confidence: low
 */
/* func_ov002_022558ec: 2x5 nested scan (sibling of 0225585c) with three
 * guards. For k in 0..1: arg = *(int*)(d016c+0xcec) ^ k; for j in 0..4:
 * if 021baca8(arg,j,0x1784+0x190)!=0 && 021bb950(0,0x1784)==0 &&
 * 021bb950(1,0x1784)==0 then 021de480(arg,j,0,0) and return 1. Guards 2/3 are
 * loop-invariant but the orig still evaluates them inside the inner loop.
 * 0x1784 is held in a callee reg (base for guard1's +0x190, plain for 2/3). */
extern char data_ov002_022d016c[];
extern int  func_ov002_021baca8(int a, int b, int code);
extern int  func_ov002_021bb950(int a, int x);
extern int  func_ov002_021de480(int a, int b, int c, int d);

int func_ov002_022558ec(void) {
    int code = 0x1784;
    int k, j;
    int arg;

    for (k = 0; k < 2; k++) {
        arg = *(int *)(data_ov002_022d016c + 0xcec) ^ k;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021baca8(arg, j, code + 0x190) != 0 &&
                func_ov002_021bb950(0, code) == 0 &&
                func_ov002_021bb950(1, code) == 0) {
                func_ov002_021de480(arg, j, 0, 0);
                return 1;
            }
        }
    }
    return 0;
}
