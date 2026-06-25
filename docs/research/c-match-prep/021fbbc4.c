/* CAMPAIGN-PREP candidate for func_021fbbc4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bit0:1 + f1:5 bitfield (reloaded twice), two calls, setter store
 *   risk:       f2 reloaded for each call (two ldrh); reg-alloc of bit0/f1 temps; strh result at +0x8
 *   confidence: med
 */
/* func_ov002_021fbbc4: derive (bit0, f1) from self->f2, call two sinks,
 * store the second's result to self->f_8. Returns 1. (Sibling of 021f9910
 * with a different second callee.)
 *   func_021deb28(self->f2.bit0, self->f2.f1);
 *   self->f_8 = func_021b9e48(self->f2.bit0, self->f2.f1);
 * self->f2 is READ TWICE (orig reloads ldrh before each call).
 */
typedef unsigned short u16;

struct Ov002Self021fbbc4 {
    u16 f0;
    u16 bit0 : 1;
    u16 f1   : 5;
    u16 pad;
    u16 f_8;    /* +0x8 */
};

extern int func_ov002_021deb28(int bit0, int f1);
extern int func_ov002_021b9e48(int bit0, int f1);

int func_ov002_021fbbc4(struct Ov002Self021fbbc4 *self) {
    func_ov002_021deb28(self->bit0, self->f1);
    self->f_8 = func_ov002_021b9e48(self->bit0, self->f1);
    return 1;
}
