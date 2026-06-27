/* CAMPAIGN-PREP candidate for func_020622c8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: varargs homing + first-decl-first-slot locals
 *   risk:       asm homes ALL of r0-r3 (stmdb {r0,r1,r2,r3}); mwcc '(Obj*,...)' normally homes only r1-r3, so &b slot (add r1,sp,#0x10) may shift -- permuter-class/struct-guessed.
 *   confidence: low
 */
/* func_020622c8 (cls D, size 0x58): varargs spill + state guard + struct call.
 *
 * stmdb sp!,{r0,r1,r2,r3}  -> homing of (a,...) varargs onto stack.
 * obj->f_14 = 0; if (obj->f_c != 4) return; then va-read pair via
 * func_02064db0(&local, &va_area), call func_02062ba4(obj, local, va),
 * obj->f_c = 6.
 *
 * func_02064db0(int *out, int *vap) is the "consume one va arg / fmt cursor"
 * helper (see its body: loads [r0], if 0 seeds from data_02101554, else
 * advances [r1]).  Here it is fed &a and &(varargs spill).
 */

typedef struct Obj Obj;
struct Obj {
    char _pad0[0xc];
    int  f_c;       /* state */
    int  f_10;
    int  f_14;
};

extern int func_02064db0(int *out, int *vap);
extern int func_02062ba4(Obj *o, int a, int b);

int func_020622c8(Obj *o, ...)
{
    int a;          /* sp+0xc, first-declared = first stack slot used */
    int b;          /* the spilled vararg at the homing slot           */

    o->f_14 = 0;
    if (o->f_c != 4)
        return o->f_14 != 0;        /* tail just returns (value in r0 dead) */

    func_02064db0(&a, &b);
    func_02062ba4(o, a, b);
    o->f_c = 6;
    return 0;
}
