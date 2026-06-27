/* CAMPAIGN-PREP candidate for func_021ab5ac (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single :6 bitfield insert at bit10 via row[idx], bitfield not mask
 *   risk:       reshape-able: the lone :6 insert is the cleanest of the family; chief risk is mwcc folding (arg1&0xff)<<26>>16 to a shorter mask vs the orig <<26;lsr#16 pair — if so widen to :8 source masking. struct-guessed offset +8.
 *   confidence: med
 */
/* func_ov000_021ab5ac (ov000, D) — stride-44 row [r0], word at +8.
 * Single 6-bit bitfield insert at bit10 (mask 0xfc00): the orig does
 *   r0 = arg1 & 0xff; r1 = w & ~0xfc00; (r0<<26)>>16 | r1
 * i.e. value masked to 6 bits placed at bit10. Model as a :6 bitfield at
 * bit10 so mwcc emits the bic ~0xfc00 + lsl/lsr insert (a plain mask would
 * 'and' instead of the lsl;lsr the bitfield path gives). */
struct Ov000Row { char pad0[8]; unsigned : 10; unsigned f10 : 6; unsigned : 16; char pad12[32]; };  /* stride 44 */
extern struct Ov000Row data_ov000_021c7530[];

void func_ov000_021ab5ac(int idx, int arg1) {
    data_ov000_021c7530[idx].f10 = arg1;
}
