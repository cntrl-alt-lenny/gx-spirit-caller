/* CAMPAIGN-PREP candidate for func_02292d20 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     side=(1-flag0)&1 bank index; reloaded flag0; in-loop mla; &0x1fff
 *   risk:       The '&1' on the index (and r3,#1 after rsb) and per-iter flag0 reload/recompute of (1-flag0)*0x868 must reproduce. If mwcc drops &1 or hoists flag0, the mla index diverges. permuter-class
 *   confidence: med
 */
/* func_ov002_02292d20 (ov002, D) - bitfield mla bank-scan using OTHER side (1-flag0), tail-call.
 * obj@r0(r8), arg1@r1(r7).  flag0 = bit0 ushort@+2 (reloaded each iter).
 * side = 1-flag0 (rsb), masked &1 (and r3,#1).  bank = data_022cf16c + side*0x868.
 * scan i=0..4: w = *(int*)(bank + i*0x14 + 0x30); if (w & 0x1fff):
 *   if (func_021bc72c(flag0, side, i)) return 0.   (r0=flag0, r1=side, r2=i)
 * after loop: return func_02292bac(obj, arg1). */
extern char data_ov002_022cf16c[];
extern int  func_ov002_021bc72c(int, int, int);
extern int  func_ov002_02292bac(struct Obj *, int);
struct Obj { unsigned short u0; unsigned short flag0 : 1, : 15; };

int func_ov002_02292d20(struct Obj *obj, int arg1) {
    int i;
    for (i = 0; i < 5; i++) {
        int side = (1 - obj->flag0) & 1;
        if (*(int *)(data_ov002_022cf16c + side * 0x868 + i * 0x14 + 0x30) & 0x1fff) {
            if (func_ov002_021bc72c(obj->flag0, 1 - obj->flag0, i)) return 0;
        }
    }
    return func_ov002_02292bac(obj, arg1);
}
