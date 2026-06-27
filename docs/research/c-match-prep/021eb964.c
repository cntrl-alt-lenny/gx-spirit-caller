/* CAMPAIGN-PREP candidate for func_021eb964 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfield struct; mla base + separate mul idx*20, +0x30 add; two-call tail
 *   risk:       Same composite-fusion (orr-vs-add lsr#31 + extract order) as 021ea1b4; mla/mul index split must match (add r0,r1,#0x30; ldr [r0,r2]). permuter-class (compare).
 *   confidence: low
 */
/* func_ov002_021eb964: idx<5 -> 021b8fcc gate; f30:13 set (mla base + mul idx*20 + 0x30);
 * composite pair vs self->h4 field; 021c1ef0 ok else 0; then 021c2084(...,1). */
struct row { char _pad[0x30]; unsigned int f30 : 13; unsigned int fB : 1; unsigned int _m : 8; unsigned int fA : 8; unsigned int _hi : 2; };
struct self_hdr { char _p2[2]; unsigned short h2; unsigned short h4; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int player, int idx);
extern int func_ov002_021c1ef0(void *self, int player, int idx);
extern int func_ov002_021c2084(void *self, int player, int idx, int flag);
int func_ov002_021eb964(void *self, int player, int idx) {
    struct row *r;
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }
    r = (struct row *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (r->f30 == 0)
        return 0;
    if (((r->fA << 1) | r->fB) == (((struct self_hdr *)self)->h4 >> 6) & 0x1FF)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    return func_ov002_021c2084(self, player, idx, 1) != 0;
}
