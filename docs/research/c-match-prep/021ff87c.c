/* CAMPAIGN-PREP candidate for func_021ff87c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     b0/f1 bitfields; cmp (d016c+0xcec)==b0 folds >>31; mla (b0&1)*0x868 + f1*0x14; clamp>=2->2 via if
 *   risk:       reshape-able: the index is `mla lr,b0,0x868,cf1a4` PLUS `mul r3,f1,0x14` then `ldrh [r3,r1]` — two separate products combined as base+index. If mwcc fuses into one `mla` or reorders the *0x14, the addressing diverges. Final clamp movge/movlt#0 vs the `if(r>=2)return 2` form.
 *   confidence: med
 */
/* func_ov002_021ff87c (ov002, class C/D) — gate (d016c+0xcec)==bit0 && (d016c+0xcf8)==1; then
 * a per-player (bit0&1) 0x868 table (cf1a4) indexed by f1(bits1..5)*0x14, the u16 there must be
 * nonzero; then 021bc8c8(bit0)!=0; finally clamp 022577dc(self) to {0 if <2, 2 if >=2}. */
typedef unsigned short u16;

extern char data_ov002_022d016c[];   /* scalars +0xcec, +0xcf8 */
extern char data_ov002_022cf1a4[];   /* per-player table, *0x868/player */
extern int  func_ov002_021bc8c8(unsigned int bit0);
extern int  func_ov002_022577dc(void *self);

struct F021ff87c_F2 { u16 b0 : 1; u16 f1 : 5; u16 rest : 10; };
struct F021ff87c_Self { u16 pad0; struct F021ff87c_F2 f2; };

int func_ov002_021ff87c(struct F021ff87c_Self *self) {
    int r;
    if (*(int *)(data_ov002_022d016c + 0xcec) != self->f2.b0) return 0;
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 1) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (self->f2.b0 & 1) * 0x868 + self->f2.f1 * 0x14) == 0) return 0;
    if (func_ov002_021bc8c8(self->f2.b0) == 0) return 0;
    r = func_ov002_022577dc(self);
    if (r >= 2) return 2;
    return 0;
}
