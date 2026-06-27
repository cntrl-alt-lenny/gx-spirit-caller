/* CAMPAIGN-PREP candidate for func_0208d138 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch (int) for signed bgt/bge tree; 0x180 falls through to 0x80; case order 4/0x180/0x80
 *   risk:       permuter-class: switch binary-search pivot (orig roots at cmp #0x80) and the 0x180->0x80 fallthrough block layout are mwcc-version-specific; tree shape may differ even with correct cases.
 *   confidence: med
 */
/* func_0208d138 (main, class C) — field idx9 (=0x12); SWITCH on int (signed
 * bgt/bge tree). Cases 4, 0x80, 0x180 with 0x180 FALLING THROUGH into 0x80
 * (shared .L_244 store reached by both arg==0x80 and the 0x180 arm).
 *   case 4     -> sound[0x242]=0x84
 *   case 0x180 -> sound[0x249]=0x81 ; (ft) sound[0x248]=0x81
 *   case 0x80  -> sound[0x248]=0x81
 */
extern unsigned short data_021a6304[13];
extern void func_0208dce4(int bits);

void func_0208d138(int arg) {
    unsigned short old = data_021a6304[9];
    data_021a6304[9] = (unsigned short)arg;
    data_021a6304[0] = (data_021a6304[0] | old) & ~arg;
    switch (arg) {
    case 0x4:
        *(volatile unsigned char *)0x04000242 = 0x84;
        break;
    case 0x180:
        *(volatile unsigned char *)0x04000249 = 0x81;
        /* fallthrough */
    case 0x80:
        *(volatile unsigned char *)0x04000248 = 0x81;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
