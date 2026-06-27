/* CAMPAIGN-PREP candidate for func_020264f0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: bind sub=self+0x94 once; bit0 test via (x<<31)>>31; second loop mirrors 02025a10.
 *   risk:       reshape-able: orig keeps r4=self+0x94 across all three frees and reuses r5/r6 as i/zero in loop2; if mwcc reloads sub or the (x<<31)>>31 byte-test becomes tst+movs, ldrb/mov-pair sequence diverges.
 *   confidence: med
 */
/* func_020264f0: teardown. self+0x94 = sub. Free sub[0x10] (slot d) via
 * func_0200f01c if set; free sub[0] via func_02006e1c if set and !bit0 of
 * sub[0x16]; free sub[0x4],sub[0x8] (2-entry array) likewise; then the same
 * 6-entry attr clear loop as 02025a10. Returns 1. */

extern void func_02006e1c(void);
extern void func_0200f01c(void);
extern void func_02022580(void);

int func_020264f0(char *self) {
    char *sub = self + 0x94;
    int i5;
    int zero;
    char *fbyte;
    int i6;

    if (*(int *)(sub + 0x10) != 0) {
        func_0200f01c();
        *(int *)(sub + 0x10) = 0;
    }
    if (*(int *)sub != 0) {
        if (((*(unsigned char *)(sub + 0x16) << 31) >> 31) == 0) {
            func_02006e1c();
            *(int *)sub = 0;
        }
    }
    i5 = 0;
    zero = 0;
    do {
        if (*(int *)(sub + (i5 << 2) + 0x4) != 0) {
            if (((*(unsigned char *)(sub + 0x16) << 31) >> 31) == 0) {
                func_02006e1c();
                *(int *)(sub + (i5 << 2) + 0x4) = zero;
            }
        }
        i5++;
    } while (i5 < 2);

    fbyte = self + 0x3 + 0x100;
    i6 = 0;
    do {
        short *attr = (short *)(self + (i6 << 4) + 0x100);
        if (*attr >= 0) {
            func_02022580();
            *(short *)(self + (i6 << 4) + 0x100) = (short)-1;
            *fbyte = (char)(*fbyte & ~1);
        }
        i6++;
        fbyte += 0x10;
    } while (i6 < 6);
    *(short *)(self + 0x16a) = (short)(*(unsigned short *)(self + 0x16a) & ~1);
    return 1;
}
