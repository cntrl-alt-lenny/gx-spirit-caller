/* CAMPAIGN-PREP candidate for func_021f51dc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield-struct slot+f4 (asym shifts), player=bit0&1, -1 via fold
 *   risk:       permuter-class: instruction SCHEDULING only. Compiled at ov002 cflags: all ops match incl. the -1 = r2-0x15 fold, but mwcc batches the two muls where orig interleaves mul+fld5+add.
 *   confidence: med
 */
/* func_ov002_021f51dc: leaf bitfield + 0x868 2-D table lookup, compare a
 * recombined slot field against an f4 bitfield, then a parallel u16 guard. cls D.
 * Slot word and f4 are sliced with lsl;lsr pairs (asymmetric) => BITFIELD members
 * so mwcc emits lsl;lsr (not lsr;and).
 *   player = f2.bit0 & 1  (the &1 reproduces orig's redundant `and r1,r1,#1`)
 *   want = f4.want9 (9b @ bit6); key = slot.hi8 (8b @ bit22)*2 + slot.b13 (bit13)
 *   if (want != key) return -1; if (u16 @ cf1a4 != 0) return 1; else return -1; */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];   /* row table, 0x868/player */
extern char data_ov002_022cf1a4[];   /* parallel u16 sub-row table */

struct F021f51dc_F2 {
    u16 bit0 : 1;
    u16 fld5 : 5;
    u16 rest : 10;
};
struct F021f51dc_F4 {
    u16 lo6   : 6;
    u16 want9 : 9;
    u16 hi1   : 1;
};
struct F021f51dc {
    u16 pad0;
    struct F021f51dc_F2 f2;
    struct F021f51dc_F4 f4;
};

struct F021f51dc_Slot {
    unsigned int lo13 : 13;
    unsigned int b13  : 1;
    unsigned int mid8 : 8;   /* bits 14..21 */
    unsigned int hi8  : 8;   /* bits 22..29 */
    unsigned int top2 : 2;
};

int func_ov002_021f51dc(struct F021f51dc *self) {
    int player = self->f2.bit0 & 1;
    int idx = self->f2.fld5;
    struct F021f51dc_Slot *slot =
        (struct F021f51dc_Slot *)(data_ov002_022cf16c + player * 0x868 + idx * 20 + 0x30);
    int want = self->f4.want9;
    int key = slot->hi8 * 2 + slot->b13;
    if (want != key) return -1;
    if (*(u16 *)(data_ov002_022cf1a4 + player * 0x868 + idx * 20) != 0) return 1;
    return -1;
}
