/* CAMPAIGN-PREP candidate for func_02203474 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla per-player base; :13/:1 holder twice; u16 f8; predicated && chain in loop
 *   risk:       Orig maintains TWO induction values (a slot-ptr r3 for the .id loop-test and base+i*0x14 r2 for the body) plus the predicated `addne;ldrneh;cmpne;ldrne;...` lowering of the 3-way &&. mwcc may emit one induction var / different predication. permuter-class (loop induction + predication scheduling, not steerable).
 *   confidence: low
 */
/* func_ov002_02203474 (cls C/D): scan 5 per-player slots, predicated body.
 * base = data_022cf16c + player*0x868; slot array at base+0x30, stride 0x14.
 * Per slot i in 0..4: if (id!=0 && f8!=0 && player != b13) return 1; else 0.
 * id = holder bits[0..12] (:13), b13 = holder bit13 (:1) -> same word read
 * twice; f8 = u16 at +8 of the slot record. */

typedef unsigned short u16;

struct W2 { u16 bit0 : 1; u16 rest : 15; };
struct F02203474_Self { u16 f0; struct W2 f2; };
struct Slot6 { unsigned int id : 13; unsigned int b13 : 1; unsigned int _hi : 18;
               char _4[4]; u16 f8; char _a[10]; };

extern char data_ov002_022cf16c[];

int func_ov002_02203474(struct F02203474_Self *self) {
    int player = self->f2.bit0;
    struct Slot6 *slots = (struct Slot6 *)(data_ov002_022cf16c + player * 0x868 + 0x30);
    int i;
    for (i = 0; i <= 4; i++) {
        if (slots[i].id != 0 && slots[i].f8 != 0 && player != (int)slots[i].b13)
            return 1;
    }
    return 0;
}
