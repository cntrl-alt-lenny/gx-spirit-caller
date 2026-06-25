/* CAMPAIGN-PREP candidate for func_022034f0 (ov002, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     6-bit bitfield guard; two guard calls; b0 reload; shared tail return 1
 *   risk:       021bb90c arity; b0 recomputed before 2nd call (reload not CSE); shared .L_17c return-1 inline-vs-branch; shipped as .s
 *   confidence: med
 */
/* func_ov002_022034f0: two sequential guard calls 021bb90c(b0,0x1532) then
 * (b0,0x1686); kind==0x23 short-circuits straight to return 1. */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; };

extern int func_ov002_021bb90c(int a, int b, int c, int d);

int func_ov002_022034f0(struct Self *self) {
    if (self->kind != 0x23) {
        if (func_ov002_021bb90c(self->b0, 0x1532, 0, 0) == 0)
            return 0;
        if (func_ov002_021bb90c(self->b0, 0x1686, 0, 0) == 0)
            return 0;
    }
    return 1;
}
