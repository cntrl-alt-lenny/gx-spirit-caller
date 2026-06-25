/* CAMPAIGN-PREP candidate for func_02067560 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     a=8 store first; &b,&a as 5th/6th args; do/while on func_02055000; 0xff/-1 hoisted
 *   risk:       constants r8=data,r7=0xff,r5=-1 are hoisted into callee-saved regs across the loop; mwcc's exact callee-saved assignment (r5/r7/r8 vs others) and stack-slot order for a/b is a coin-flip. permuter-class (callee-saved allocation) / struct-guessed on +0xc4.
 *   confidence: med
 */
/* func_02067560 - main - class C
 * do/while with 6-arg call (2 stack ptrs), hoisted invariant consts
 * _LIT0 = data_0219ebc4 (byte buf); a(=8) and b are stack out-params
 */
typedef struct { int field_0; /* +0 */ unsigned char _pad[0xc0]; int field_c4; /* +0xc4 */ } Thing;

extern unsigned char data_0219ebc4[];
extern int  func_02055000(int h);
extern int  func_02054d14(int h, unsigned char *buf, int hi, int lo, int *b, int *a);
extern void func_0206627c(Thing *p, unsigned char *buf, int idx, int *b);

void func_02067560(Thing *p)
{
    int b;
    int a;
    int idx;

    a = 8;
    if (p->field_c4 == 0)
        return;
    if (func_02055000(p->field_0) == 0)
        return;
    do {
        idx = func_02054d14(p->field_0, data_0219ebc4, 0xff, 0, &b, &a);
        if (idx != -1) {
            data_0219ebc4[idx] = 0;
            func_0206627c(p, data_0219ebc4, idx, &b);
        }
    } while (func_02055000(p->field_0) != 0);
}
