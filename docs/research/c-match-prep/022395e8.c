/* CAMPAIGN-PREP candidate for func_022395e8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail + bitfield byte-extract; final call takes (a,b,1,0x1a90)
 *   risk:       0x1a90 via literal pool (_LIT0); scheduling of a/b shifts as in 0223163c. self(r6) held but unused by final call.
 *   confidence: high
 */
/* func_ov002_022395e8: validate-then-fire leaf (clone of 0223163c shape);
 * final call is 021d94ac(a, b, 1, 0x1a90) -- args a,b first, NOT self.
 */
typedef unsigned short u16;

extern int func_ov002_0223df38(void *self, int b, int c);
extern int func_ov002_0223de94(void *self, int n);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021d94ac(int a, int b, int c, int d);

int func_ov002_022395e8(void *self) {
    int v, a, b;
    if (func_ov002_0223df38(self, 0, 0) == 0) return 0;
    v = func_ov002_0223de94(self, 0);
    a = v & 0xff;
    b = ((u16)v >> 8) & 0xff;
    if (func_ov002_0225764c(self, a, b) == 0) return 0;
    func_ov002_021d94ac(a, b, 1, 0x1a90);
    return 0;
}
