/* CAMPAIGN-PREP candidate for func_021cd190 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: variable mask 0xffffffff>>(32-w) for mvn;lsr; bitfield insert by mask+orr.
 *   risk:       reshape-able: (id-1)*0x72 mul-then-ldrb ordering vs id-1 reuse for second ldrb; mwcc may recompute id-1 instead of holding ip across both indexes.
 *   confidence: med
 */
/* func_ov011_021cd190 (ov011, class D): variable-width bitfield insert into
 * the ov011 state word at data_ov011_021d4000+0x2a8.
 *   width = data_021d334a[(id-1)*0x72]   (table row stride 0x72)
 *   shift = data_021d35c8[id-1] - 1
 *   v     = (func_0201b770() >> shift) & ((1u<<width)-1)   [variable mask]
 * Field occupies mask ~0xfe01ffff (bits 17..24): store ((v<<24)>>7) i.e. v<<17.
 * The variable mask is written as 0xffffffffu >> (32-width) to force the
 * orig's mvn r3,#0 ; mov r2,r3,lsr r2 pair (a plain (1<<w)-1 would not). */
extern unsigned int func_0201b770(void);
extern unsigned char data_ov011_021d334a[];
extern unsigned char data_ov011_021d35c8[];
extern unsigned char data_ov011_021d4000[];

void func_ov011_021cd190(int id) {
    unsigned int v;
    unsigned int width;
    unsigned int shift;
    unsigned int *p;

    v = func_0201b770();
    width = data_ov011_021d334a[(id - 1) * 0x72];
    shift = data_ov011_021d35c8[id - 1] - 1;
    v = (v >> shift) & (0xffffffffu >> (0x20 - width));

    p = (unsigned int *)(data_ov011_021d4000 + 0x2a8);
    *p = (*p & 0xfe01ffff) | ((v << 0x18) >> 0x7);
}
