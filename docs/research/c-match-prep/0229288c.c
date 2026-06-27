/* CAMPAIGN-PREP candidate for func_0229288c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     char[] bank +flag*0x868; &0x1fff==0x10f4 (shift-fused cmp, ldr literal)
 *   risk:       Mask-compare codegen: orig fuses the lsr#0x13 mask into 'cmp r2, r3,lsr#0x13' (one shifted-cmp). mwcc may instead materialize the masked value (mov lsl;lsr) then plain cmp. reshape-able/permuter-class
 *   confidence: med
 */
/* func_ov002_0229288c (ov002, D) - mla flag-index, field13 == const compare, boolean tail.
 * flag0 = bit0 ushort@+2.  w = *(int*)(data_022cf16c + flag0*0x868 + 0xf8).
 * f13 = w & 0x1fff (orig: load via lsl#0x13 then cmp r2, r3,lsr#0x13 with r2=0x10f4).
 * if (f13 == 0x10f4) return 1;  (0x10f4 not ARM-encodable -> ldr literal)
 * return func_022927d0(card). */
extern char data_ov002_022cf16c[];
extern int  func_ov002_022927d0(struct Obj *);
struct Obj { unsigned short u0; unsigned short flag0 : 1, : 15; };

int func_ov002_0229288c(struct Obj *card) {
    if ((*(int *)(data_ov002_022cf16c + card->flag0 * 0x868 + 0xf8) & 0x1fff) == 0x10f4)
        return 1;
    return func_ov002_022927d0(card);
}
