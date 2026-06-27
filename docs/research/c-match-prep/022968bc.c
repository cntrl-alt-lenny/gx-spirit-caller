/* CAMPAIGN-PREP candidate for func_022968bc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf; b0:1 &1 index, id:13 bitfield (lsl19;lsr19) eq-const
 *   risk:       reshape-able: orig is `cmp const, id` (loads 0x175e first into r0); mwcc emits `cmp id,const` for `id==0x175e` — if cmp operand order diverges write `0x175e == ...->id`
 *   confidence: high
 */
typedef unsigned short u16;

struct S022968bc { u16 f0; u16 b0 : 1; u16 rest : 15; };
struct Ov002Slot { unsigned int id : 13; };

extern char data_ov002_022cf16c[];

int func_ov002_022968bc(struct S022968bc *self) {
    return ((struct Ov002Slot *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0xf8))->id == 0x175e;
}
