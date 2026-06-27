/* CAMPAIGN-PREP candidate for func_0209cd3c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C/D bind-base: keep computed v in one reg through bic/orr/and; -0x2000 via and ~0x2000
 *   risk:       orig builds the mask as mov r0,#0x2000;rsb r0,#0 then and -- mwcc may emit a single bic #0x2000 or mvn, changing the and->bic instruction. reshape-able (write ~0x2000 mask) but immediate-encoding is permuter-class.
 *   confidence: low
 */
/* func_0209cd3c: program a DMA/GX control reg, poll busy bit 0x800000, read result reg. */

extern char *data_021026d8;
extern void func_0209d150(int a, int b);

int func_0209cd3c(void) {
    volatile unsigned long *reg;
    unsigned long v;
    func_0209d150((int)0xB8000000, 0);
    reg = (volatile unsigned long *)0x040001a4;
    v = *(volatile unsigned long *)(*(int *)data_021026d8 + 0x60);
    v = (v & ~0x7000000) | 0xA7000000;
    v = v & ~0x2000;
    *reg = v;
    while (*reg & 0x800000) {
        ;
    }
    return *(volatile int *)0x04100010;
}
