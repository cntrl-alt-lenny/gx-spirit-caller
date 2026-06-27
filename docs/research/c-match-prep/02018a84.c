/* CAMPAIGN-PREP candidate for func_02018a84 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D bitfield: low-3-bit extract as (x<<29)>>29 on global[+4]; preserve p0/p1 in callee-saved across 3 calls
 *   risk:       permuter-class: (x<<29)>>29 peepholes to `and #7` under mwcc 2.0 (same family as 02018dcc which needed permuter to keep lsl;lsr). struct-guessed: data_02104f4c[+4] field offset inferred from `ldr [r2,#4]`
 *   confidence: med
 */
/* func_02018a84 (main, class D, MED) — 3-bit field extract on a global then
 * forward args. p0->r5, p1->r4 saved across calls. Reads data_02104f4c[1]
 * (offset +4), extracts low 3 bits via (x<<29)>>29, passes to func_0202ae1c.
 * Then func_0202ba94(p0,p1); func_0202af40(). Modeled byte-for-byte on the
 * batch asm. NOTE: the (x<<29)>>29 form is the bitfield-extract recipe; written
 * as shifts to target lsl#0x1d;lsr#0x1d (a plain &7 would emit `and`). */
extern unsigned int data_02104f4c[];
extern void func_0202ae1c(int);
extern void func_0202af40(void);
extern void func_0202ba94(int, int);

void func_02018a84(int p0, int p1) {
    func_0202ae1c((data_02104f4c[1] << 0x1d) >> 0x1d);
    func_0202ba94(p0, p1);
    func_0202af40();
}
