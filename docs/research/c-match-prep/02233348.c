/* CAMPAIGN-PREP candidate for func_02233348 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail + bitfield byte-extract + callee-saved temps (0223163c clone)
 *   risk:       scheduling: orig interleaves `and r4` (a) between b's two shifts; mwcc may emit in source order.
 *   confidence: high
 */
/* func_ov002_02233348: validate-then-fire leaf (clone of 0223163c shape;
 * only the final call differs: 021dea04 instead of 021de9d4).
 */
typedef unsigned short u16;

extern int func_ov002_0223df38(void *self, int b, int c);
extern int func_ov002_0223de94(void *self, int n);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021dea04(void *self, int a, int b);

int func_ov002_02233348(void *self) {
    int v, a, b;
    if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
    v = func_ov002_0223de94(self, 0);
    a = v & 0xff;
    b = ((u16)v >> 8) & 0xff;
    if (func_ov002_0225764c(self, a, b) == 0) return 0;
    func_ov002_021dea04(self, a, b);
    return 0;
}
