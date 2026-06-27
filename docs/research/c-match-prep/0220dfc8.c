/* CAMPAIGN-PREP candidate for func_0220dfc8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: unsigned range 5<=k<=10 (cmp;blo;cmp;bhi); 2-bit via (unsigned h<<18)>>30 (lsl;lsrs)
 *   risk:       reshape-able-but-resistant/inline-branch: range-check + 2-bit extract match EXACTLY (the unsigned `h` temp is required or `>>` becomes asr). Only the final `0202e234()==0` guard inlines vs orig `beq .L_6c`. 1-insn miss (116 vs 120).
 *   confidence: med
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern char data_ov002_022ce288[];
extern int  func_0202e234(int h);
int func_ov002_0220dfc8(int unused, struct Ov002Self *self) {
    unsigned int k, h;
    if (*(int *)((char *)data_ov002_022ce288 + 0x484) + 1 < 4) return 0;
    k = self->b1_5;
    if (k >= 5 && k <= 10) {
        h = *(u16 *)((char *)self + 2);
        return ((h << 18) >> 30) == 0;
    }
    if (k < 5) goto one;
    if (func_0202e234(*(u16 *)self) != 0) goto one;
    return 0;
one:
    return 1;
}
