/* CAMPAIGN-PREP candidate for func_0208d7ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch (int) incl case 0; 0x60->0x20 fallthrough; case 0x20 strb-BEFORE-RMW per orig
 *   risk:       permuter-class: 5-case signed tree (orig roots cmp #0x20) with case 0 + 0x60->0x20 fallthrough; tree shape and the inverted strb/RMW order in case 0x20 (fixed in C) vs other arms. Tree pivot is the fragile part.
 *   confidence: low
 */
/* func_0208d7ac (main, class C) — field idx7 (=0xe); DEEP SWITCH on int
 * (signed tree), MMIO RMW of 0x04000000 bit30 (0x40000000). Cases 0,0x10,0x20,0x40,0x60;
 * 0x60 FALLS THROUGH into 0x20.
 *   case 0    -> 0x04000000 &= ~bit30                                  (orig predicates this arm)
 *   case 0x10 -> 0x04000000 |= bit30 ; sound[0x244]=0x84
 *   case 0x40 -> 0x04000000 |= bit30 ; sound[0x246]=0x8c
 *   case 0x60 -> sound[0x246]=0x8c ; (ft 0x20)
 *   case 0x20 -> sound[0x245]=0x84 ; 0x04000000 |= bit30   (NOTE: strb BEFORE the RMW here)
 */
extern unsigned short data_021a6304[13];
extern void func_0208dce4(int bits);

void func_0208d7ac(int arg) {
    unsigned short old = data_021a6304[7];
    data_021a6304[7] = (unsigned short)arg;
    data_021a6304[0] = (data_021a6304[0] | old) & ~arg;
    switch (arg) {
    case 0x0:
        *(volatile unsigned int *)0x04000000 &= ~0x40000000;
        break;
    case 0x10:
        *(volatile unsigned int *)0x04000000 |= 0x40000000;
        *(volatile unsigned char *)0x04000244 = 0x84;
        break;
    case 0x40:
        *(volatile unsigned int *)0x04000000 |= 0x40000000;
        *(volatile unsigned char *)0x04000246 = 0x8c;
        break;
    case 0x60:
        *(volatile unsigned char *)0x04000246 = 0x8c;
        /* fallthrough */
    case 0x20:
        *(volatile unsigned char *)0x04000245 = 0x84;
        *(volatile unsigned int *)0x04000000 |= 0x40000000;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
