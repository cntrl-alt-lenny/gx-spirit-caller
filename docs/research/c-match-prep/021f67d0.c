/* CAMPAIGN-PREP candidate for func_021f67d0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bit0:1 bitfield (reloaded), guard cmp>=2, conditional setter store
 *   risk:       bit0 reloaded vs bound; the >=2 branch (blt) inline-vs-branch; strh of 1 at +0xc field offset guessed
 *   confidence: med
 */
/* func_ov002_021f67d0: gate on func_021ff2c8(self, bit0) >= 2; if so notify
 * via func_0226af78(bit0, 2) and set self->f_c = 1. Always returns 1.
 * self->f2.bit0 is READ TWICE (orig reloads ldrh both times -> two refs).
 */
typedef unsigned short u16;

struct Ov002Self021f67d0 {
    u16 f0;
    u16 bit0 : 1;
    u16 pad[4];
    u16 f_c;     /* +0xc */
};

extern int func_ov002_021ff2c8(struct Ov002Self021f67d0 *self, int bit0);
extern int func_ov002_0226af78(int bit0, int two);

int func_ov002_021f67d0(struct Ov002Self021f67d0 *self) {
    if (func_ov002_021ff2c8(self, self->bit0) >= 2) {
        func_ov002_0226af78(self->bit0, 2);
        self->f_c = 1;
    }
    return 1;
}
