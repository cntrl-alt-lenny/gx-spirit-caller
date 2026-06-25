/* CAMPAIGN-PREP candidate for func_02040258 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     plain constants; reload v=*p between the two clamps (orig re-ldr); rsbge = if(v>=k) *p=-v
 *   risk:       second clamp: orig does 'rsbge r0,r1,#0; strge' (predicated negate-store, no branch) reusing v already in r1. mwcc may emit a branch+rsb instead of conditional store. reshape-able-ish but predication is permuter-class if -O4 won't if-convert.
 *   confidence: med
 */
/* func_02040258 (C, 148B): conditional memset, memcpy, then two clamp steps on *r4.
 * g=*data_0219d9d4. if(g==0) func_020945f4(arg0,0,0x1c4). Then func_02094688((char*)g+0x1008,arg0,0x1c4).
 * v=*(int*)arg0. if(v<0x4e20 || v>=0x7530) *arg0=0x5206. if(v>=0x4e84) *arg0=-v.
 */
extern char *data_0219d9d4;
extern void func_020945f4(void *dst, int val, int n);
extern void *func_02094688(void *dst, void *src, int n);

void func_02040258(int *p) {
    int v;
    if (data_0219d9d4 == 0) {
        func_020945f4(p, 0, 0x1c4);
    }
    func_02094688(data_0219d9d4 + 0x1008, p, 0x1c4);
    v = *p;
    if (v < 0x4e20 || v >= 0x7530) {
        *p = 0x5206;
    }
    v = *p;
    if (v >= 0x4e84) {
        *p = -v;
    }
}
