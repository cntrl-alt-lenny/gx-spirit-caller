/* CAMPAIGN-PREP candidate for func_02025880 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: chained :1 bit extracts (bit2->bit10) with movne/bxne early-return; else +0xa4 null-guard then +0x60 bit1
 *   risk:       reshape-able: the bit2 test then conditional movne/movne/bxne is a single predicated chain — early `return` should reproduce. If mwcc materializes a branch instead of predicating the return path the prologue/epilogue shape diverges. struct-guessed: +0x16a, +0xa4 (ptr), +0x60 bit1 layout inferred from ldr offsets.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02025880 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: D: chained :1 bitfield extracts (lsl/lsr) with conditional early-returns (movne/bxne, moveq/bxeq); u16 at +0x16a.
 */
typedef struct {
    char _a[0x100 + 0x6a];
    unsigned short h_16a;          /* +0x16a (r0+0x100, [+0x6a]) */
} S25880;

int func_02025880(int obj) {
    S25880 *p = (S25880 *)obj;
    unsigned short f = p->h_16a;                   /* ldrh [r0+0x100, #0x6a] */

    if ((f >> 2) & 1)                              /* lsl29/lsr31 = bit2 */
        return (f >> 10) & 1;                      /* movne lsl21/lsr31 = bit10 */

    {
        int q = *((int *)((char *)obj + 0xa4));    /* ldr [r0,#0xa4] */
        if (q == 0)
            return 0;                              /* moveq r0,#0 */
        return (*((int *)((char *)q + 0x60)) >> 1) & 1;  /* ldr [+0x60]; lsl30/lsr31 = bit1 */
    }
}
