/* CAMPAIGN-PREP candidate for func_020a4180 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: plain unsigned %20 -> umull reciprocal + second umull; literal-addr deref; sum-loop
 *   risk:       reshape-able: %20 must stay UNSIGNED so mwcc picks umull (signed would emit smull). If buf[12] rounds to !=0xc stack, frame diverges (sub sp,#0xc). Loop-shape (ptr-walk vs index) minor.
 *   confidence: med
 */
/* func_020a4180: fill 12-byte buf, sum 6 bytes, then (sum+*0x027ffc3c)*7 % 20.
 * 0xcccccccd>>4 magic = unsigned /20; the second umull(20) gives %20 (class D). */
extern void func_02093a20(unsigned char *buf);

int func_020a4180(void) {
    unsigned char buf[12];
    int sum;
    int i;
    unsigned int x;

    func_02093a20(buf);
    sum = 0;
    for (i = 0; i < 6; i++)
        sum += buf[i];
    x = (unsigned int)((sum + *(int *)0x027ffc3c) * 7);
    return (int)(x % 20);
}
