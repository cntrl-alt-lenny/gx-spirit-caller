/* CAMPAIGN-PREP candidate for func_0220898c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     inline card->flag0 per call to force re-ldrh; f4 :9 bitfield; signed <0; flag0*0x868 table
 *   risk:       func_021b99b4 result is signed (movlt) — keep int return so cmp uses lt not eq. reshape-able (signed return type), low residual permuter-class risk on the final 2-call r2=t hold.
 *   confidence: med
 */
/* func_ov002_0220898c (ov002, D) — 5-call bitfield chain + table guard.
 *   flag0=attr bit0; f4=(u4>>6)&0x1ff (bit6,w9); u0=ushort@+0.
 *   if(!func_021ca698(flag0, flag0)) return 0
 *   if((int)func_021b99b4(flag0, f4) < 0) return 0          (signed: movlt)
 *   if(!func_021ca2b8(flag0)) return 0
 *   if(*(int*)(data_022cf17c + flag0*0x868) != 0) return 1
 *   t = func_0223f6c4(card)
 *   if(!func_022536e8(flag0, u0, t)) return 0
 *   return 1.
 * attr reloaded each use (orig re-ldrh per call). func_022536e8 args:
 * r0=flag0, r1=u0, r2=t (t computed before the u0/flag0 reload). */
struct Obj {
    unsigned short u0;                       /* +0x0 */
    unsigned short flag0 : 1, : 15;          /* +0x2 */
    unsigned short : 6, f4 : 9, : 1;         /* +0x4 */
};

extern char data_ov002_022cf17c[];
extern int  func_ov002_021ca698(int, int);
extern int  func_ov002_021b99b4(int, int);
extern int  func_ov002_021ca2b8(int);
extern int  func_ov002_0223f6c4(struct Obj *);
extern int  func_ov002_022536e8(int, int, int);

int func_ov002_0220898c(struct Obj *card) {
    int t;
    if (!func_ov002_021ca698(card->flag0, card->flag0)) return 0;
    if (func_ov002_021b99b4(card->flag0, card->f4) < 0) return 0;
    if (!func_ov002_021ca2b8(card->flag0)) return 0;
    if (*(int *)(data_ov002_022cf17c + card->flag0 * 0x868) != 0) return 1;
    t = func_ov002_0223f6c4(card);
    if (!func_ov002_022536e8(card->flag0, card->u0, t)) return 0;
    return 1;
}
