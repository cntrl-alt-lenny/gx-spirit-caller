/* CAMPAIGN-PREP candidate for func_0204c384 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested-if guards (not &&) for cmp+moveq; unsigned do-while i<n with bcc/bls; int-array index arr[i]
 *   risk:       a1 compared with bls (unsigned) so n is unsigned; guards are two separate cmp+moveq (==4, ==1) returning const 1. If mwcc fuses the [+0x1a6]!=0 && [+0x1a0]==N pairs into a combined branch instead of nested, the moveq/ldmeq layout diverges (reshape-able: keep guards nested as written).
 *   confidence: med
 */
/* func_0204c384 - main - class C
 * counted loop over int array arg0[0..a1), each elem -> func_0204b280.
 * Pre-guard: if [+0x1a6]!=0 && [+0x1a0]==4 return 1. Per-iter: if mapped==0
 * return 0; if [+0x1a6]!=0 && [+0x1a0]==1 return 1. Fallthrough return 1.
 * Offsets per src/main/func_0204c384.s.
 */
extern unsigned char *func_020498f0(void);
extern int func_0204b280(int);

int func_0204c384(int *a0, unsigned int a1)
{
    int *arr;
    unsigned int n;
    unsigned int i;

    arr = a0;
    n = a1;
    if (func_020498f0()[0x1a6] != 0) {
        if (*(int *)(func_020498f0() + 0x1a0) == 4)
            return 1;
    }
    if (n != 0) {
        i = 0;
        do {
            if (func_0204b280(arr[i]) == 0)
                return 0;
            if (func_020498f0()[0x1a6] != 0) {
                if (*(int *)(func_020498f0() + 0x1a0) == 1)
                    return 1;
            }
            i++;
        } while (i < n);
    }
    return 1;
}
