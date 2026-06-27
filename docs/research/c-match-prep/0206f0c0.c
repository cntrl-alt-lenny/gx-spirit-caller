/* CAMPAIGN-PREP candidate for func_0206f0c0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     acc<<=8 at loop TOP; orr v at bottom; reload local cursor; count r5 decl after acc
 *   risk:       loop reg-alloc r4(&next)/r5(count)/r6(acc)/r7(out)/r8(cur): the `mov r6,r6,lsl#8` MUST sit before the call (first stmt) and `orr r6,r6,r0` last; cur(r8) reused for the +1 advance. Decl-order reshape-able; induction-var allocation may go permuter-class.
 *   confidence: low
 */
/* func_0206f0c0 (main, class C): parse a dotted 4-group value (e.g.
 * a.b.c.d) by repeatedly calling a number-scanner, packing each <=255
 * byte big-endian into an accumulator; require '.' separators and a NUL
 * terminator after the 4th group. */

extern int func_0206f170(void *cursor, void **out_cursor);

int func_0206f0c0(void *cursor, unsigned int *out) {
    void *cur;
    unsigned int acc = 0;
    int count = 0;
    void *next;        /* sp+0 */
    int v;

    cur = cursor;
    do {
        acc <<= 8;
        v = func_0206f170(cur, &next);
        if (cur == next) return 0;
        cur = next;
        if ((unsigned int)v > 0xff) return 0;

        if (count != 3) {
            if (*(unsigned char *)next != 0x2e) return 0;
            cur = (unsigned char *)next + 1;
        }
        if (count == 3) {
            if (*(unsigned char *)cur != 0) return 0;
        }

        count++;
        acc |= v;
    } while (count < 4);

    *out = acc;
    return 1;
}
