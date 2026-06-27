/* CAMPAIGN-PREP candidate for func_0229282c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f12 :2 bitfield (bic+orr=set3, bic=clear0); store-order set/call/clear
 *   risk:       Return-value preservation: orig keeps func_02257b48 result in r0 across the trailing 'card->f12=0' store. If mwcc spills r to a callee-saved reg or reorders the clear before the call, bytes diverge. reshape-able
 *   confidence: med
 */
/* func_ov002_0229282c (ov002, D) - bitfield test then RMW field store-order around a call.
 * card@r0(r4), arg1@r1(r5).  attr=ushort@+2; f12 = bits[13:12] = :2 @ offset12.
 * if (f12 != 0) return 1.  (mov lsl#0x12; movs lsr#0x1e; bne)
 * if (!func_02292754(card)) return 0.
 * SET f12=3: bic #0x3000; orr #0x3000; strh  (== card->f12 = 3).
 * r = func_02257b48(card, arg1);  CLEAR f12=0: bic #0x3000; strh  (after the call).
 * return r (preserved in r0 across the trailing clear). Store-order: set, call, clear. */
extern int func_ov002_02292754(struct Obj *);
extern int func_ov002_02257b48(struct Obj *, int);
struct Obj { unsigned short u0; unsigned short : 12, f12 : 2, : 2; };

int func_ov002_0229282c(struct Obj *card, int arg1) {
    int r;
    if (card->f12 != 0) return 1;
    if (!func_ov002_02292754(card)) return 0;
    card->f12 = 3;
    r = func_ov002_02257b48(card, arg1);
    card->f12 = 0;
    return r;
}
