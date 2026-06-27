/* CAMPAIGN-PREP candidate for func_02296d78 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counter (r4) declared first =0; dual-ptr loop slot+0x30 stride0x14, id:13 + f6@+0x36; count>=3
 *   risk:       permuter-class: predicated loop body (addne/ldrneh/cmpne/addne for the id!=0 && f6!=0 path) is schedule/predication-sensitive; ALSO first block `(c==0)?1:0` then `if(v<3)` reuses r4-zero (movne r0,r4) and is an always-false-looking guard — verify the guard semantics against intent
 *   confidence: low
 */
typedef unsigned short u16;

struct S02296d78 { u16 f0; u16 b0 : 1; u16 rest : 15; };
struct Slot02296d78 { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021bbf50(unsigned int v);
extern int func_ov002_02281760(struct S02296d78 *self, unsigned int v, unsigned int z);

int func_ov002_02296d78(struct S02296d78 *self) {
    int count = 0;
    int i;
    int v;
    char *row;
    v = (func_ov002_021bbf50(self->b0) == 0) ? 1 : 0;
    if (v < 3) return 0;
    if (func_ov002_02281760(self, 1 - self->b0, 0) != 0) return 1;
    row = data_ov002_022cf16c + ((1 - self->b0) & 1) * 0x868;
    for (i = 0; i < 5; i++) {
        if (((struct Slot02296d78 *)(row + 0x30 + i * 0x14))->id != 0 &&
            *(u16 *)(row + i * 0x14 + 0x36) != 0)
            count++;
    }
    return count >= 3;
}
