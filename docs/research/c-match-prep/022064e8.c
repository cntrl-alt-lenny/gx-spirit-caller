/* CAMPAIGN-PREP candidate for func_022064e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     && short-circuit chain -> return 2; :2 tail t?0:3 uses movs+moveq/movne; :1 vs global guard.
 *   risk:       reshape-able (operand-order): asm 'cmp ip, r2,lsr#31' folds bit0 as the shifted 2nd operand. If mwcc flips, swap to 'p->b0 == ...fcec'.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022064e8 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft.
 * asm: r4=arg; if(data_022d016c.fcec == field@+2 bit0(:1)) and 021ff320()!=0
 *        and 022577dc(arg)!=0  -> return 2.
 *      else (.L_40): t=(field@+2 >>12)&3 (:2 @bit12); return t? 0 : 3.
 * Global held in reg (ldr [.,#0xcec]); guard cmp is (global == bit0). */
typedef unsigned short u16;

struct Ent64e8 { u16 _0; u16 b0 : 1; u16 _1 : 11; u16 f12 : 2; u16 _14 : 2; };
struct G016c   { char _a[3308]; int fcec; };   /* fcec @ 0xcec */

extern struct G016c data_ov002_022d016c;
extern int func_ov002_021ff320(void);
extern int func_ov002_022577dc(struct Ent64e8 *p);

int func_ov002_022064e8(struct Ent64e8 *p) {
    if (data_ov002_022d016c.fcec == p->b0 &&
        func_ov002_021ff320() != 0 &&
        func_ov002_022577dc(p) != 0)
        return 2;
    return p->f12 ? 0 : 3;
}
