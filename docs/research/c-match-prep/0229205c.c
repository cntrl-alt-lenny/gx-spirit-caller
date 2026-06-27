/* CAMPAIGN-PREP candidate for func_0229205c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: fld5b = :5 at bit6 (lsl#1a;lsr#1b); idx*0x14 via mul #0x14; mla bit0,0x868,cf1a2; signed >=0 tail
 *   risk:       struct-guessed: fld5b sits at bit 6 (lsl#0x1a then lsr#0x1b => (x<<26)>>27 = bits 6..10) — the :5 placement after bit0+:5 pad is inferred; confirm the f2 bitfield map. Also the idx*0x14 (mul, not mla-fused) must stay separate from the bit0*0x868 product. reshape-able if struct correct.
 *   confidence: low
 */
/* func_ov002_0229205c (ov002, class D, MED). bitfield lsl;lsr + mla index into table, boolean tail.
 * if func_02259f74(self->f2.bit0) == 0 return 0;
 * idx = self->f2.fld5b (:5 at bit 6 of f2, lsl#1a;lsr#1b);   sel = self->f2.bit0 & 1;
 * h = *(u16*)(cf1a2 + sel*0x868 + idx*0x14);    (mla bit0,0x868,cf1a2 then +idx*0x14 via mul r3,#0x14)
 * if (h != 0) return 0;
 * if func_0227d660(self->f2.bit0, 0) >= 0 return 1; else 0.
 * NOTE: cf1a2 base read once (ip); fld5b extracted from same ldrh as bit0. */
typedef unsigned short u16;
struct F2 { u16 bit0 : 1; u16 a5 : 5; u16 fld5b : 5; u16 rest : 5; };
struct Self { u16 pad0; struct F2 f2; };
extern char data_ov002_022cf1a2[];
extern int  func_ov002_02259f74(unsigned int bit);
extern int  func_ov002_0227d660(int bit, int y);

int func_ov002_0229205c(struct Self *self) {
    if (func_ov002_02259f74(self->f2.bit0) == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + (self->f2.bit0 & 1) * 0x868 + self->f2.fld5b * 0x14) != 0)
        return 0;
    if (func_ov002_0227d660(self->f2.bit0, 0) >= 0)
        return 1;
    return 0;
}
