/* CAMPAIGN-PREP candidate for func_021ca128 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: pair[1] then pair[0]; 12-arg call; a0[0]<<9, a4+8 stack args
 *   risk:       permuter-class: 8 outgoing stack stores are hand-ordered (0x24,0x20 first); mwcc reschedules the str sequence for a 12-arg call though values match. a0/a4 offsets struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov004_021ca128 (ov004, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note (reshape or .s fallback).
 *   recipe:     store-order stack-arg marshalling; 12-arg call; emit fields in asm order; a2/a3<<12, a0[0]<<9
 *   risk:       permuter-class: 8 outgoing stack stores are hand-ordered ([sp+0x24],[sp+0x20] first, then 0x00..0x1c); mwcc's arg-store scheduling for a 12-arg call will reorder the str sequence even though values match. (struct-guessed: a0[]/a4 offsets inferred)
 *   confidence: low
 */
/* func_ov004_021ca128 (ov004, class D): marshal a 12-arg call to func_0201eaa0.
 * reg args: (a1, *(int*)(a0 + a5*4 + 0x10), &pair{a2<<12, a3<<12}, 0).
 * stack args 5..12: 0, 0, a4+8, a4, a0[1], a0[0]<<9, 0, 0. */
extern void func_0201eaa0(int r0, int r1, int *r2, int r3,
                          int s4, int s5, int s6, int s7,
                          int s8, int s9, int s10, int s11);

void func_ov004_021ca128(int *a0, int a1, int a2, int a3, int a4, int a5) {
    int pair[2];
    pair[1] = a3 << 12;
    pair[0] = a2 << 12;
    func_0201eaa0(a1,
                  *(int *)((char *)a0 + a5 * 4 + 0x10),
                  pair,
                  0,
                  0,
                  0,
                  a4 + 8,
                  a4,
                  a0[1],
                  a0[0] << 9,
                  0,
                  0);
}
