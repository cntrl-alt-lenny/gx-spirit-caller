/* CAMPAIGN-PREP candidate for func_02256150 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     discriminant is a :4 bitfield (lsl#28;lsr#28, not &0xf); fall-through case groups; field4 is a second :4 bitfield; ==/>0 bool returns.
 *   risk:       orig holds one ldrh of f2 across switch + case 6/7 extract; modeling kind and field4 as separate bitfields may reload f2. Also jump-table-vs-cmp-chain. reshape-able (read f2 once) but the masked extract may then fold.
 *   confidence: med
 */
/* func_ov002_02256150: branch-table over the low nibble (:4) of self->f2.
 * case 2 => f0 == 0x1598; cases 6/7 => bit4 (low bit of the next :4 field);
 * cases 10/11 => 1; all else => 0. */

typedef unsigned short u16;

struct s_02256150 {
    u16 f0;
    u16 kind : 4;
    u16 field4 : 4;
};

int func_ov002_02256150(struct s_02256150 *self) {
    switch (self->kind) {
    case 2:
        return self->f0 == 0x1598;
    case 6:
    case 7:
        return (self->field4 & 1) > 0;
    case 10:
    case 11:
        return 1;
    default:
        return 0;
    }
}
