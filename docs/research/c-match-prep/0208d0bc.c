/* CAMPAIGN-PREP candidate for func_0208d0bc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     empty arg==0 arm first; equality if/else-if cascade; last arm predicated by mwcc
 *   risk:       reshape-able: last arm (0x100) must predicate (streqb) not branch — keep it the FINAL single-store arm; if mwcc branches it, swap arm order. Empty ==0 arm may need the explicit if to emit cmp;beq.
 *   confidence: med
 */
/* func_0208d0bc (main, class C) — field idx10 (=0x14); 3-way equality dispatch.
 *   arg==0     -> (no body)
 *   arg==8     -> sound[0x243]=0x84  (emitted as a branch arm)
 *   arg==0x100 -> sound[0x249]=0x82  (orig predicates ldreq/moveq/streqb)
 */
extern unsigned short data_021a6304[13];
extern void func_0208dce4(int bits);

void func_0208d0bc(int arg) {
    unsigned short old = data_021a6304[10];
    data_021a6304[10] = (unsigned short)arg;
    data_021a6304[0] = (data_021a6304[0] | old) & ~arg;
    if (arg == 0) {
        /* no-op arm: cmp r0,#0; beq tail */
    } else if (arg == 8) {
        *(volatile unsigned char *)0x04000243 = 0x84;
    } else if (arg == 0x100) {
        *(volatile unsigned char *)0x04000249 = 0x82;
    }
    func_0208dce4(data_021a6304[0]);
}
