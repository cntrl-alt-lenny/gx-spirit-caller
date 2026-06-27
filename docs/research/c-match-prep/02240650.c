/* CAMPAIGN-PREP candidate for func_02240650 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player mla base; multiple raw asymmetric shift extracts; tail-call else-branch
 *   risk:       mla folds `player*0x868 + cf16c`; the separate `mul id*20` then `add ..#0x30` ordering and the f4 vs rec field widths are bitfield-vs-shift sensitive. reshape-able (already raw shifts; mainly operand/decl order).
 *   confidence: med
 */
/* func_ov002_02240650: read f2 (player bit0 + a 5-bit id) and f4, look up the
 * per-player record, compare an f4-derived field against a record-derived value;
 * if unequal return 1, else tail-call 0223f684. */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Ent02240650 { u16 f0; u16 f2; u16 f4; };

extern char data_ov002_022cf16c[];
extern int  func_ov002_0223f684(void);

int func_ov002_02240650(struct Ent02240650 *self) {
    int player = ((unsigned)((u16)self->f2 << 31) >> 31) & 1;
    int id     = (unsigned)((u16)self->f2 << 26) >> 27;
    int rec    = *(int *)(data_ov002_022cf16c + player * 0x868 + id * 20 + 0x30);
    int lhs    = (unsigned)((u16)self->f4 << 17) >> 23;
    int rhs    = ((unsigned)((u16)rec << 2) >> 24) * 2 + ((unsigned)((u16)rec << 18) >> 31);
    if (lhs != rhs) return 1;
    return func_ov002_0223f684();
}
