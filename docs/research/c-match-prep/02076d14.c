/* CAMPAIGN-PREP candidate for func_02076d14 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     merged &&-shortcircuit reproduces beq/bne fall-through; store-order 0x32 then 0x455; r7/r4 held across calls
 *   risk:       reshape-able: the 3-term && must lower to two cmp;beq then cmp;bne with func_020a7440 only in-path; mwcc may invert a branch sense. offsets struct-guessed.
 *   confidence: med
 */
/* func_02076d14: memcpy 0x20 to s+0x54, then a 3-way guarded branch on
 * s[0x30] (r7) and pkt[0x22] (r4). The fast path compares via func_020a7440
 * and sets s[0x31]; the slow path runs func_02077b98 / a second copy and
 * clears flags. Tail: big-endian halfword store + s[0x455]=2. r0=s, r1=pkt. */
extern void func_02077b98(void *s);
extern int  func_020a7440(void *a, void *b, int n);
extern void func_02094688(void *src, void *dst, int n);

void func_02076d14(unsigned char *s, unsigned char *pkt) {
    int r7, r4;
    func_02094688(pkt + 2, s + 0x54, 0x20);
    r7 = s[0x30];
    r4 = pkt[0x22];
    pkt += 0x23;
    if (r7 != 0 && r4 == 0x20 && func_020a7440(s + 0x74, pkt, 0x20) == 0) {
        s[0x31] = 1;
    } else {
        if (r7 != 0) func_02077b98(s);
        if (r4 == 0) {
            s[0x30] = 0;
        } else {
            func_02094688(pkt, s + 0x74, 0x20);
            s[0x30] = 1;
        }
        s[0x31] = 0;
    }
    *(unsigned short *)(s + 0x32) = pkt[r4 + 1] + (pkt[r4] << 8);
    s[0x455] = 2;
}
