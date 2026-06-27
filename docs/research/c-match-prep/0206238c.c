/* CAMPAIGN-PREP candidate for func_0206238c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: varargs homing, 16B aggregate-assign, 0x24 stack-obj ctor chain
 *   risk:       func_02064db0(&a,&b) re-reads the named-arg home slots; if mwcc places tmp(sp+0) vs the homed slots (sp+0x34/0x38) differently the &-args diverge -- struct-guessed (Tmp24/Obj offsets) + permuter-class homing.
 *   confidence: low
 */
/* func_0206238c (cls D, size 0xac): varargs spill + alloc + memcpy + struct copy.
 *
 * Homes (a,b,c,src) varargs; func_02064db0(&a,&b) reads the first two slots.
 * if ((int)b > 0): p = func_020453e8(); obj->f_38 = p; if(!p) return 1;
 *                  func_020a7368(p, a, b); obj->f_3c = b;
 * if (src)        *(Blk16*)(obj+0x28) = *src;     // ldm/stm {r0-r3}
 * func_02061150(&tmp);  func_02061018(obj+0x68,&tmp);  func_02062d88(obj,&tmp);
 * obj->f_c = 0; return 0;
 *
 * tmp is a 0x24-byte stack aggregate (sub sp,#0x24) ctor'd by func_02061150.
 */

typedef struct { int w[4]; } Blk16;
typedef struct { unsigned char b[0x24]; } Tmp24;

typedef struct Obj Obj;
struct Obj {
    char  _pad0[0xc];
    int   f_c;
    char  _pad10[0x18];
    Blk16 f_28;          /* struct-copy dst */
    int   f_38;          /* allocation ptr  */
    int   f_3c;          /* stored count    */
};

extern void *func_020453e8(void);
extern int   func_02064db0(int *out, int *vap);
extern int   func_020a7368(void *dst, int a, int n);
extern int   func_02061150(Tmp24 *t);
extern int   func_02061018(void *dst, Tmp24 *t);
extern int   func_02062d88(Obj *o, Tmp24 *t);

int func_0206238c(Obj *o, int a, int b, Blk16 *src, ...)
{
    Tmp24 tmp;          /* sp+0x0 */

    func_02064db0(&a, &b);
    if (b > 0) {
        void *p = func_020453e8();
        o->f_38 = (int)p;
        if (p == 0)
            return 1;
        func_020a7368(p, a, b);
        o->f_3c = b;
    }
    if (src != 0)
        o->f_28 = *src;

    func_02061150(&tmp);
    func_02061018((char *)o + 0x68, &tmp);
    func_02062d88(o, &tmp);
    o->f_c = 0;
    return 0;
}
