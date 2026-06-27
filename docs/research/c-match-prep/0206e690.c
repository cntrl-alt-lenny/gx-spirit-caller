/* CAMPAIGN-PREP candidate for func_0206e690 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned d<0x10 guard (cc); stack-frame tmp-then-buf; BE bytes as 7 args
 *   risk:       stack-arg marshalling order: args 5-7 must store byte[2]->[sp], byte[1]->[sp+4], byte[0]->[sp+8] in THAT order; mwcc's stack-store scheduling and the buf/tmp frame slot order (0x10/0xc) are reshape-able via decl-order but scheduling may still drift.
 *   confidence: med
 */
/* func_0206e690 (main, class C): validate (a==2, d>=0x10), copy a 4-byte
 * field out, re-serialize it big-endian into a 4-byte buffer, then call
 * func_0209150c with the 4 bytes spread across reg+stack args. */

extern int  func_02094688(void *src, void *dst, int n);
extern void func_0206e670(unsigned int v, unsigned char *dst);
extern void func_0209150c(int c, int sz, void *tag,
                          int b3, int b2, int b1, int b0);
extern char data_02101e94[];

int func_0206e690(int a, void *b, int c, unsigned int d) {
    unsigned int tmp;        /* sp+0xc */
    unsigned char buf[4];    /* sp+0x10 */

    if (a != 2) return 0;
    if (d < 0x10) return 0;

    func_02094688(b, &tmp, 4);
    func_0206e670(tmp, buf);
    func_0209150c(c, 0x10, data_02101e94,
                  buf[3], buf[2], buf[1], buf[0]);
    return c;
}
