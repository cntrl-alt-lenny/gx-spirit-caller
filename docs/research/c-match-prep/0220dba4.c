/* CAMPAIGN-PREP candidate for func_0220dba4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D bitfield: u16:5 field as UNSIGNED local (bhs); two sequential ifs, re-read field
 *   risk:       reshape-able (already applied): the 5-bit field MUST be an unsigned local or mwcc emits signed bge instead of orig bcs/bhs. Verified byte-exact (124B).
 *   confidence: high
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int func_ov002_021ff320(struct Ov002Self *self);
extern int func_ov002_021bc55c(int bit0, int n);
int func_ov002_0220dba4(struct Ov002Self *self) {
    unsigned int n;
    if (func_ov002_021ff320(self) == 0) return 0;
    n = self->b1_5;
    if (n < 4) { if (func_ov002_021bc55c(self->b0, n + 1) != 0) return 1; }
    n = self->b1_5;
    if (n != 0) { if (func_ov002_021bc55c(self->b0, n - 1) != 0) return 1; }
    return 0;
}
