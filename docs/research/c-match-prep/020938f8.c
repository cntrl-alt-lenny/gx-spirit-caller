/* CAMPAIGN-PREP candidate for func_020938f8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield extract (and;lsl#8;lsr#16 literal); ==0x10 cond store-return else tail-call
 *   risk:       reshape-able: must write `((p1 & 0x7f00) << 8) >> 16` literally — the equivalent `(p1 >> 8) & 0x7f` compiles to `lsr;and` (2 insns reordered) and diverges from `and;lsl;lsr`. The eq-path early-return vs ne tail-call ordering should follow naturally; p0 is unused (r0 untouched).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_020938f8 (main, class D, MED tier) — EUR .s front-load.
 * UNVERIFIED + ITERATION-EXPECTED: bitfield extract + conditional store + tail call.
 *   recipe:     CLASS D bitfield: extract via (p1 & 0x7f00) then lsl#8;lsr#16 (write the literal mask-then-shift so mwcc keeps and;lsl;lsr, NOT >>8&0x7f which gives lsr;and); ==0x10 cond store-then-return else tail-call
 *   risk:       see header below
 * func_020938f8(p0, p1):
 *   f = ((p1 & 0x7f00) << 8) >> 16;   // == (p1 & 0x7f00) >> 8, i.e. bits 8..14
 *   if (f == 0x10) { *(u16*)data_021a66f4 = 1; return; }
 *   func_02093bfc();   // tail (after frame teardown) when f != 0x10
 * The (and #0x7f00; lsl#8; lsr#16) idiom is the literal extract; the eq-arm does
 * the store + early epilogue, the ne-arm falls through to the bl.
 */

extern unsigned short data_021a66f4;
extern void func_02093bfc(void);

void func_020938f8(int p0, unsigned int p1) {
    unsigned int f = ((p1 & 0x7f00u) << 8) >> 16;
    (void)p0;
    if (f == 0x10) {
        data_021a66f4 = 1;
        return;
    }
    func_02093bfc();
}
