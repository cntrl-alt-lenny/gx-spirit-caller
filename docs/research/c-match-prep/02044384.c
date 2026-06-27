/* CAMPAIGN-PREP candidate for func_02044384 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind invariants base+0x400/+0x500 (held r4/r6); p,h advance +0x100; do-while inner; strh
 *   risk:       permuter-class: 6 live loop values (p,h,r4,r6,0x100,0xfe) — asm pins each in a callee-saved reg; mwcc may rotate the reg assignment or drop the 0x100/0xfe holds, perturbing the loop body.
 *   confidence: med
 */
extern int data_0219da78;
extern int func_02043b70();
extern int func_02043bdc(void *a, int b, int c, void *d);
extern int func_02043c28(int a, int b, void *c);
extern unsigned short func_020a6720(void *a, void *b, int c);

int func_02044384(unsigned char *base)
{
    unsigned char *p = base;
    int h = data_0219da78;
    void *r4 = base + 0x400;
    void *r6 = base + 0x500;
    int i;

    for (i = 0; i < 4; i++) {
        *(unsigned short *)(p + 0xfe) = func_020a6720(r6, p, 0xfe);
        do {
            func_02043c28(h, 0x100, p);
        } while (func_02043bdc(p, h, 0x100, r4) == 0);
        p += 0x100;
        h += 0x100;
    }
    return func_02043b70() != 0;
}
