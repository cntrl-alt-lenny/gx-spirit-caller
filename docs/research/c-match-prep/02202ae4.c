/* CAMPAIGN-PREP candidate for func_02202ae4 (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit + 1-bit bitfields; guard chain; global==bitfield compare
 *   risk:       same inline-vs-branch wall as 022016bc: moveq#1/movne#0 after cmp may flip; shipped as .s
 *   confidence: low
 */
/* func_ov002_02202ae4: identical body to 022016bc — kind==0x12, +0x14 !=0,
 * then global word == self bit0. */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; char _p[0x14 - 4]; int f14; };

extern int data_ov002_022cd3f4;

int func_ov002_02202ae4(struct Self *self) {
    if (self->kind != 0x12) return 0;
    if (self->f14 == 0) return 0;
    return data_ov002_022cd3f4 == self->b0;
}
