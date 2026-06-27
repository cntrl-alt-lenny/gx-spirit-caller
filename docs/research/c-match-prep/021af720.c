/* CAMPAIGN-PREP candidate for func_021af720 (ov000, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reference only — bitfield extracts to args; already shipped whole-function .s
 *   risk:       KNOWN reg-alloc wall: orig stores &sp4 to sp[0] and threads sp-frame in an order mwcc won't reproduce; proven unmatchable as C in brief 302. permuter-class — campaign should keep the existing src/overlay000/func_ov000_021af720.s.
 *   confidence: low
 */
/* func_ov000_021af720 — ALREADY SHIPPED AS .s in src/overlay000/func_ov000_021af720.s
 * (brief 302, reg-alloc-walled, GLOBAL_ASM endgame). C reconstruction below is
 * for reference only; it is NOT expected to byte-match (that was already tried
 * and failed -> whole-function .s).
 * Extracts three bitfields from words +0x28/+0x2c of data_ov000_021c758c into
 * a stack record at sp+4, calls func_ov000_021b11d0_unk(&rec via sp[0]=&sp4 ...,
 * actually passes the 3 fields as r0/r1/r2, r3=0, with sp[0]=&sp4), then
 * func_02006c0c(&rec,4,0) and stores the result to +0x8. */

extern unsigned int data_ov000_021c758c[];
extern void func_ov000_021b11d0_unk(int a, int b, int c, int d);
extern int  func_02006c0c(void *p, int n, int z);

void func_ov000_021af720(void) {
    int rec[8];
    unsigned int w28 = data_ov000_021c758c[0x0a]; /* +0x28 */
    unsigned int w2c = data_ov000_021c758c[0x0b]; /* +0x2c */
    void *pp = &rec[0];
    (void)pp;
    func_ov000_021b11d0_unk((int)((w28 << 12) >> 24),
                            (int)((w28 << 4)  >> 24),
                            (int)((w2c << 27) >> 27),
                            0);
    data_ov000_021c758c[0x02] = (unsigned)func_02006c0c(&rec[0], 4, 0); /* +0x8 */
}
