/* CAMPAIGN-PREP candidate for func_021ed138 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind col/row20 reused across 2 tables; rsb-invert `1 - b0`; :13 bitfield
 *   risk:       two coupled: (1) `a != 1 - self->b0` must emit `rsb #1` not `eor #1`; (2) col/row20 must stay CSE'd in regs (separate mul) across cf16c+cf1a4. reshape-able: keep `1 - self->b0` literal and col/row20 as named locals.
 *   confidence: med
 */
/* func_ov002_021ed138 (ov002, class C). args r0=self, r1=a, r2=row.
 * (a&1)*0x868 (=col) and row*20 are HELD and reused across cf16c + cf1a4 (separate mul, not mla).
 * Inverted-owner compare: a != (1 - self->b0) via `rsb r0,r0,#1`. Tail compares == 4. */

struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021c1e44(struct self_t *self, int a, int row);
extern int  func_ov002_021c84e0(int a, int row);

int func_ov002_021ed138(struct self_t *self, int a, int row) {
    int col = (a & 1) * 0x868;
    int row20 = row * 20;
    struct subrow *sr = (struct subrow *)(data_ov002_022cf16c + col + row20);
    if (row >= 5)
        return 0;
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021c1e44(self, a, row) != 0)
        return 0;
    if (a != 1 - self->b0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + col + row20) == 0)
        return 0;
    return func_ov002_021c84e0(a, row) == 4;
}
