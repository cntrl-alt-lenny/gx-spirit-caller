/* CAMPAIGN-PREP candidate for func_022032f0 (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit bitfield guard (beq); 1-bit arg; single guard call + tail const
 *   risk:       021bb90c arity 4 but caller sets only r0,r1; the .L_434 shared 'return 1' may inline vs branch; shipped as .s
 *   confidence: med
 */
/* func_ov002_022032f0: kind(6-bit)==0x23 -> 1; else guard call 021bb90c(b0, 0xfc9). */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; };

extern int func_ov002_021bb90c(int a, int b, int c, int d);

int func_ov002_022032f0(struct Self *self) {
    if (self->kind == 0x23)
        return 1;
    if (func_ov002_021bb90c(self->b0, 0xfc9, 0, 0) == 0)
        return 0;
    return 1;
}
