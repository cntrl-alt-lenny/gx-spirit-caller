/* CAMPAIGN-PREP candidate for func_0223163c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail + bitfield byte-extract (lsl16;lsr16;asr8) + callee-saved temps
 *   risk:       scheduling: orig interleaves `and r4` (a) between the two shifts of b; mwcc may emit a/b in source order.
 *   confidence: high
 */
/* func_ov002_0223163c: validate-then-fire leaf (clone of 022302b8/3348 shape).
 *   bl 0223df38(self,0,0); if 0 -> return 0
 *   v = 0223de94(self,0); a = v & 0xff; b = ((u16)v >> 8) & 0xff;
 *   if 0225764c(self,a,b)==0 -> return 0; else 021de9d4(self,a,b); return 0
 * a,b are callee-saved locals (r4/r5) reused across the two calls.
 */
typedef unsigned short u16;

extern int func_ov002_0223df38(void *self, int b, int c);
extern int func_ov002_0223de94(void *self, int n);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021de9d4(void *self, int a, int b);

int func_ov002_0223163c(void *self) {
    int v, a, b;
    if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
    v = func_ov002_0223de94(self, 0);
    a = v & 0xff;
    b = ((u16)v >> 8) & 0xff;
    if (func_ov002_0225764c(self, a, b) == 0) return 0;
    func_ov002_021de9d4(self, a, b);
    return 0;
}
