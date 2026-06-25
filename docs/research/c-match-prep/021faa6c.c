/* CAMPAIGN-PREP candidate for func_021faa6c (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bit0:1 bitfield + f0 (reloaded), two calls (const 0xb), setter store
 *   risk:       f2/f0 reloaded before each call; r2=f0 vs reg-alloc; str result at +0x14; second call 4th arg 0
 *   confidence: med
 */
/* func_ov002_021faa6c: pass (bit0, 0xb, f0[, 0]) to two sinks; store the
 * first's result to self->f_14. Returns 1.
 *   self->f_14 = func_021b4120(self->f2.bit0, 0xb, self->f0);
 *   func_021d5b80(self->f2.bit0, 0xb, self->f0, 0);
 * self->f0 and self->f2.bit0 are READ TWICE (orig reloads both ldrh).
 */
typedef unsigned short u16;

struct Ov002Self021faa6c {
    u16 f0;
    u16 bit0 : 1;
    u16 pad[8];
    int f_14;    /* +0x14 */
};

extern int func_ov002_021b4120(int bit0, int kind, int f0);
extern int func_ov002_021d5b80(int bit0, int kind, int f0, int zero);

int func_ov002_021faa6c(struct Ov002Self021faa6c *self) {
    self->f_14 = func_ov002_021b4120(self->bit0, 0xb, self->f0);
    func_ov002_021d5b80(self->bit0, 0xb, self->f0, 0);
    return 1;
}
