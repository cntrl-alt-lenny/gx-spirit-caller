/* CAMPAIGN-PREP candidate for func_02291d10 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     entry count cf178+0; loop +0x120 stride-4 :13; reload count cf16c+0xc; do-while unsigned; predicated return
 *   risk:       direct structural twin of func_02292dac which shipped as whole-function .s for being reg-alloc-walled: the held base reg (b0*0x868, r2) carried into the first iter then recomputed at the back-edge, plus the predicated 'return 1', resist C reg-alloc. permuter-class / .s-escape expected.
 *   confidence: low
 */
/* func_ov002_02291d10: bitfield mul-index scan loop, single call (cls C).
 * if func_02291160(self)==0 return 0. count = *(int*)(cf178 + (bit0&1)*0x868)
 * (entry guard, field +0). i=0; if count!=0 do: id = slot.id from
 * cf16c + (bit0&1)*0x868 + i*4 + 0x120 (:13); if func_0202e310(id)!=0
 * return 1; i++; reload count from cf16c + (bit0&1)*0x868 + 0xc; while
 * (unsigned)i < count. NOTE entry-count source (cf178+0) differs from the
 * back-edge count source (cf16c+0xc) — two distinct reads, kept explicit.
 * Twin of func_02292dac which SHIPPED AS .s (reg-alloc wall). */
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
struct S { u16 f0; u16 bit0 : 1; u16 rest : 15; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int  func_ov002_02291160(struct S *self);
extern int  func_0202e310(int id);

int func_ov002_02291d10(struct S *self) {
    int i;
    int count;
    unsigned int id;
    if (func_ov002_02291160(self) == 0)
        return 0;
    count = *(int *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868);
    i = 0;
    if (count != 0) {
        do {
            id = ((struct Ov002Slot *)(data_ov002_022cf16c +
                  (self->bit0 & 1) * 0x868 + i * 4 + 0x120))->id;
            if (func_0202e310(id) != 0)
                return 1;
            i++;
            count = *(int *)(data_ov002_022cf16c +
                    (self->bit0 & 1) * 0x868 + 0xc);
        } while ((unsigned int)i < (unsigned int)count);
    }
    return 0;
}
