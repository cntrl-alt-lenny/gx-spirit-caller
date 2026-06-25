/* CAMPAIGN-PREP candidate for func_02214c58 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + 0223de94 pair-unpack; (u16)>>8 asr byte split; 5-arg call
 *   risk:       5th stacked arg 0 ordering; (u16)ret>>8 promotion must give asr#8 (matches sibling); ret type int so the load is the function return
 *   confidence: high
 */
/* func_ov002_02214c58: guard func_0223df38(self,0,0); fetch pair via
 * func_0223de94(self,0); lo=(u8)ret, hi=((u16)ret>>8)&0xff; call
 * func_021d6808(self,lo,hi,0,0). Returns 0.
 */
typedef unsigned short u16;

extern int func_ov002_0223df38(void *self, int b, int c);
extern u16 func_ov002_0223de94(void *self, int idx);
extern int func_ov002_021d6808(void *self, int a, int b, int c, int d);

int func_ov002_02214c58(void *self) {
    int ret, lo, hi;
    if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
    ret = func_ov002_0223de94(self, 0);
    lo = ret & 0xff;
    hi = ((u16)ret >> 8) & 0xff;
    func_ov002_021d6808(self, lo, hi, 0, 0);
    return 0;
}
