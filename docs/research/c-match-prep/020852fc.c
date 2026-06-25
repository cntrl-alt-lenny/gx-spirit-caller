/* CAMPAIGN-PREP candidate for func_020852fc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     address-taken 0x40 buffer forces sub sp,#0x40; volatile MMIO store order
 *   risk:       struct-guessed: buf size 0x40 drives the prologue sub sp,#0x40 - if the real local is larger/smaller (extra spill) the frame constant diverges. MMIO writes need volatile to keep order.
 *   confidence: med
 */
/* func_020852fc: teardown. r6=a(param1) r5=b(param2). func_02084fe0();
 * zero MMIO 0x4000440/444/454 (in that order). If a: drain
 * while(func_0208e664(&buf)) using a 0x40-byte stack buffer, then
 * func_0208b94c(&buf, a). If b: drain while(func_0208e61c(b)). Finally
 * 0x4000448=1; 0x4000440=2. */

extern void func_02084fe0(void);
extern int  func_0208b94c(void *buf, void *a);
extern int  func_0208e61c(void *b);
extern int  func_0208e664(void *buf);

void func_020852fc(void *a, void *b)
{
    unsigned char buf[0x40];

    func_02084fe0();
    *(volatile int *)0x04000440 = 0;
    *(volatile int *)0x04000444 = 0;
    *(volatile int *)0x04000454 = 0;

    if (a != 0) {
        while (func_0208e664(buf) != 0)
            ;
        func_0208b94c(buf, a);
    }
    if (b != 0) {
        while (func_0208e61c(b) != 0)
            ;
    }
    *(volatile int *)0x04000448 = 1;
    *(volatile int *)0x04000440 = 2;
}
