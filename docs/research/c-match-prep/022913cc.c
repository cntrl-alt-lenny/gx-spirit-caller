/* CAMPAIGN-PREP candidate for func_022913cc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1 bitfield read once; explicit (b&1)/((1-b)&1) masks; me indexed first; signed < compare
 *   risk:       orig emits redundant and r,#1 on BOTH indices (and ip,(1-b),#1); a sibling (022922c0) proves (self->bit0 & 1) keeps the 'and', but mwcc may still drop the mask on the already-0/1 bitfield value, dropping one 'and'. reshape-able via the explicit &1; the me-first load order is decl-order steered.
 *   confidence: med
 */
/* func_ov002_022913cc: dual mul-table index, bit0 bitfield, compare leaf
 * (cls C, no frame). b = self->bit0 (1-bit field, lsl#31;lsr#31). me =
 * *(int*)(cf16c + (b&1)*0x868); other = *(int*)(cf16c + ((1-b)&1)*0x868)
 * (both field +0). return other < me + 0x1f4. The orig reads the u16 once,
 * derives b and 1-b, masks each with &1, computes b*0x868 FIRST (me loaded
 * first), then (1-b)*0x868. Keep the (b&1)/((1-b)&1) masks explicit. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0 : 1; u16 rest : 15; };
extern char data_ov002_022cf16c[];

int func_ov002_022913cc(struct S *self) {
    int b = self->bit0;
    int me    = *(int *)(data_ov002_022cf16c + (b & 1) * 0x868);
    int other = *(int *)(data_ov002_022cf16c + ((1 - b) & 1) * 0x868);
    return other < me + 0x1f4;
}
