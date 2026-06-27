/* CAMPAIGN-PREP candidate for func_02202d08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 bitfield with explicit &1 (mul index); unsigned load for lsr; tst==0 if-form
 *   risk:       return ((v>>20)&1)==0 should emit tst;moveq#1;movne#0 (matches); if mwcc instead does eor/and it diverges. reshape-able (else write !(...&1) or ternary).
 *   confidence: med
 */
/* func_ov002_02202d08 (cls D): require *(int*)(d016c+0xcf8)==2, then index
 * cf288 int-table by (self->b0 & 1)*0x868 (offset 0), test bit20, return its
 * complement. b0 is a 1-bit field; the explicit (b0 & 1) reproduces the and. */
typedef unsigned short u16;
struct self_t { u16 f0; u16 b0 : 1; };
extern char data_ov002_022d016c[];
extern char data_ov002_022cf288[];
int func_ov002_02202d08(struct self_t *self) {
    unsigned int v;
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 2)
        return 0;
    v = *(unsigned int *)(data_ov002_022cf288 + (self->b0 & 1) * 0x868);
    return ((v >> 0x14) & 1) == 0;
}
