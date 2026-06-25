/* CAMPAIGN-PREP candidate for func_022961a0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0 + raw-u16@+2 shared load, tail thunk
 *   risk:       Needs mwcc to CSE the two +2 loads into one ldrh feeding bit0 and raw; may emit an extra ldrh
 *   confidence: med
 */
/* func_ov002_022961a0: tail thunk 021ba6cc(self->bit0, self->f0,
 * raw_u16@+2). Loads +2 first (bit0 + raw), then +0 (f0). bit0 must be a
 * 1-bit bitfield to get lsl#31;lsr#31; the raw u16 is the same halfword. */
typedef unsigned short u16;

struct S022961a0 {
    u16 f0;
    u16 bit0 : 1;
};

extern int func_ov002_021ba6cc(int bit0, int f0, int raw2);

int func_ov002_022961a0(struct S022961a0 *self) {
    return func_ov002_021ba6cc(self->bit0, self->f0,
                               *(u16 *)((char *)self + 2));
}
