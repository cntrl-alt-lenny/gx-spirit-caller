/* CAMPAIGN-PREP candidate for func_02064500 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     down-counting for-loop over container; deref element pointer
 *   risk:       loop rotation must match (subs/mi pre-exit + subs/bpl bottom); count-1 keeps one counter; deref-as-pointer
 *   confidence: med
 */
/* func_02064500: iterate self->f10's elements backwards, calling
 * func_02064790 on each element's first field (a pointer).
 *   for (n = func_02054140(self->f10) - 1; n >= 0; n--)
 *       func_02064790(*(void**)func_020540d0(self->f10, n));
 */

typedef struct Obj Obj;
struct Obj {
    char _0[0x10];
    void *f10;            /* 0x10 -- container */
};

extern int   func_02054140(void *p);
extern void *func_020540d0(void *p, int idx);
extern void  func_02064790(void *e);

void func_02064500(Obj *self) {
    int n;
    for (n = func_02054140(self->f10) - 1; n >= 0; n--) {
        func_02064790(*(void **)func_020540d0(self->f10, n));
    }
}
