/* CAMPAIGN-PREP candidate for func_021ffb54 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f0 id-select (arg5,tag); kind!=0x23 cf288>>16 gate; bit0-arg guard chain
 *   risk:       reshape-able: the non-0x23 branch's `tst #1; movne r0,#0; ldmne` then fall-through to the SAME return-0 means both arms yield 0 — written as two returns; mwcc may predicate `movne`/branch differently. Also struct-guessed: cf288 +0 word and >>16 bit0 meaning.
 *   confidence: low
 */
/* func_ov002_021ffb54 (ov002, class C) — id-select branch, bitfield extracts, guard chain.
 * id=self.f0 selects (code,arg): 0x12d2 -> (0x14f9 lit, 4); 0x1710 -> (0x1710+0x20, 2);
 * else (0,0). If kind(bits6-11)!=0x23: gate on cf288[(bit0&1)*0x868]>>16 bit0 -> ret 0.
 * Else: 021ff2b8(self,bit0) >= sel-tag, 021ca2b8(bit0), 021ca3f0(bit0,arg5). */
typedef unsigned short u16;

struct F021ffb54_F2 {
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 kind : 6;
    u16 rest : 4;
};
struct F021ffb54_Self {
    u16 f0;
    struct F021ffb54_F2 f2;
};

extern char data_ov002_022cf288[];
extern int func_ov002_021ca2b8(int bit);
extern int func_ov002_021ca3f0(int bit, int arg);
extern int func_ov002_021ff2b8(struct F021ffb54_Self *self, int bit);

int func_ov002_021ffb54(struct F021ffb54_Self *self) {
    int arg5;
    int tag;
    if (self->f0 == 0x12d2) {
        arg5 = 0x14f9;
        tag = 4;
    } else if (self->f0 == 0x1710) {
        arg5 = 0x1710 + 0x20;
        tag = 2;
    } else {
        arg5 = 0;
        tag = 0;
    }
    if (self->f2.kind != 0x23) {
        if ((*(int *)(data_ov002_022cf288 + (self->f2.bit0 & 1) * 0x868) >> 0x10) & 1)
            return 0;
        return 0;
    }
    if (func_ov002_021ff2b8(self, self->f2.bit0) < tag) return 0;
    if (func_ov002_021ca2b8(self->f2.bit0) == 0) return 0;
    return func_ov002_021ca3f0(self->f2.bit0, arg5) != 0;
}
