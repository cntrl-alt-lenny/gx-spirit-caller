/* CAMPAIGN-PREP candidate for func_02288158 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain clone of 022880ec with flag=0
 *   risk:       middle return-1 may predicate vs branch; helper arg arity assumed
 *   confidence: high
 */
/* func_ov002_02288158: clone of 022880ec with mid-flag arg = 0. */
typedef unsigned short u16;
struct S88158 { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern int func_ov002_02281a74(unsigned int bit0);
extern int func_ov002_02281760(struct S88158 *self, unsigned int v, int flag);
extern int func_ov002_02280980(unsigned int bit0);

int func_ov002_02288158(struct S88158 *self) {
    if (func_ov002_02281a74(self->b0) == 0) return 0;
    if (func_ov002_02281760(self, 1 - self->b0, 0) != 0) return 1;
    return func_ov002_02280980(self->b0) < 0;
}
