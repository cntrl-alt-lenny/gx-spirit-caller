/* CAMPAIGN-PREP candidate for func_0228824c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain; mid returns 0 on nonzero; tail cmp<2
 *   risk:       mid return-0 may predicate (movne#0;popne) vs branch; final cmp r0,#2 inlined
 *   confidence: high
 */
/* func_ov002_0228824c: clean guard chain, three calls.
 *  if !pre(b0) -> 0; if mid(self,!b0,0) -> 0; else q(!b0) < 2. */
typedef unsigned short u16;
struct S8824c { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern int func_ov002_02281a74(unsigned int bit0);
extern int func_ov002_02281760(struct S8824c *self, unsigned int v, int flag);
extern int func_ov002_021bbf50(unsigned int v);

int func_ov002_0228824c(struct S8824c *self) {
    if (func_ov002_02281a74(self->b0) == 0) return 0;
    if (func_ov002_02281760(self, 1 - self->b0, 0) != 0) return 0;
    return func_ov002_021bbf50(1 - self->b0) < 2;
}
