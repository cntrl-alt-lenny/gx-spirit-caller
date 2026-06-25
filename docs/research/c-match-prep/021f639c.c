/* CAMPAIGN-PREP candidate for func_021f639c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bit0:1 + f1:5 bitfield unpack, 5-arg call (stack), tail call
 *   risk:       5th stacked arg 0 and r3=#4 ordering; reg-alloc of bit0/f1 temps; second call args order
 *   confidence: med
 */
/* func_ov002_021f639c: unpack self->f2 (bit0, f1) and self->f0, feed a
 * 5-arg sink, then tail-call a 2-arg handler.
 *   func_021d59cc(self->f2.bit0, self->f2.f1, self->f0, 4, 0);
 *   return func_021f49d0(self, arg);
 * The 5th arg (0) is passed on the stack (str rZero,[sp,#0]); r3=#4.
 */
typedef unsigned short u16;

struct Ov002Self021f639c {
    u16 f0;
    u16 bit0 : 1;
    u16 f1   : 5;
};

extern int func_ov002_021d59cc(int bit0, int f1, int f0, int four, int zero);
extern int func_ov002_021f49d0(struct Ov002Self021f639c *self, int arg);

int func_ov002_021f639c(struct Ov002Self021f639c *self, int arg) {
    func_ov002_021d59cc(self->bit0, self->f1, self->f0, 4, 0);
    return func_ov002_021f49d0(self, arg);
}
