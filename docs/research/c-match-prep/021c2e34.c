/* CAMPAIGN-PREP candidate for func_021c2e34 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: parity&1 *0x868; :13 id via lsl/lsr; reverse loop &arr[i] with -4 step; -1 via mvn
 *   risk:       reshape-able: orig holds r2=base-offset (mul) and reuses it for both cf180 and cf16c reads, and steps r6 by -4 (no per-iter mul); if mwcc recomputes parity*0x868 separately for the array base or indexes per-iter, the shared-offset mul and ptr decrement diverge.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2e34 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected.
 *   reverse linear search returning the matching index (or -1).
 *   parity = arg0 & 1; base = parity*0x868. count = cf180[base].
 *   arr = cf16c + base + 0x18 + 0x400 (== +0x418), 4-byte entries.
 *   for i = count-1 down to 0: id13 = arr[i] low13 (lsl#0x13;lsr#0x13);
 *   if func_0202df78(id13, arg1) != 0 return i. exhausted -> return -1 (mvn #0).
 */
extern char data_ov002_022cf16c[];     /* _LIT2 */
extern char data_ov002_022cf180[];     /* _LIT1 : count array */
extern int  func_0202df78(unsigned int id, int arg);

int func_ov002_021c2e34(int arg0, int arg1)
{
    int base = (arg0 & 1) * 0x868;
    int i = *(int *)((char *)data_ov002_022cf180 + base) - 1;
    if (i >= 0) {
        int *p = (int *)((char *)data_ov002_022cf16c + base + 0x18 + 0x400) + i;
        do {
            if (func_0202df78((unsigned int)(*p << 0x13) >> 0x13, arg1) != 0)
                return i;
            p--;
            i--;
        } while (i >= 0);
    }
    return -1;
}
