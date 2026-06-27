/* CAMPAIGN-PREP candidate for func_021ca630 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned (x<<15)>>28 guard => lsl;lsr;movs; bic/orr constant RMW for 4-bit field
 *   risk:       reshape-able: if guard compiles to and+lsr not lsl#15;lsr#28, make it an unsigned :4 bitfield at bit13. Offsets 0x2a4/0x280 struct-guessed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov011_021ca630 (ov011, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe:     unsigned (x<<15)>>28 bitfield guard => lsl;lsr;movs early-return; bic/orr 4-bit-field RMW
 *   risk:       reshape-able: if mwcc emits 'and+lsr' for the guard instead of 'lsl#15;lsr#28', switch the read to an unsigned :4 bitfield struct member at bit13 to force the lsl;lsr pair. (struct-guessed: 0x2a4/0x280 offsets and field positions inferred)
 *   confidence: med
 */
/* func_ov011_021ca630 (ov011, class D): if 4-bit field (bits 16:13) of
 * data_4000[0x2a4] is nonzero, RMW data_403c[0x280]: clear bits 21:18, set 19:18
 * (=value 3 in that 4-bit field). The guard's lsl#15;lsr#28 is the bitfield tell. */
extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];

void func_ov011_021ca630(void) {
    unsigned int f = (unsigned int)(*(int *)(data_ov011_021d4000 + 0x2a4) << 15) >> 28;
    if (f != 0) {
        int *p = (int *)(data_ov011_021d403c + 0x280);
        *p = (*p & ~0x3c0000) | 0xc0000;
    }
}
