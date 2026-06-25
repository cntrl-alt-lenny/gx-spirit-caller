/* CAMPAIGN-PREP candidate for func_021b025c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD early-return &&-chain over repeated call; final movne/moveq bool
 *   risk:       Note args swapped vs asm (asm sets r1=id, r0=self via mov r0,r4) — signature order assumed self,id. r1 first call uses LIT before mov r0.
 *   confidence: high
 */
/* func_ov002_021b025c: returns 1 iff g(self,0xfb7..0xfbb) are ALL non-zero,
 * else 0 (short-circuit early-return chain). self preserved in r4.
 *
 *     bl g(self,0xfb7); cmp r0,#0; moveq r0,#0; ldmeqia ...  (x4)
 *     bl g(self,0xfbb); cmp r0,#0; movne r0,#1; moveq r0,#0
 */

extern int func_ov002_021c3ae4(int self, int id);

int func_ov002_021b025c(int self) {
    if (func_ov002_021c3ae4(self, 0xfb7) == 0) return 0;
    if (func_ov002_021c3ae4(self, 0xfb8) == 0) return 0;
    if (func_ov002_021c3ae4(self, 0xfb9) == 0) return 0;
    if (func_ov002_021c3ae4(self, 0xfba) == 0) return 0;
    return func_ov002_021c3ae4(self, 0xfbb) != 0;
}
