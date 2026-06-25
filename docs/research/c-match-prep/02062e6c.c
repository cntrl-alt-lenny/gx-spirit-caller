/* CAMPAIGN-PREP candidate for func_02062e6c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r5=p; count then assert(<=0); last-elem count-1; +0x50+e0 base; clear 0x90; bool tail
 *   risk:       tail is moveq r0,#0 / movne r0,#0;strne;movne r0,#1 — mwcc must emit the store INSIDE the success arm. If it lifts p->f90=0 out or returns via a merged path, the cond-store ordering (str before final mov r0,#1) diverges. permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02062e6c (main, class C) — brief 496.
 * UNVERIFIED build-free draft. MED tier: byte-match not expected first build.
 *   recipe: bind r5=p; count then assert(>0); last element; func_02062280; store 0x90 + bool tail
 */
/* func_02062e6c: place the last element of list +0x60. count =
 * func_02054140(+0x60); assert count > 0 (func_020a6d54 file/msg/0/line=0x475);
 * el = func_020540d0(+0x60, count-1); test func_02062280(p, +0x50 + el->_0,
 * el->_4). On success clear +0x90 and return 1, else return 0. */

extern char data_0210153c[];   /* __FILE__ */
extern char data_02101544[];   /* assert message */
extern void  func_020a6d54(const char *file, const char *msg, int zero, int line);
extern int   func_02054140(void *list);
extern void *func_020540d0(void *list, int index);
extern int   func_02062280(void *p, int off, int b);

typedef struct Obj {
    char _pad_00[0x50];
    int  f50;          /* +0x50 base */
    char _pad54[0x60 - 0x54];
    void *f60;         /* +0x60 list */
    char _pad64[0x90 - 0x64];
    int  f90;          /* +0x90 */
} Obj;

typedef struct El { int e0; int e4; } El;

int func_02062e6c(Obj *p) {
    int count = func_02054140(p->f60);
    El *el;
    if (count <= 0)
        func_020a6d54(data_0210153c, data_02101544, 0, 0x475);
    el = (El *)func_020540d0(p->f60, count - 1);
    if (func_02062280(p, p->f50 + el->e0, el->e4) == 0)
        return 0;
    p->f90 = 0;
    return 1;
}
