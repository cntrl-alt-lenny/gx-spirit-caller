/* CAMPAIGN-PREP candidate for func_0229cde8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: divmod constant 10 (magic 0x66666667) as %/; backward buf fill; store-order
 *   risk:       the double-smull (one for %10 mul-back, one for new /10) needs both n%10 and n/10 of same n; risk is &buf[i] vs add r1,sp,r2 ptr form. reshape-able
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229cde8 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: itoa via signed /10 + %10 (magic
 * 0x66666667); fill 16-byte stack buf backward from null term; tail call. */
extern void func_ov002_0229cdb8(int dest, char *s);

void func_ov002_0229cde8(int dest, int value) {
    char buf[16];
    int i = 16;
    int n = value;
    buf[--i] = 0;            /* buf[15] = '\0' */
    do {
        int d = n % 10;
        buf[--i] = (char)(d + 0x30);
        n = n / 10;
    } while (n != 0);
    func_ov002_0229cdb8(dest, &buf[i]);
}
