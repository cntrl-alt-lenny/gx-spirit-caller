/* CAMPAIGN-PREP candidate for func_0208cfa4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order old-first; store RMW-then-strb; equality if/else-if; reload field[0] for call
 *   risk:       permuter-class: hoisted cmp r0,#0 and old/field[0] dual-ldr ordering before strh are scheduling-fragile; if mwcc reorders the two ldrh or the cmp, bytes diverge.
 *   confidence: med
 */
/* func_0208cfa4 (main, class C) — flag-update + branchy state write + tail call.
 * data_021a6304 modeled as u16[13] (sibling preps 0208cf6c/cb88 establish this).
 * field idx12 (=0x18) is this fn's owned sub-state; field[0] is the shared mask.
 *   prologue: old=field[12]; field[12]=arg; field[0]=(field[0]|old)&~arg; then dispatch.
 *   arg==0      -> clear IO bit31
 *   arg==0x100  -> set IO bit31, sound[0x249]=0x83
 */
extern unsigned short data_021a6304[13];
extern void func_0208dce4(int bits);

void func_0208cfa4(int arg) {
    unsigned short old = data_021a6304[12];
    data_021a6304[12] = (unsigned short)arg;
    data_021a6304[0] = (data_021a6304[0] | old) & ~arg;
    if (arg == 0) {
        *(volatile unsigned int *)0x04001000 &= ~0x80000000;
    } else if (arg == 0x100) {
        *(volatile unsigned int *)0x04001000 |= 0x80000000;
        *(volatile unsigned char *)0x04000249 = 0x83;
    }
    func_0208dce4(data_021a6304[0]);
}
