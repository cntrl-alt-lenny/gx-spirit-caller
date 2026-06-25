/* CAMPAIGN-PREP candidate for func_0208d6f4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     equality if/else-if (beq cascade); per-arm RMW-then-strb store order; bit31 set/clear
 *   risk:       reshape-able: equality cascade should match; main divergence is whether mwcc keeps 0x04000000 as mov-immediate base re-derived per arm vs a held reg — orig re-derives mov r2,#0x4000000 per arm, which the natural C produces.
 *   confidence: med
 */
/* func_0208d6f4 (main, class C) — field idx8 (=0x10); 3-way EQUALITY dispatch
 * (beq cascade => if/else-if). MMIO RMW of main sound reg 0x04000000 bit31.
 *   arg==0    -> 0x04000000 &= ~bit31
 *   arg==0x20 -> 0x04000000 |= bit31 ; sound[0x245]=0x85
 *   arg==0x40 -> 0x04000000 |= bit31 ; sound[0x246]=0x85
 * 0x04000000 is materialized via mov (immediate), not a literal load.
 */
extern unsigned short data_021a6304[13];
extern void func_0208dce4(int bits);

void func_0208d6f4(int arg) {
    unsigned short old = data_021a6304[8];
    data_021a6304[8] = (unsigned short)arg;
    data_021a6304[0] = (data_021a6304[0] | old) & ~arg;
    if (arg == 0) {
        *(volatile unsigned int *)0x04000000 &= ~0x80000000;
    } else if (arg == 0x20) {
        *(volatile unsigned int *)0x04000000 |= 0x80000000;
        *(volatile unsigned char *)0x04000245 = 0x85;
    } else if (arg == 0x40) {
        *(volatile unsigned int *)0x04000000 |= 0x80000000;
        *(volatile unsigned char *)0x04000246 = 0x85;
    }
    func_0208dce4(data_021a6304[0]);
}
