/* CAMPAIGN-PREP candidate for func_02202f78 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (u16)(k-8)<=1 range; w-bitfield struct for bits9/10/14/15; CSE products; return ?2:0
 *   risk:       at the bl orig sets up NO args (r0=self only; r1/r2 are stale cf1a2/cf1a4 pointers) — mwcc will reload player/idx for the call, adding setup the orig lacks. permuter-class / struct-guessed (w bit layout inferred).
 *   confidence: low
 */
/* func_ov002_02202f78 (cls D, big): self->b6 in {8,9} via (u16)(b6-8)<=1; w=self->f14;
 * gates on w bit14 set, w bit15 clear, w bit9 != self->b0; player=(w>>9)&1, idx=(w>>10)&0xf;
 * require subrow.f30 (:13), cf1a2[player][idx](u16) set, cf1a4[player][idx](u16) clear,
 * then func_021c1ef0 ? 2 : 0. (w>>9)&1 reuses the masked-product r3 across all three tables. */
typedef unsigned short u16;
struct self_t { u16 f0; u16 b0 : 1; u16 :5; u16 b6 : 6; };
struct w_t { unsigned int :9; unsigned int b9 : 1; unsigned int b10 : 4; unsigned int b14 : 1; unsigned int b15 : 1; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int :19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1ef0(struct self_t *self, int player, int idx);
int func_ov002_02202f78(struct self_t *self) {
    int kind = self->b6;
    struct w_t *w;
    int player;
    int idx;
    if ((u16)(kind - 8) > 1)
        return 0;
    w = (struct w_t *)((char *)self + 0x14);
    player = w->b9;
    idx = w->b10;
    if (w->b14 == 0)
        return 0;
    if (w->b15 != 0)
        return 0;
    if (player == self->b0)
        return 0;
    if (((struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 0x14))->f30 == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + (player & 1) * 0x868 + idx * 0x14) == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 0x14) != 0)
        return 0;
    return func_ov002_021c1ef0(self, player, idx) != 0 ? 2 : 0;
}
