/* CAMPAIGN-PREP candidate for func_02207ad8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     i<2 loop, guard-call continue-chain, halfword arg, return-1
 *   risk:       021ca2b8 declared 1-arg (orig sets only r0); loop body branch layout may reorder the continue targets
 *   confidence: med
 */
/* func_ov002_02207ad8: counted loop i<2 of guard calls.
 *   for i in {0,1}:
 *     if (func_021ff2b8(self,i)==0) continue;
 *     if (func_021ca2b8(i)==0)      continue;
 *     if (func_022536e8(i, self->f0, 0)!=0) return 1;
 *   return 0;
 */
typedef unsigned short u16;
extern int func_ov002_021ff2b8(void *self, int key);
extern int func_ov002_021ca2b8(int i);
extern int func_ov002_022536e8(int i, int hw, int c);

int func_ov002_02207ad8(void *self) {
    int i;
    for (i = 0; i < 2; i++) {
        if (func_ov002_021ff2b8(self, i) == 0) continue;
        if (func_ov002_021ca2b8(i) == 0) continue;
        if (func_ov002_022536e8(i, *(u16 *)self, 0) != 0) return 1;
    }
    return 0;
}
