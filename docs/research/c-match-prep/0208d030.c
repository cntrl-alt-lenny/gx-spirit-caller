/* CAMPAIGN-PREP candidate for func_0208d030 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     same as cfa4 (decl-order old-first, RMW-then-strb, equality if/else-if), idx11/bit30/0x80
 *   risk:       permuter-class: identical structure to cfa4; same dual-ldrh + hoisted-cmp scheduling is the divergence point. If cfa4 lands, this lands with the same tweak.
 *   confidence: med
 */
/* func_0208d030 (main, class C) — clone-variant of cfa4: field idx11 (=0x16),
 * IO bit30 (0x40000000), arg==0x80, sound[0x248]=0x82.
 */
extern unsigned short data_021a6304[13];
extern void func_0208dce4(int bits);

void func_0208d030(int arg) {
    unsigned short old = data_021a6304[11];
    data_021a6304[11] = (unsigned short)arg;
    data_021a6304[0] = (data_021a6304[0] | old) & ~arg;
    if (arg == 0) {
        *(volatile unsigned int *)0x04001000 &= ~0x40000000;
    } else if (arg == 0x80) {
        *(volatile unsigned int *)0x04001000 |= 0x40000000;
        *(volatile unsigned char *)0x04000248 = 0x82;
    }
    func_0208dce4(data_021a6304[0]);
}
