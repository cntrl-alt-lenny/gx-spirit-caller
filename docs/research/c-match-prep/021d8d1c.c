/* CAMPAIGN-PREP candidate for func_021d8d1c (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit two-read bitfield RMW (separate f local) + volatile dbl-load; store-order
 *   risk:       documented WALL: orig keeps (field>>8) in scratch `ip`, mwcc reuses r2 across the bic/orr insert — whole-word value identical, 1 register NUMBER off. permuter-class (escape to .s if it persists).
 *   confidence: low
 */
/* func_ov004_021d8d1c: leaf MMIO RMW at 0x04001000 — clear the low 2 bits of the
 * 5-bit field at bits 8..12 (read-modify-write), then zero the words at +0x10 and
 * +0x14, return 1. cls D: bitfield RMW (and 0x1f00; lsr#8; bic #3; orr lsl#8).
 * KNOWN WALL (ov004_core.h): orig holds (field>>8) in ip across the insert; mwcc
 * tends to reuse r2 -> 1 reg off. Written as an explicit two-read extract/insert
 * (separate `f` local) to try to pin the scratch into `ip`; the two distinct
 * volatile loads (r2 then r1) reproduce the orig's `ldr;ldr` of the same addr.
 */
int func_ov004_021d8d1c(void) {
    volatile unsigned int *p = (volatile unsigned int *)0x04001000;
    unsigned int f = (*p & 0x1f00) >> 8;          /* load #1 (r2), and, lsr -> ip */
    *p = (*p & ~0x1f00) | ((f & ~3) << 8);        /* load #2 (r1), bic, bic, orr */
    *(volatile int *)0x04001010 = 0;
    *(volatile int *)0x04001014 = 0;
    return 1;
}
