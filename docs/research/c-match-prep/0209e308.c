/* CAMPAIGN-PREP candidate for func_0209e308 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D divmod: 0x66666667 magic => % 10; u16 truncation each step
 *   risk:       reshape-able/struct-guessed: 0x027ffc3c is an absolute addr loaded as a pointer to a global, not an immediate; if the campaign has its real symbol, substitute it. The `% 10` must stay on the post-*13 u16 value.
 *   confidence: med
 */
/* func_0209e308: sum 6 bytes of a filled buffer (u16 acc), add a global,
 * times 13, then ((v % 10) + 30) as u16. class D divmod: 0x66666667/asr#2
 * is the signed /10 magic -> plain % 10 (operand is a u16 so non-negative).
 * Every intermediate is truncated to u16 (lsl#16/lsr#16 pairs).
 */

extern void func_02093a20(void *buf);
extern int  data_027ffc3c;           /* note: literal 0x027ffc3c loaded as &global */

unsigned short func_0209e308(void) {
    unsigned char buf[12];
    int i;
    unsigned int acc = 0;
    func_02093a20(&buf[0]);
    for (i = 0; i < 6; i++) {
        acc = (unsigned short)(acc + buf[i]);
    }
    acc = (unsigned short)(acc + data_027ffc3c);
    acc = (unsigned short)(acc * 13);
    return (unsigned short)((acc % 10) + 0x1e);
}
