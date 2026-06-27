/* CAMPAIGN-PREP candidate for func_02052870 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do-while u8 counter; bit=i?1<<i:1 to match cmp/moveq/movne; mask&=~bit only on ==0 arm
 *   risk:       The i==0 shift split (cmp r8,#0;movne lsl;moveq #1 with 1 hoisted to r7) is the fragile part: mwcc may emit a single 'mov r9,r7,lsl r8' and drop the cmp, or not hoist the 1. reshape-able if it collapses (the i?:1 form); the r7-hoist of constant 1 is permuter-class.
 *   confidence: med
 */
/* func_02052870 — main, cls C. Bitmask scan loop, shift-by-reg. COMPLETE.
   i is an unsigned-char-style counter ((i+1)&0xff, cmp<0x20). Orig special-cases
   i==0 for the shift (moveq bit=1 / movne bit=1<<i); written as (i?1<<i:1) to
   force that cmp+moveq+movne split rather than a bare 'mov lsl'. */
extern int func_02046ac4(void);
extern int func_020528e4(int i, int a1, int a2);

int func_02052870(unsigned int mask, int a1, int a2)
{
    int i = 0;
    do {
        int bit = i ? (1 << i) : 1;
        if (mask & bit) {
            if (i != func_02046ac4()) {
                if (func_020528e4(i, a1, a2) == 0)
                    mask &= ~bit;
            }
        }
        i = (i + 1) & 0xff;
    } while (i < 0x20);
    return mask;
}
