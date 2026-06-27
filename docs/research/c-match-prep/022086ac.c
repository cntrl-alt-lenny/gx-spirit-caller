/* CAMPAIGN-PREP candidate for func_022086ac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag0 bound for call1, fresh re-read for call2 (orig re-ldrh); k5 :5 bitfield; signed <2
 *   risk:       flag0/k5 both from one ldrh into call1 args: mwcc may reorder which of r3=attr<<31 vs r2=attr<<0x1a it computes first. permuter-class (operand scheduling of the two sub-extracts).
 *   confidence: med
 */
/* func_ov002_022086ac (ov002, D) — bitfield call + global guard + (1-flag0) call.
 *   attr@+2: flag0 :1 @bit0, k5 :5 @bit1.  u0=ushort@+0.
 *   r = func_021bb7f8(flag0, u0, k5)
 *   if(r < 2) return 2
 *   if(*(int*)(data_022d016c+0xcf8) == 0) return 2
 *   if(func_021bae7c(1-flag0, 0x178b, -1)) return 0
 *   return 2.
 * func_021bb7f8 args order r0=flag0,r1=u0,r2=k5; flag0 reloaded for 2nd call. */
struct Obj { unsigned short u0; unsigned short flag0 : 1, k5 : 5, : 10; };

extern char data_ov002_022d016c[];
extern int  func_ov002_021bb7f8(int, int, int);
extern int  func_ov002_021bae7c(int, int, int);

int func_ov002_022086ac(struct Obj *card) {
    int flag0 = card->flag0;
    if (func_ov002_021bb7f8(flag0, card->u0, card->k5) < 2) return 2;
    if (*(int *)(data_ov002_022d016c + 0xcf8) == 0) return 2;
    if (func_ov002_021bae7c(1 - card->flag0, 0x178b, -1)) return 0;
    return 2;
}
