/* CAMPAIGN-PREP candidate for func_0225585c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: bind code=0x146f in a callee reg (orig add r2,r5,#0xb proves it); 2-arg local proto for 021bb90c (only r0/r1 set); &&-chain
 *   risk:       reshape-able: 021bb90c's real sig is 4-arg but only 2 args are set here; declaring it 2-arg gives the `mov r0;mov r1;bl`. If the campaign uses the 4-arg core proto, r2/r3 setup is added and diverges.
 *   confidence: med
 */
/* func_ov002_0225585c: 2x5 nested scan (sibling of 02255148). For k in 0..1:
 * arg = *(int*)(d016c+0xcec) ^ k; for j in 0..4: if 021baca8(arg,j,0x146f+0xb)
 * != 0 && 021bb90c(arg,0x146f)==0 then 021de480(arg,j,0,0) and return 1.
 * 0x146f is held in a callee reg (used as a base: +0xb for the first guard,
 * plain for the second) across both loops. Returns 0 otherwise. */
extern char data_ov002_022d016c[];
extern int  func_ov002_021baca8(int a, int b, int code);
extern int  func_ov002_021bb90c(int a, int b);
extern int  func_ov002_021de480(int a, int b, int c, int d);

int func_ov002_0225585c(void) {
    int code = 0x146f;
    int k, j;
    int arg;

    for (k = 0; k < 2; k++) {
        arg = *(int *)(data_ov002_022d016c + 0xcec) ^ k;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021baca8(arg, j, code + 0xb) != 0 &&
                func_ov002_021bb90c(arg, code) == 0) {
                func_ov002_021de480(arg, j, 0, 0);
                return 1;
            }
        }
    }
    return 0;
}
