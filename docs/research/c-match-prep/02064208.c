/* CAMPAIGN-PREP candidate for func_02064208 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     state==5||6 dispatch; default returns 1; 5-arg stacked call; bool-normalize
 *   risk:       5th stacked arg layout; the non-5/6 fast `return 1` ordering; offsets guessed
 *   confidence: high
 */
/* func_02064208: state dispatch.
 * f0c not in {5,6} -> return 1.
 * else if func_02054140(self->f9c)!=0 -> bool func_02061798(self,0,p1,p2,0)
 *      else                            -> bool func_02061b60(self,p1,p2,0)
 */

typedef struct Obj Obj;
struct Obj {
    char _0[0x0c];
    int   f0c;            /* 0x0c */
    char _10[0x9c - 0x10];
    void *f9c;            /* 0x9c */
};

extern int func_02054140(void *p);
extern int func_02061798(Obj *self, int a, int b, int c, int d);
extern int func_02061b60(Obj *self, int a, int b, int c);

int func_02064208(Obj *self, int p1, int p2) {
    int s = self->f0c;
    if (s != 5 && s != 6) return 1;
    if (func_02054140(self->f9c) != 0)
        return func_02061798(self, 0, p1, p2, 0) != 0;
    return func_02061b60(self, p1, p2, 0) != 0;
}
