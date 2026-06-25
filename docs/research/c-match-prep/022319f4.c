/* CAMPAIGN-PREP candidate for func_022319f4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield :6/:9/:1 extracts + early-tail-call; operand order from asm
 *   risk:       tail arm: orig `bl 022287c4; ldmia..pc` returns callee r0; my `return 0` after the call may add `mov r0,#0`. If so, make 022287c4 return int and `return func(self)`.
 *   confidence: med
 */
/* func_ov002_022319f4: bitfield extract then one of two calls.
 *   k = self->field6 (bits[6:11] of h@+2); if k==2 -> tail 022287c4(self)
 *   else 021e276c(self->bit0, self->f0, 17, self->f4hi9)
 * f4hi9 = bits[6:14] of h@+4 (lsl#0x11; lsr#0x17).
 */
typedef unsigned short u16;
struct S {
    u16 f0;                                  /* +0 */
    u16 bit0:1; u16 _b1_5:5; u16 field6:6; u16 _b12_15:4;  /* +2 */
    u16 _c0_5:6; u16 hi9:9; u16 _c15:1;       /* +4 */
};

extern void func_ov002_022287c4(void *self);
extern void func_ov002_021e276c(int a, int b, int c, int d);

int func_ov002_022319f4(struct S *self) {
    if (self->field6 == 2) {
        func_ov002_022287c4(self);
        return 0; /* tail: falls through to shared epilogue with callee's r0 */
    }
    func_ov002_021e276c(self->bit0, self->f0, 17, self->hi9);
    return 0;
}
