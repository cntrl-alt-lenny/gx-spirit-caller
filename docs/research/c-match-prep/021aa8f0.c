/* CAMPAIGN-PREP candidate for func_021aa8f0 (ov020, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     plain &mask/asr extract (cmp uses asr, not bitfield); store-order: loop2 split clear-then-set; loop1 single bic|orr
 *   risk:       reshape-able store-order: loop2 must emit two strh (bic;strh then re-read;orr;strh) while loop1 fuses one bic|orr|strh. Achieved by writing loop2 as `&= ~m;` then `|= v;` (two stmts) vs loop1 single insert. arg-count (6, stack args 4/5) struct-guessed.
 *   confidence: med
 */
/* func_ov020_021aa8f0: clamp/insert two 2-/4-bit tile-attr fields across `n`
 * 8-byte tile entries, then advance *pp by n*8. arg0 unused (clobbered by the
 * first call before any read). args 4/5 arrive on the stack. */
extern unsigned short func_0207ec28(void);
extern int func_0207f934(void *a, int w, int b, int c, int d, int e);

int func_ov020_021aa8f0(int unused, unsigned char **pp, int b, int c,
                        int field0, int field1) {
    int n;
    int w = func_0207ec28();
    n = func_0207f934(*pp, (unsigned short)w, b, c, 0, 0);
    if (n != 0) {
        unsigned char *t;
        int i;
        if (field0 >= 0) {
            t = *pp;
            if (field0 != ((*(unsigned short *)(t + 4) & 0xc00) >> 10) && n > 0) {
                i = 0;
                do {
                    *(unsigned short *)(t + 4) =
                        (*(unsigned short *)(t + 4) & ~0xc00) | (field0 << 10);
                    i++;
                    t += 8;
                } while (i < n);
            }
        }
        if (field1 >= 0) {
            t = *pp;
            if (field1 != ((*(unsigned short *)(t + 4) & 0xf000) >> 12) && n > 0) {
                i = 0;
                do {
                    *(unsigned short *)(t + 4) &= ~0xf000;
                    *(unsigned short *)(t + 4) |= (field1 << 12);
                    i++;
                    t += 8;
                } while (i < n);
            }
        }
        *pp += n * 8;
    }
    return n;
}
