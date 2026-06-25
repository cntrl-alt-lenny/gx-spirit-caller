/* CAMPAIGN-PREP candidate for func_02064158 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     state==5||6 dispatch; 5-arg call w/ stacked arg; bool-normalize; 1-arg thunk
 *   risk:       5th stacked arg + outgoing-arg sub sp,#8 should match; f9c/state offsets guessed
 *   confidence: high
 */
/* func_02064158: state dispatch.
 * f0c not in {5,6} -> bool func_020643d8(self).
 * else if func_02054140(self->f9c)!=0 -> bool func_02061798(self,0,p1,p2,1)
 *      else                            -> bool func_02061b60(self,p1,p2,1)
 */

typedef struct Obj Obj;
struct Obj {
    char _0[0x0c];
    int   f0c;            /* 0x0c */
    char _10[0x9c - 0x10];
    void *f9c;            /* 0x9c */
};

extern int func_020643d8(Obj *self);                  /* 1-arg view */
extern int func_02054140(void *p);
extern int func_02061798(Obj *self, int a, int b, int c, int d);
extern int func_02061b60(Obj *self, int a, int b, int c);

int func_02064158(Obj *self, int p1, int p2) {
    int s = self->f0c;
    if (s != 5 && s != 6) return func_020643d8(self) != 0;
    if (func_02054140(self->f9c) != 0)
        return func_02061798(self, 0, p1, p2, 1) != 0;
    return func_02061b60(self, p1, p2, 1) != 0;
}
