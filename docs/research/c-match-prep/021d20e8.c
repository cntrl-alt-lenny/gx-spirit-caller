/* CAMPAIGN-PREP candidate for func_021d20e8 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D extract: (fc<<16)>>16 + (word<<28)>>28 shift-pairs; mla idx via i*S+r
 *   risk:       reshape-able: needs the lsl;lsr pairs to survive (a literal mask -> `and`, breaks). mla fusion of (fc>>16)*c+r is reliable. struct-guessed: base@0, fc@0xc offsets inferred from asm.
 *   confidence: med
 */
/* func_ov011_021d20e8: bit lookup. obj->fc packs hi16=row-stride mult,
 * lo16=a 16-bit word. idx = (fc>>16)*c + r;  word = obj->base[idx];
 * shift = word & 0xf (lsl#1c;lsr#1c 4-bit extract); result = (fc_lo16 >>
 * shift) & 1.  fc_lo16 via (fc<<16)>>16, word nibble via (word<<28)>>28 to
 * force the lsl;lsr pairs (plain masks would fold to `and`). */
typedef struct {
    int *base;
    char _4[0x8];
    unsigned int fc;
} ov011_bits_t;

int func_ov011_021d20e8(ov011_bits_t *obj, int r, int c) {
    unsigned int fc = obj->fc;
    int idx = (int)(fc >> 16) * c + r;
    unsigned int word = (unsigned int)obj->base[idx];
    return ((((fc << 16) >> 16) >> (((word << 28) >> 28))) & 1);
}
