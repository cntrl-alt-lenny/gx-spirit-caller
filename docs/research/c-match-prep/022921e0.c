/* CAMPAIGN-PREP candidate for func_022921e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 at +0x30 (lsl;lsr); +0x38 u16==0; mla bit0,0x868,cf16c inlined per use; loop i<5 (blt)
 *   risk:       reshape-able: held cf16c-base/0x868-const reg across the loop (ldr r4/r8 once) — the index is recomputed by mla each iter, so keeping math inline as written should reproduce it; if mwcc instead hoists rec into a loop-invariant temp the ldr count diverges. Secondary: predicated ret-1 (moveq;ldmeqia).
 *   confidence: med
 */
/* func_ov002_022921e0 (ov002, class D, MED). bitfield mla scan loop, clean accessor shape.
 * for i in 0..4 (cmp #5; blt): sel = self->f2.bit0 & 1;
 *   v = rec.f30 (:13 at +0x30) where rec = cf16c + sel*0x868 + i*0x14;
 *   if func_0202f9e8(v) == 0 continue;
 *   if *(u16*)(cf16c + sel*0x868 + i*0x14 + 0x38) == 0 return 1;
 * return 0. self->f2.bit0 re-read each access; index recomputed inline (mla bit0,0x868,cf16c +i*0x14). */
typedef unsigned short u16;
typedef unsigned int   u32;
struct F2 { u16 bit0 : 1; u16 rest : 15; };
struct Self { u16 pad0; struct F2 f2; };
struct Rec { u32 f30 : 13; };
extern char data_ov002_022cf16c[];
extern int  func_0202f9e8(int v);

int func_ov002_022921e0(struct Self *self) {
    int i;
    for (i = 0; i < 5; i++) {
        if (func_0202f9e8(((struct Rec *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + i * 0x14 + 0x30))->f30) == 0)
            continue;
        if (*(u16 *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + i * 0x14 + 0x38) == 0)
            return 1;
    }
    return 0;
}
