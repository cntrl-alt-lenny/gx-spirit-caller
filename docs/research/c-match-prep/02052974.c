/* CAMPAIGN-PREP candidate for func_02052974 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     exact clone of 02052870; only inner call func_02052b0c differs; same shift/mask recipe
 *   risk:       Same as 02052870: the i==0 shift-split (cmp/movne lsl/moveq #1, constant 1 hoisted to r7) may collapse to a single 'mov lsl'. reshape-able via i?1<<i:1; the constant-1 hoist is permuter-class.
 *   confidence: med
 */
/* func_02052974 — main, cls C. Clone of func_02052870; identical body, only the
   inner callee differs (func_02052b0c here vs func_020528e4 there). COMPLETE. */
extern int func_02046ac4(void);
extern int func_02052b0c(int i, int a1, int a2);

int func_02052974(unsigned int mask, int a1, int a2)
{
    int i = 0;
    do {
        int bit = i ? (1 << i) : 1;
        if (mask & bit) {
            if (i != func_02046ac4()) {
                if (func_02052b0c(i, a1, a2) == 0)
                    mask &= ~bit;
            }
        }
        i = (i + 1) & 0xff;
    } while (i < 0x20);
    return mask;
}
