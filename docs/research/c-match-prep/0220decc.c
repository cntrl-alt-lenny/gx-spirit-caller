/* CAMPAIGN-PREP candidate for func_0220decc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: ALL guards goto one shared `return 0`; parity-mla on cf1a4; fused cmp r0,bf>>31
 *   risk:       struct-guessed: codegen is byte-EXACT (140B) incl fused `cmp r0,r3,lsr#31`/`ldreq`/`mla`, but cd3f4[1]/[2]/[8] int-offsets and 021b90a8(sel,row) args are inferred — confirm the cd3f4 table layout.
 *   confidence: high
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern int  data_ov002_022cd3f4[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021b90a8(int player, int row);
int func_ov002_0220decc(struct Ov002Self *self) {
    int sel, row; char *base;
    if (self->b6_11 != 0x12) goto zero;
    if (*(int *)((char *)self + 0x14) == 0) goto zero;
    sel = data_ov002_022cd3f4[1];
    row = data_ov002_022cd3f4[8];
    if (!(sel == self->b0 && data_ov002_022cd3f4[2] == 0)) goto zero;
    base = data_ov002_022cf1a4 + (sel & 1) * 0x868;
    if (*(u16 *)(base + row * 0x14) == 0) goto zero;
    if (func_ov002_021b90a8(sel, row) != 0) return 1;
zero:
    return 0;
}
