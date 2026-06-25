/* CAMPAIGN-PREP candidate for func_021b02f0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD early-return chain: first !=0 then signed >=0 tests; final ge/lt bool
 *   risk:       Arg order self,id assumed (asm r0=self via r4, r1=id, r2=-1). Mixed !=0 vs <0 tests; final movge/movlt boolean should match.
 *   confidence: high
 */
/* func_ov002_021b02f0: first call gates on != 0 (h(self,id,-1)); the remaining
 * four gate on >= 0 (g(self,id) signed). Returns 1 iff all pass, else 0.
 *
 *     mvn r2,#0; bl h(self,0x1468); cmp r0,#0; moveq r0,#0; ldmeqia ...
 *     bl g(self,0x1497); cmp r0,#0; movlt r0,#0; ldmltia ...   (x3)
 *     bl g(self,0x149a); cmp r0,#0; movge r0,#1; movlt r0,#0
 */

extern int func_ov002_021bae7c(int self, int id, int c);
extern int func_ov002_021bac38(int self, int id);

int func_ov002_021b02f0(int self) {
    if (func_ov002_021bae7c(self, 0x1468, -1) == 0) return 0;
    if (func_ov002_021bac38(self, 0x1497) < 0) return 0;
    if (func_ov002_021bac38(self, 0x1498) < 0) return 0;
    if (func_ov002_021bac38(self, 0x1499) < 0) return 0;
    return func_ov002_021bac38(self, 0x149a) >= 0;
}
