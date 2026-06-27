/* CAMPAIGN-PREP candidate for func_0220ba94 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: &1 discriminant; mla disc*0x868+base, separate row*0x14; u16 table load; le->mov#1
 *   risk:       reshape-able/struct-guessed: 021c84e0 modeled void so no extra r0 setup (orig leaves leftover g->f4 in r0). mla folds disc*0x868 with base; row*0x14 separate mul -- if mwcc fuses both into one mla order flips.
 *   confidence: med
 */
/* func_ov002_0220ba94 (ov002, class D, MED) — batch p_0027.
 * Global g=data_022cd3f4: if g->f8!=0 ret 0; disc=g->f4&1; row=g->f20;
 * table u16 at data_022cf1a4 + disc*0x868 + row*0x14 must be !=0; ret 021c84e0()<=3. */
typedef unsigned short u16;

struct G022cd3f4 { int f0; int f4; int f8; unsigned char _pad[0x14]; int f20; }; /* +4,+8,+0x20 */

extern struct G022cd3f4 data_ov002_022cd3f4;
extern unsigned char data_ov002_022cf1a4[];   /* table base */
extern int func_ov002_021c84e0(void);

int func_ov002_0220ba94(void) {
    int disc, row;
    if (data_ov002_022cd3f4.f8 != 0) return 0;
    disc = data_ov002_022cd3f4.f4 & 1;
    row = data_ov002_022cd3f4.f20;
    if (*(u16 *)(data_ov002_022cf1a4 + disc * 0x868 + row * 0x14) == 0) return 0;
    return func_ov002_021c84e0() <= 3 ? 1 : 0;
}
