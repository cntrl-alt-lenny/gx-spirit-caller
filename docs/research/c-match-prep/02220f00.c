/* CAMPAIGN-PREP candidate for func_02220f00 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cmp-eq guarded :9 extract as if-assign (r3 preset 0); :1 field; u16 clamp
 *   risk:       reshape-able: r3 preset to 0 then filled only on cmp-eq -> must stay if-assign not ternary to match moveq chain; the (u16) reclamp must remain a separate lsl/lsr (don't fold into the :9).
 *   confidence: high
 */
/* func_ov002_02220f00 (ov002, D) — conditional :9 extract, single tail call.
 * f0(@+0)==0x14e2 ? slot = f4's :9 at bit6 ((f4<<0x11>>0x17)) : 0; clamp to u16
 * (lsl#0x10;lsr#0x10). f2(@+2):1 at bit0. call e276c(bit0, slot, 1). return 0.
 * r3 starts 0 and only the eq path fills it -> ternary/if-assign on the cmp. */
typedef unsigned short u16;
struct Card { u16 f0; u16 f2; u16 f4; };
extern void func_ov002_021e276c(int a, int b, int c);

int func_ov002_02220f00(struct Card *c) {
    int slot = 0;
    if (c->f0 == 0x14e2)
        slot = (c->f4 << 0x11) >> 0x17;
    slot = (u16)slot;
    func_ov002_021e276c(c->f2 & 1, slot, 1);
    return 0;
}
