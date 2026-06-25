/* CAMPAIGN-PREP candidate for func_02064544 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call-result to stack int; pass &local + function-pointer to func_02054338; eq->bool
 *   risk:       single int local gives sub sp,#8; callback pointer typing vs func_02064580 real sig; f0c passed as handle
 *   confidence: med
 */
/* func_02064544: run func_02054338 over self->f0c with callback
 * func_02064580 and a stack arg seeded by func_02055330; return (result==0).
 */

typedef struct Obj Obj;
struct Obj {
    char _0[0x0c];
    int  f0c;             /* 0x0c -- handle */
};

extern int func_02055330(void);
extern int func_02064580(void *a, void *b);
extern int func_02054338(int handle, int (*cb)(void *, void *), void *arg);

int func_02064544(Obj *self) {
    int loc = func_02055330();
    return func_02054338(self->f0c, func_02064580, &loc) == 0;
}
