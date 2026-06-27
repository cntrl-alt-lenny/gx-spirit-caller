/* CAMPAIGN-PREP candidate for func_0220cc98 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     goto-shared-fail; a!=self->b0 folds b0 as cmp lsr#31; bind plyoff/rowoff reused across two tables
 *   risk:       reshape-able (applied): goto-fail + b0-on-right fold. Verified-compiled byte-identical (cmp r5,r1,lsr#31 folded; all early ret-0 branch to .L_2e8). Residual: cd3f4 +4/+8/+0x20 offsets struct-guessed.
 *   confidence: high
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct SelfCc98 {
    u16 f0;
    u16 b0   : 1;   /* [0]    player (lsl#31;lsr#31)        */
    u16      : 5;
    u16 kind : 6;   /* [6:11] discriminant (lsl#20;lsr#26) */
    u16      : 4;
};

extern char data_ov002_022cd3f4[];   /* state block: +4,+8,+0x20 ints [_LIT0] */
extern char data_ov002_022cf1a2[];   /* per-player stride-0x14 halfword tbl [_LIT2] */
extern char data_ov002_022cf1a4[];   /* per-player stride-0x14 halfword tbl [_LIT3] */

extern int func_ov002_021b9ecc(int a, int b);
extern int func_0202ed90(int x);

int func_ov002_0220cc98(struct SelfCc98 *self) {
    int a;        /* cd3f4+4  (r5) */
    int b;        /* cd3f4+0x20 (r4) */
    int rowoff;   /* b*0x14 (r2, reused) */
    int plyoff;   /* (a&1)*0x868 (r3, reused) */
    /* every failure shares one `return 0` (.L_2e8) - goto lever. */
    if (self->kind != 0x12)
        goto fail;
    a = *(int *)(data_ov002_022cd3f4 + 4);
    b = *(int *)(data_ov002_022cd3f4 + 0x20);
    if (a != self->b0 || *(int *)(data_ov002_022cd3f4 + 8) != 0)
        goto fail;
    if (func_0202ed90(func_ov002_021b9ecc(a, b)) == 0)
        goto fail;
    plyoff = (a & 1) * 0x868;
    rowoff = b * 0x14;
    if (*(u16 *)(data_ov002_022cf1a2 + plyoff + rowoff) != 0)
        goto fail;
    if (*(u16 *)(data_ov002_022cf1a4 + plyoff + rowoff) != 0)
        return 1;
fail:
    return 0;
}
