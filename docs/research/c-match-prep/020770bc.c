/* CAMPAIGN-PREP candidate for func_020770bc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag-to-mask via if-assign (movne/moveq); sequential ==3/==4/else cmp-chain; -1 check as mvn+cmp
 *   risk:       reshape-able: mask held in callee-saved r4 across all arms (orreq r0,r4,#K). if mwcc rematerialises 0x8000 per return instead of holding r4, every orr diverges. offsets struct-guessed.
 *   confidence: med
 */
/* func_020770bc: step routine returning a status bitmask. mask = flag?0:0x8000
 * (movne/moveq). Early-out mask|4 if s+0x45c==-1. Sequential dispatch on
 * s+0x458 (==3 / ==4 / else mask|3), each arm calling a render-setup trio and
 * writing s+0x47c. Converges to func_02077a28 (mask|1 on 0) then mask|ret. */
extern int  func_020771bc(void *s);
extern int  func_02077a28(void *s, void *p);
extern void func_02077e58(void *o, void *p);
extern void func_02077ecc(void *o, int a, int b);
extern void func_02077f8c(void *o);
extern void func_02078498(void *o, void *p);
extern void func_0207850c(void *o, int a, int b);
extern void func_020785cc(void *o);

int func_020770bc(unsigned char *s) {
    int mask;
    int r1;
    if (s[0x5af] != 0) mask = 0; else mask = 0x8000;
    if (*(int *)(s + 0x45c) == -1) return mask | 4;
    if (*(int *)(s + 0x458) == 3) {
        func_02077f8c(s + 0x3fc);
        func_02077ecc(s + 0x3fc, 0, *(int *)(s + 0x464) - *(int *)(s + 0x460));
        func_02077e58(s + 0x3fc, s + 0x468);
        *(int *)(s + 0x47c) = 0x10;
    } else if (*(int *)(s + 0x458) == 4) {
        func_020785cc(s + 0x348);
        func_0207850c(s + 0x348, 0, *(int *)(s + 0x464) - *(int *)(s + 0x460));
        func_02078498(s + 0x348, s + 0x468);
        *(int *)(s + 0x47c) = 0x14;
    } else {
        return mask | 3;
    }
    r1 = func_02077a28(s, s + 0x5b0);
    if (r1 == 0) return mask | 1;
    return mask | func_020771bc(s);
}
