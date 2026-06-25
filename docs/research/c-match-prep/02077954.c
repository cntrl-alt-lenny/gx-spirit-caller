/* CAMPAIGN-PREP candidate for func_02077954 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed char (ldrsb); pre-incr strlen as do-while; n-- before bound test (cmp;sub;beq rotation); keep ','/' ' store order
 *   risk:       asm holds `start` in lr (saves only {lr}); if mwcc allocates a callee-saved reg for start the prologue becomes {r4,lr} and diverges. permuter-class-ish; secondary: the `cmp;sub;beq` decrement-first loop rotation is reshape-sensitive.
 *   confidence: med
 */
/* func_02077954: append ', ' then bounded copy into a <=0xFF buffer.
 * dst=r0, src=r1, n=r2. start kept in lr (only {lr} pushed, lr freed).
 * If dst not empty: strlen via pre-incr (ldrsb[r0,#1]!), if len>=0xff return,
 * else write ',' ' ' and dst+=2. Copy loop: cmp n; n--; if n==0 stop; if
 * dst-start<0xff copy *src++ to *dst++. Finally *dst=0. Store order kept. */
void func_02077954(signed char *dst, signed char *src, int n) {
    signed char *start = dst;
    if (*dst != 0) {
        do {
            dst++;
        } while (*dst != 0);
        if (dst - start >= 0xff)
            return;
        *dst = 0x2c;
        dst[1] = 0x20;
        dst += 2;
    }
    while (n != 0) {
        n--;
        if (dst - start >= 0xff)
            break;
        *dst++ = *src++;
    }
    *dst = 0;
}
