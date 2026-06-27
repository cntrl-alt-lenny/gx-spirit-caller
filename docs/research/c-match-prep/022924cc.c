/* CAMPAIGN-PREP candidate for func_022924cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :1 reloaded in loop; char[] bank +flag*0x868; &0x1fff->lsl;lsr
 *   risk:       In-loop mla recompute: orig reloads flag0 & recomputes flag0*0x868+base each iter (r4/r8 hoisted). If mwcc caches flag0 or hoists the mla, loop body diverges. permuter-class
 *   confidence: med
 */
/* func_ov002_022924cc (ov002, D) - bitfield mla bank-scan + tail guard chain.
 * obj@r0 (r7).  flag0 = bit0 of ushort@+2 (reloaded every use: ldrh in loop & after).
 * bank base = data_022cf16c + flag0*0x868 (mla, base/stride hoisted to r4/r8).
 * scan i=0..4: w = *(int*)(bank + i*0x14 + 0x30); field13 = w & 0x1fff (0x1fff not
 *   ARM-encodable -> lsl#19;lsr#19, matches movs lsl#0x13;lsr#0x13). if field13!=0:
 *   if (func_0228d95c(flag0, i)) return 1.
 * after loop: if (func_021bbf50(1-flag0) == 1) { if (func_02280980(flag0) < 0) return 1; }
 * return 0.  i*0x14 accumulates in r6 (induction); flag0 used as multiplier -> and #1. */
extern char data_ov002_022cf16c[];
extern int  func_ov002_0228d95c(int, int);
extern int  func_ov002_021bbf50(int);
extern int  func_ov002_02280980(int);
struct Obj { unsigned short u0; unsigned short flag0 : 1, : 15; };

int func_ov002_022924cc(struct Obj *obj) {
    int i;
    for (i = 0; i < 5; i++) {
        if (*(int *)(data_ov002_022cf16c + obj->flag0 * 0x868 + i * 0x14 + 0x30) & 0x1fff) {
            if (func_ov002_0228d95c(obj->flag0, i)) return 1;
        }
    }
    if (func_ov002_021bbf50(1 - obj->flag0) == 1) {
        if (func_ov002_02280980(obj->flag0) < 0) return 1;
    }
    return 0;
}
