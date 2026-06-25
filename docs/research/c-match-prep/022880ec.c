/* CAMPAIGN-PREP candidate for func_022880ec (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain: 3 predicate calls, bit0 bitfield, value-map returns
 *   risk:       middle return-1 may predicate (movne#1;popne) vs branch; helper arg arity assumed
 *   confidence: high
 */
/* func_ov002_022880ec: three sequential predicate calls; clean tail.
 *  if !pre(b0) -> 0; if mid(self,!b0,1) -> 1; else final(b0) < 0. */
typedef unsigned short u16;
struct S880ec { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern int func_ov002_02281a74(unsigned int bit0);
extern int func_ov002_02281760(struct S880ec *self, unsigned int v, int flag);
extern int func_ov002_02280980(unsigned int bit0);

int func_ov002_022880ec(struct S880ec *self) {
    if (func_ov002_02281a74(self->b0) == 0) return 0;
    if (func_ov002_02281760(self, 1 - self->b0, 1) != 0) return 1;
    return func_ov002_02280980(self->b0) < 0;
}
