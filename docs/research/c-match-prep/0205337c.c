/* CAMPAIGN-PREP candidate for func_0205337c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order MSB..LSB bytes = varargs order to printf-helper
 *   risk:       reshape-able: vararg evaluation/store order to sp[0..0x10]. If mwcc reorders the four byte-stores or coalesces, swap arg order. Stack-buf offsets (buf14@0x14, buf29@0x29) frame-guessed.
 *   confidence: med
 */
/* func_0205337c (main, class D) — format a record into r5 via func_0209150c
 * (printf-family). Two base-N conversions via func_0205340c, then arg1's four
 * bytes are pushed big-endian as the trailing varargs.
 * STORE-ORDER recipe: the byte extracts must hit sp[0],[4],[8],[0xc] in MSB..LSB
 * order, which is exactly varargs order to func_0209150c.
 */

extern char data_020ffa9c[];                       /* format string */
extern void func_0205340c(unsigned long long v, int width, char *buf);
extern long long func_02053728(void *self);
extern int  func_02053720(void *self);
extern int  func_0209150c(void *dst, int n, const char *fmt, ...);

int func_0205337c(void *self, unsigned int arg1, void *dst) {
    char buf14[0x15];   /* sp+0x14 : base-N of func_02053728() */
    char buf29[0x17];   /* sp+0x29 : base-N of func_02053720() */

    func_0205340c((unsigned long long)func_02053728(self), 0x2b, buf14);
    func_0205340c((unsigned)func_02053720(self), 0x20, buf29);

    return func_0209150c(dst, 0x15, data_020ffa9c, buf14,
                         (arg1 >> 24) & 0xff,
                         (arg1 >> 16) & 0xff,
                         (arg1 >>  8) & 0xff,
                         arg1 & 0xff,
                         buf29);
}
