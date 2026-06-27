/* CAMPAIGN-PREP candidate for func_022188b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ce288[0x5a8] state dispatch; per-player 0x868+f5*0x14 index; cap clamp via unsigned movcs; mla two-table
 *   risk:       permuter-class reg-alloc (VERIFIED near-miss vs shipped .s): orig prologue reserves {r3,r4,r5} and emits redundant `and r4,bit0,#1`/`and r5,(1-bit0),#1` into TWO regs before mla/mul; mwcc -O4 elides the masks and uses 2 scratch regs. C reshape won't restore the dual-and/3-reg colouring.
 *   confidence: low
 */
typedef unsigned short u16;

struct Self022188b4 { u16 id; u16 b0 : 1; u16 f5 : 5; };

extern char data_ov002_022ce288[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf1a8[];
extern void func_ov002_021e2d94(int player, int f5, int a, int b);
extern void func_ov002_0226ad5c(int player, int v, int a, int b);

int func_ov002_022188b4(struct Self022188b4 *self) {
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x7f) {
        int v, cap;
        v = *(int *)(data_ov002_022cf1a8 + self->b0 * 0x868 + self->f5 * 0x14) + 1;
        cap = *(int *)(data_ov002_022cf178 + (1 - self->b0) * 0x868);
        if ((unsigned int)v >= (unsigned int)cap) v = cap;
        func_ov002_0226ad5c(1 - self->b0, v, 0, 1);
        return 0;
    }
    if (state == 0x80) {
        func_ov002_021e2d94(self->b0, self->f5, 5, 0);
        return 0x7f;
    }
    return 0;
}
