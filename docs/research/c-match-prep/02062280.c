/* CAMPAIGN-PREP candidate for func_02062280 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: ldrh u16 field4, arg shuffle (f8,f0,f4,a1,a2 w/ a2 on stack), store +0x88.
 *   risk:       reshape-able: orig spills a2 to [sp] then loads fields into r2(ldrh)/r0/r1 in that order; a 5-arg call should reproduce the stack arg, but the field load order (r2<-+4, r0<-+8, r1<-+0) may differ from arg-eval order. struct-guessed +0x88.
 *   confidence: med
 */
/* func_02062280 — load struct fields, call, store result field (class D: store-order).
 * a0 struct: +0 = int field0, +4 = u16 field4, +8 = int field8, +0x88 = result slot.
 * callee gets (field8, field0, (u16)field4, a1, a2). On success store func_02055330()
 * into +0x88 and return 1; on zero return 0.
 */
typedef unsigned short u16;

typedef struct {
    int   f0;       /* +0x00 */
    u16   f4;       /* +0x04 */
    int   f8;       /* +0x08 */
    char  _pad[0x88 - 0x0c];
    int   result;   /* +0x88 */
} Obj;

extern int func_020645e0(int a, int b, int c, int d, int e);
extern int func_02055330(void);

int func_02062280(Obj *a0, int a1, int a2)
{
    if (func_020645e0(a0->f8, a0->f0, a0->f4, a1, a2) == 0)
        return 0;

    a0->result = func_02055330();
    return 1;
}
