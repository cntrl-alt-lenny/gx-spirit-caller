/* CAMPAIGN-PREP candidate for func_022875c4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two bit0 calls; accumulator-first add; n<=2 guard; tail call
 *   risk:       none material — VERIFIED byte-exact. acc-first (n=n+x) gives add r0,r5,r0; b0 reloaded 3x; first arg 1-b0 via rsb.
 *   confidence: high
 */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern int func_ov002_021bbf50(int x);
extern int func_ov002_0227da98(int x);

int func_ov002_022875c4(struct Self *self) {
    int n = func_ov002_021bbf50(1 - self->b0);
    n = n + func_ov002_021bbf50(self->b0);
    if (n <= 2) return 0;
    return func_ov002_0227da98(self->b0);
}
