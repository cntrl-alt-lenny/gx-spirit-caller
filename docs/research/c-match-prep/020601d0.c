/* CAMPAIGN-PREP candidate for func_020601d0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two adjacent zero-init out-words; classify ==-1, <=0, out1!=0, out0!=0; *err per branch
 *   risk:       the L_2a4 join sets *err=0 and returns r0-as-left (0 on the <=0 path); if mwcc materializes an explicit mov r0,#0 vs reuses the slot it diverges. reshape-able via return shape.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020601d0 (main, class C).
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:  zero-init two adjacent out-words (sp+0, sp+4); pass &out0/&out1; classify result by ==-1, <=0, then out1!=0, out0!=0; *err set per branch
 *   risk:    the two adjacent zero-init'd out-words and their reload order (out1 at sp+4 tested before out0 at sp+0); the L_2a4 fall-through return value
 *   confidence: med
 */
/* func_020601d0: func_02055030(arg1,0,&out0,&out1); if ==-1 log+notify+585d4,
 * return 3; if <=0 return 0 (*err=0); else if out1 set log,*err=4,return 0;
 * else if out0 set log,*err=3,return 0; else *err=0,return 0. */

extern int func_02055030(void *a1, int z, int *o0, int *o1);
extern void func_020585d4(void *c, int a1, int a2);
extern void func_0205ffd4(void *c, int a1, void *arg);
extern void func_020604a4(void *c, void *arg);
extern unsigned char data_02101280[];
extern unsigned char data_02101294[];
extern unsigned char data_021012cc[];
extern unsigned char data_021012e4[];

int func_020601d0(void *c, void *a1, int *err) {
    int out0 = 0;
    int out1 = 0;
    int r;

    r = func_02055030(a1, 0, &out0, &out1);
    if (r == -1) {
        func_020604a4(c, data_02101280);
        func_0205ffd4(c, 5, data_02101294);
        func_020585d4(c, 3, 1);
        return 3;
    }
    if (r <= 0) {
        *err = 0;
        return 0;
    }
    if (out1 != 0) {
        func_020604a4(c, data_021012cc);
        *err = 4;
        return 0;
    }
    if (out0 != 0) {
        func_020604a4(c, data_021012e4);
        *err = 3;
        return 0;
    }
    *err = 0;
    return 0;
}
