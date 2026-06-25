/* CAMPAIGN-PREP candidate for func_0204b280 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard early-return; do-while i<[+0x344]; map via callee then >0 and ==key tests; reload len each iter
 *   risk:       orig reserves an unused 4-byte stack slot (sub sp,#4). The inner two compares (v>0 then v==key) must stay nested, not && -fused. If mwcc fuses or reorders the v>0 / v==key tests the cmp sequence diverges (reshape-able: keep nested ifs as written).
 *   confidence: med
 */
/* func_0204b280 - main - class C
 * search over byte array [+0x304], len [+0x344]; map each via func_0204918c.
 * Guard [+0x2fc]==0 -> 0. Hit (mapped==key) -> 1; else 0.
 * Reserves sub sp,#4 (unused). Offsets per src/main/func_0204b280.s.
 */
extern unsigned char *func_020498f0(void);
extern int func_0204918c(int);

int func_0204b280(int a0)
{
    int key;
    int i;
    int v;

    key = a0;
    if (*(int *)(func_020498f0() + 0x2fc) == 0)
        return 0;
    i = 0;
    if (*(int *)(func_020498f0() + 0x344) > 0) {
        do {
            v = func_0204918c(func_020498f0()[i + 0x304]);
            if (v > 0) {
                if (v == key)
                    return 1;
            }
            i++;
        } while (i < *(int *)(func_020498f0() + 0x344));
    }
    return 0;
}
