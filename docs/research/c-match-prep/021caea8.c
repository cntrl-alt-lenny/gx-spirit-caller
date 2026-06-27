/* CAMPAIGN-PREP candidate for func_021caea8 (ov012, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: obj=tbl[idx]; (u16)a1 guard; 8-word stack block in asm order; teardown if a1==-1
 *   risk:       struct-guessed + reshape-able: stack-arg block layout/order (stmib + scattered str of r3=0) is fragile; if mwcc reorders the 8 stores or doesn't reuse the zero reg it diverges. Arg count of func_0201e964 inferred.
 *   confidence: low
 */
/* func_ov012_021caea8 (ov012, class D): heavy stack-arg marshalling wrapper.
 * obj = data_ov012_021cc7a0[idx]; if (a1 != -1) func_0201e800(obj,(u16)a1);
 * then build an 8-stack-word arg block and call func_0201e964(1, obj->f2c,
 * s0, 0, /stack/ 0,0,a3,a2,0,0,s1,0); if a1!=-1 return; else two teardown calls.
 * recipe: emit the stack stores in asm order; r3=0 reused as the zero filler;
 * the [sp,#0x18]=s1 store comes from a reload of incoming stack arg s1. */

extern void *data_ov012_021cc7a0[];
extern void func_0201e800(void *obj, int n);
extern void func_0201e964(int a, int b, int c, int d, int s0, int s1, int s2, int s3, int s4, int s5, int s6, int s7);
extern void func_0201e7ec(void *obj, int n);
extern void func_0207fd28(void *obj, int n);

typedef struct { char _pad[0x2c]; int f2c; } ov012_obj;

int func_ov012_021caea8(int idx, int a1, int a2, int a3, int s0, int s1) {
    ov012_obj *obj = (ov012_obj *)data_ov012_021cc7a0[idx];
    if (a1 != -1) {
        func_0201e800(obj, (unsigned short)a1);
    }
    func_0201e964(1, obj->f2c, s0, 0,
                  0, 0, a3, a2, 0, 0, s1, 0);
    if (a1 != -1) {
        return 0;
    }
    func_0201e7ec(obj, 1);
    func_0207fd28(obj, 0x1000);
    return 0;
}
