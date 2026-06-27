/* CAMPAIGN-PREP candidate for func_0220df58 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D parity-select cf17c; count-guard +1<4 signed; `(unsigned)v>=2` value-map (movcs/movcc)
 *   risk:       reshape-able-but-resistant/inline-branch: parity-select + `v>=2` (movhs/movlo) match EXACTLY; only the `0220dd34()==0` guard is inline (`moveq#0;popeq`) vs orig `beq .L`. 1-insn miss; goto did not force the branch (single-use label inlines).
 *   confidence: med
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern char data_ov002_022ce288[];
extern int  data_ov002_022cf17c[];
extern int  func_ov002_0220dd34(void *self, int arg1);
int func_ov002_0220df58(struct Ov002Self *self, int arg1) {
    int n; unsigned int v;
    n = *(int *)((char *)data_ov002_022ce288 + 0x484) + 1;
    if (n < 4) return 0;
    if (func_ov002_0220dd34(self, arg1) == 0) return 0;
    v = *(unsigned int *)((char *)data_ov002_022cf17c + (self->b0 & 1) * 0x868);
    return v >= 2;
}
