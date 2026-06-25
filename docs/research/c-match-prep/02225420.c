/* CAMPAIGN-PREP candidate for func_02225420 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit field guard; signed-test guard(<0); 1-bit0; :9 word bitfield (sibling 02211b38/02224dd0)
 *   risk:       f2 read twice via two views may not CSE like orig single ldrh; field offsets inferred
 *   confidence: med
 */
/* func_ov002_02225420: guard f2.kind(bits6..11)==0x16; then
 * r=021b99b4(1-f2.b0, f14.field9); if(r<0) return; 021d7268(1-f2.b0,
 * f14.field9, 1); return 0. (f14 = 32-bit word at +0x14, low 9 bits) */
typedef unsigned short u16;

struct F02225420_F2 { u16 pad6 : 6; u16 kind : 6; u16 rest : 4; };
struct F02225420_F2b { u16 b0 : 1; u16 rest : 15; };
struct F02225420_F14 { unsigned int field9 : 9; unsigned int rest : 23; };
struct F02225420_Self {
    u16 f0;
    struct F02225420_F2 f2;
    u16 _4; u16 _6; u16 _8; u16 _a; u16 _c; u16 _e; u16 _10; u16 _12;
    struct F02225420_F14 f14;
};

extern int func_ov002_021b99b4(unsigned int notbit, unsigned int field9);
extern int func_ov002_021d7268(unsigned int notbit, unsigned int field9, unsigned int one);

int func_ov002_02225420(struct F02225420_Self *self) {
    struct F02225420_F2b *b = (struct F02225420_F2b *)&self->f2;
    if (self->f2.kind != 0x16) return 0;
    if (func_ov002_021b99b4(1 - b->b0, self->f14.field9) < 0) return 0;
    func_ov002_021d7268(1 - b->b0, self->f14.field9, 1);
    return 0;
}
