/* CAMPAIGN-PREP candidate for func_0205fd94 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl buf then three out-words first-used-first to force ascending stack slots; one stacked arg/call
 *   risk:       mwcc owns stack-frame layout; exact slot map (buf@4, outs@0x44/48/4c) likely diverges - permuter-class / may need .s. struct-guessed slots.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0205fd94 (main, class C).
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:  declare locals first-used-first (buf[0x40] at sp+4, then three out-words at sp+0x44/48/4c) to drive ascending stack slots; one stacked arg per call
 *   risk:    mwcc owns stack layout - the exact slot assignment (buf@0x4, outs@0x44/48/4c, spill@0) may differ; that is the dominant divergence
 *   confidence: low
 */
/* func_0205fd94: func_020602c4 fills a 0x40 buffer from arg3+fmt; if ok,
 * func_020aac84 parses buf into 3 out-words (must return 3); then forward to
 * func_0205fe18(r0, &out0, arg1, 2, 0). */

extern int func_020602c4(void *src, void *fmt, void *dst, int len);
extern int func_020aac84(void *buf, void *fmt, void *o0, void *o1, void *o2);
extern int func_0205fe18(void *a0, void *p, void *a1, int two, int zero);
extern unsigned char data_021011bc[];
extern unsigned char data_021011c4[];

int func_0205fd94(void *a0, void *a1, void *unused2, void *arg3) {
    char buf[0x40];
    int o0;
    int o1;
    int o2;

    if (func_020602c4(arg3, data_021011bc, buf, 0x40) == 0) {
        return 0;
    }
    if (func_020aac84(buf, data_021011c4, &o0, &o1, &o2) != 3) {
        return 3; /* returns the call result (==!3); value carried in r0 */
    }
    return func_0205fe18(a0, &o0, a1, 2, 0);
}
