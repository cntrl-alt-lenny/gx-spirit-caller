/* CAMPAIGN-PREP candidate for func_022883c4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + two same-call compares, bit0 bitfield, a>b
 *   risk:       r5/r0 temp reg-alloc may flip; spill set {r3,r4,r5} assumed from arg liveness
 *   confidence: high
 */
/* func_ov002_022883c4: if pre(b0) then return helper(self,!b0) >
 * helper(self,b0); else 0. */
typedef unsigned short u16;
struct S883c4 { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern int func_ov002_02281a74(unsigned int bit0);
extern int func_ov002_02257ab8(struct S883c4 *self, unsigned int bit);

int func_ov002_022883c4(struct S883c4 *self) {
    int a;
    if (func_ov002_02281a74(self->b0) == 0) return 0;
    a = func_ov002_02257ab8(self, 1 - self->b0);
    return a > func_ov002_02257ab8(self, self->b0);
}
