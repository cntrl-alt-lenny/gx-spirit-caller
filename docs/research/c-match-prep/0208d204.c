/* CAMPAIGN-PREP candidate for func_0208d204 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch (int) for signed tree; case 0xc store-order 0x243-then-0x242; no fallthrough
 *   risk:       permuter-class: switch binary-search tree shape (orig pivots cmp #8 then #4/#0xc) is mwcc-specific. Store-order in case 0xc is fixed in C, so that part is reshape-safe.
 *   confidence: med
 */
/* func_0208d204 (main, class C) — field idx3 (=0x6); SWITCH on int (signed
 * bgt/bge tree). Cases 4, 8, 0xc; each has its own break (no fallthrough).
 *   case 4   -> sound[0x242]=0x82
 *   case 8   -> sound[0x243]=0x82
 *   case 0xc -> sound[0x243]=0x8a ; sound[0x242]=0x82   (store order 0x243 then 0x242)
 */
extern unsigned short data_021a6304[13];
extern void func_0208dce4(int bits);

void func_0208d204(int arg) {
    unsigned short old = data_021a6304[3];
    data_021a6304[3] = (unsigned short)arg;
    data_021a6304[0] = (data_021a6304[0] | old) & ~arg;
    switch (arg) {
    case 0x4:
        *(volatile unsigned char *)0x04000242 = 0x82;
        break;
    case 0x8:
        *(volatile unsigned char *)0x04000243 = 0x82;
        break;
    case 0xc:
        *(volatile unsigned char *)0x04000243 = 0x8a;
        *(volatile unsigned char *)0x04000242 = 0x82;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
