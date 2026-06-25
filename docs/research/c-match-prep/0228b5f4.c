/* CAMPAIGN-PREP candidate for func_0228b5f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: ==0/>0 split; bind self->f2 across 2 bitfield cmps; (v>>8)&0xff unpack
 *   risk:       orig keeps self->f2 in one reg across b0 and field5 compares; mwcc reload of [r4,#2] diverges. reshape-able: hoist f2 to a local, mask by hand.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0228b5f4 (ov002, class C, MED tier) — brief 0113.
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 * Canonical ov002 Card: b0:1 + field5:5 at +0x2, count:8 at +0x6 (see 0223e1b4.c, 02286fb8.c).
 *   recipe:     Class C: ==0 then >0 split returns; bind self->f2 across two bitfield cmps; (v>>8)&0xff unpack
 *   risk:       orig holds self f2 (ldrh [r4,#2]) in r2 across BOTH compares (b0 and field5); if mwcc reloads it 2x the second ldrh diverges. reshape-able: read f2 into one local and mask/shift by hand.
 *   confidence: med
 */
typedef unsigned short u16;

struct Card {
    u16 f0;
    u16 b0 : 1;       /* +0x2 bit0  (lsl#31;lsr#31) */
    u16 field5 : 5;   /* +0x2 bits1..5 (lsl#26;lsr#27) */
    u16 : 10;
    u16 _pad4;
    u16 count : 8;    /* +0x6 low byte (lsl#24;lsr#24) */
    u16 : 8;
};

extern int func_ov002_021b59b0(struct Card *p);
extern int func_ov002_0223de94(struct Card *p, int i);

int func_ov002_0228b5f4(struct Card *self, struct Card *other) {
    int n;
    if (other == 0) return 0;
    n = other->count;
    if (n == 0) return func_ov002_021b59b0(other) >= 4;
    if (n > 0) {
        int v = func_ov002_0223de94(other, 0);
        return (v & 0xff) == self->b0 && ((v >> 8) & 0xff) == self->field5;
    }
    return 0;
}
