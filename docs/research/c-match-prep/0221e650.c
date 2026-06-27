/* CAMPAIGN-PREP candidate for func_0221e650 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single u16 read -> :2 bit12 test, :1 bit0/bit14 fields; eor via xor; 1-x via rsb
 *   risk:       Orig reads f2 ONCE into r2 then extracts every slice (movs/lsl on r2); if mwcc re-ldrh per field access the ldrh count diverges. reshape-able: one multi-field bitfield struct read.
 *   confidence: med
 */
/* func_ov002_0221e650: bit-test branch + eor of two bit slices (cls D). Reads
 * self->f2 once; tests the :2 field at bit12. If 0: two 021e05fc calls with
 * bit0 and its complement. Else: 021df818(self, 1-(bit14^bit0), 0x64). */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 : 11; u16 b12 : 2; u16 b14 : 1; };
extern int  func_ov002_021df818(int self, int a, int b);
extern int  func_ov002_021e05fc(int a, int b);
extern int  func_ov002_0220e988(void);
int func_ov002_0221e650(struct Self *self) {
    if (self->b12 == 0) {
        func_ov002_0220e988();
        func_ov002_021e05fc(self->b0, 0x258);
        func_ov002_021e05fc(1 - self->b0, 0x258);
    } else {
        func_ov002_021df818((int)self, 1 - (self->b14 ^ self->b0), 0x64);
    }
    return 0;
}
