/* CAMPAIGN-PREP candidate for func_02223fe4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     fc switch + break->shared return0; 1-bit0 bitfield (matched-sibling 02227d58)
 *   risk:       low; case temp reg (r1 vs r2) could shift if no pass-through, but no live arg here
 *   confidence: high
 */
/* func_ov002_02223fe4: dispatch on fc@0xc; case1 -> 0226af38(1-bit0,1,1),
 * case2 -> 021e13f4(1-bit0,2,1); return 0. (sibling of 02227d58) */
typedef unsigned short u16;

struct F02223fe4_Self {
    u16 f0; u16 bit0 : 1; u16 rest : 15;
    u16 _4; u16 _6; u16 _8; u16 _a; u16 fc;
};

extern void func_ov002_0226af38(int x, int a, int b);
extern void func_ov002_021e13f4(int x, int a, int b);

int func_ov002_02223fe4(struct F02223fe4_Self *self) {
    switch (self->fc) {
    case 1:
        func_ov002_0226af38(1 - self->bit0, 1, 1);
        break;
    case 2:
        func_ov002_021e13f4(1 - self->bit0, 2, 1);
        break;
    }
    return 0;
}
