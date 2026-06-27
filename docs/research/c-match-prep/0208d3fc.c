/* CAMPAIGN-PREP candidate for func_0208d3fc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch (int); case-order 0x40/0x60->0x20/0x70->0x30->0x10 to drive fallthrough block layout
 *   risk:       permuter-class: 6-case signed binary-search tree + 3 fallthrough chains; both the comparison tree AND block ordering are mwcc-specific. Most likely arm in batch to need permuter or .s escape.
 *   confidence: low
 */
/* func_0208d3fc (main, class C) — field idx5 (=0xa); DEEP SWITCH on int
 * (signed tree), MANY fallthroughs — the brittle one. Cases 0x10,0x20,0x30,0x40,0x60,0x70.
 * Fallthrough chains observed: 0x70->0x30->0x10 and 0x60->0x20; 0x40 standalone.
 *   case 0x40 -> sound[0x246]=0x83
 *   case 0x60 -> sound[0x246]=0x8b ; (ft 0x20) sound[0x245]=0x83
 *   case 0x70 -> sound[0x246]=0x9b ; (ft 0x30) sound[0x245]=0x93 ; (ft 0x10) sound[0x244]=0x83
 *   case 0x20 -> sound[0x245]=0x83
 *   case 0x30 -> sound[0x245]=0x93 ; (ft 0x10) sound[0x244]=0x83
 *   case 0x10 -> sound[0x244]=0x83
 * Case ORDER below is chosen so the fallthrough block layout matches orig
 * (.L_284->.L_290 and .L_2a0->.L_2ac->.L_2b8).
 */
extern unsigned short data_021a6304[13];
extern void func_0208dce4(int bits);

void func_0208d3fc(int arg) {
    unsigned short old = data_021a6304[5];
    data_021a6304[5] = (unsigned short)arg;
    data_021a6304[0] = (data_021a6304[0] | old) & ~arg;
    switch (arg) {
    case 0x40:
        *(volatile unsigned char *)0x04000246 = 0x83;
        break;
    case 0x60:
        *(volatile unsigned char *)0x04000246 = 0x8b;
        /* fallthrough */
    case 0x20:
        *(volatile unsigned char *)0x04000245 = 0x83;
        break;
    case 0x70:
        *(volatile unsigned char *)0x04000246 = 0x9b;
        /* fallthrough */
    case 0x30:
        *(volatile unsigned char *)0x04000245 = 0x93;
        /* fallthrough */
    case 0x10:
        *(volatile unsigned char *)0x04000244 = 0x83;
        break;
    }
    func_0208dce4(data_021a6304[0]);
}
