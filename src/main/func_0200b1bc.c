/* CAMPAIGN-PREP candidate for func_0200b1bc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     setup call + COMMUTATIVE add (accumulator-operand-first) counted loop
 *   risk:       stride-8 element modeled as {int;int}; count*8 must lower to lsl#3; unsigned bcc/bls guard
 *   confidence: med
 */
/* func_0200b1bc — setup call then counted add-loop over stride-8 elements (low word).
   add r0,r5,r0 => addend-first (commutative): write 'addend + e->v'. */

extern void func_02094550(int a, void *base, int nbytes);

struct E8 { int v; int hi; };   /* 8-byte stride */

int func_0200b1bc(struct E8 *base, int a1, int addend, unsigned count)
{
    unsigned i;
    func_02094550(a1, base, count * 8);
    for (i = 0; i < count; i++) {
        int v = addend;
        v += base[i].v;
        base[i].v = v;
    }
    return 1;
}
