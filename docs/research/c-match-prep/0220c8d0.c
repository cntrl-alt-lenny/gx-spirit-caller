/* CAMPAIGN-PREP candidate for func_0220c8d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield self+2 (b0:1,row:5); bind player*0x868 base reused across two strided tables
 *   risk:       permuter-class: bound base reg. Verified-compiled identical EXCEPT orig holds idx*0x868 in callee-saved r4 (saves r4); mwcc binds it in ip (saves r3). Reg-alloc choice, no call forces callee-save.
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int   u32;

/* self+2 halfword: bit0 player, bits[1:5] a 5-bit row index. */
struct Self8d0 {
    u16 f0;
    u16 b0  : 1;    /* [0]   player (lsl#31;lsr#31)   */
    u16 row : 5;    /* [1:5] row index (lsl#26;lsr#27)*/
    u16     : 10;
};

extern char data_ov002_022cf288[];   /* per-player state, word at +0 [_LIT1] */
extern char data_ov002_022cf1a2[];   /* per-player stride-0x14 halfword tbl [_LIT2] */
extern int  func_ov002_021ff320(void);

int func_ov002_0220c8d0(struct Self8d0 *self) {
    int player = self->b0 & 1;
    int base   = player * 0x868;          /* held in r4 across both reads */
    if ((*(u32 *)(data_ov002_022cf288 + base) >> 0x13) & 1)   /* bit19 */
        return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + base + self->row * 0x14) != 0)
        return 0;
    return func_ov002_021ff320();
}
