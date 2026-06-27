/* CAMPAIGN-PREP candidate for func_02291b44 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: (1-bit0) & bit0 mul-index reads; tail offset o CSE'd across two ldr; unsigned >= compares (movcs)
 *   risk:       Two PREDICATED ret-1 exits (movcs r0,#1; ldmcsia) — likely steerable since cmp+movcs is the natural form here. reshape-able. Secondary: the ||-guard short-circuit order (021c3ae4 then 021bbd14) must keep the bne .L_200 fall-through; if mwcc inverts the test the call order flips.
 *   confidence: med
 */
/* func_ov002_02291b44 (ov002, class D, MED). mul-table index + bitfield, guard chain leaf.
 * a = *(int*)(cf180 + (1 - self->f2.bit0)*0x868); if ((unsigned)a >= 5) return 1;
 * if func_021c3ae4(self->f2.bit0, 0x14f0) == 0 &&
 *    func_021bbd14(self->f2.bit0, 0x14f0) == 0) return 0;   (else fall to tail)
 * o = (self->f2.bit0 & 1)*0x868;
 * if (*(int*)(cf16c + o) > 0x3e8 && (unsigned)*(int*)(cf180 + o) >= 0xf) return 1;
 * return 0. NOTE first read uses (1-bit0); tail uses bit0; o is CSE'd (one mul, two ldr). */
typedef unsigned short u16;
struct F2 { u16 bit0 : 1; u16 rest : 15; };
struct Self { u16 pad0; struct F2 f2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_ov002_021c3ae4(unsigned int bit, unsigned int code);
extern int  func_ov002_021bbd14(unsigned int bit, unsigned int code);

int func_ov002_02291b44(struct Self *self) {
    int a;
    int o;
    a = *(int *)(data_ov002_022cf180 + ((1 - self->f2.bit0) & 1) * 0x868);
    if ((unsigned int)a >= 5)
        return 1;
    if (func_ov002_021c3ae4(self->f2.bit0, 0x14f0) == 0) {
        if (func_ov002_021bbd14(self->f2.bit0, 0x14f0) == 0)
            return 0;
    }
    o = (self->f2.bit0 & 1) * 0x868;
    if (*(int *)(data_ov002_022cf16c + o) > 0x3e8) {
        if ((unsigned int)*(int *)(data_ov002_022cf180 + o) >= 0xf)
            return 1;
    }
    return 0;
}
