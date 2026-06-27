/* CAMPAIGN-PREP candidate for func_02039990 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     24-bit mask via (x<<8)>>8 to force lsl;lsr; keep first result across 2nd call
 *   risk:       (x<<8)>>8 may fold to bic r0,#0xff000000 (0xff000000 is a rotatable imm) instead of the lsl#8;lsr#8 pair. reshape-able: switch to a :24 unsigned bitfield read of *arg1.
 *   confidence: med
 */
/* func_02039990 (cls D): two guarded probes; second probe masks *arg1 to low
 * 24 bits via lsl#8;lsr#8 (NOT bic) -> explicit shift pair on the loaded word.
 * First result kept in r4 across the 2nd call, then passed on. */

extern int  func_02089024(int h);
extern void func_0209614c(int a, int b);

int func_02039990(int *arg0, unsigned *arg1) {
    int a = func_02089024(*arg0);
    if (a == 0)
        return 0;
    if (func_02089024((int)((*arg1 << 8) >> 8)) == 0)
        return 0;
    func_0209614c(a, 0);
    return 1;
}
