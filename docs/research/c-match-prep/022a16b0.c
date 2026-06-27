/* CAMPAIGN-PREP candidate for func_022a16b0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :2 bitfield (bits[4:3]) &2 -> 0/1 via if; (f34*8)/2 signed; sub operand-order (const term first)
 *   risk:       struct-guessed+reshape-able: data_02104f4c layout (the :2 at bit3) and ObjA16 offsets inferred; if /2 loses signed round, write `(s->f34<<3)` to a signed temp then `/2`. operand order in final sub.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a16b0 (ov002, class D, MED tier).
 * UNVERIFIED. clean leaf: 2-bit bitfield extract + signed /2.
 *   recipe: early-return on f4==0xb; :2 bitfield (g.f4>>3)&3 then &2 test; (s->f34*8)/2 signed.
 */
typedef struct {
    char _pad00[0x4];
    int  f4;                 /* +0x04 */
    char _pad08[0x2c];
    int  f34;                /* +0x34 */
} ObjA16;

typedef struct {
    char _pad00[0x4];
    unsigned int lo3 : 3;    /* bits[2:0] */
    unsigned int b2  : 2;    /* bits[4:3] -> tested &2 */
} Glob4F;

extern Glob4F data_02104f4c;

int func_ov002_022a16b0(ObjA16 *s) {
    int x;
    if (s->f4 == 0xb) return 0;
    x = (data_02104f4c.b2 & 2) ? 0 : 1;
    return (x << 4) + 0x58 - (s->f34 << 3) / 2;
}
