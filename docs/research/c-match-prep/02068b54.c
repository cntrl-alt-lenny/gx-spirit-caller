/* CAMPAIGN-PREP candidate for func_02068b54 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Two calls -> 2-int stack struct, then sink via func_02054568(p->f_18,&tmp)
 *   risk:       Frame size 0xc; func_0206b4fc 2nd arg typed void* (it receives a ptr from caller 02068b1c); field +0x18 offset guessed.
 *   confidence: med
 */
/* func_02068b54: pair = { func_0206b4fc(0,arg1), func_0206b4fc(0,arg2) };
 * then func_02054568(p->f_18, &pair). The two results land in a small
 * stack record passed by address. */

typedef struct {
    char  _pad[0x18];
    void *f_18;                /* +0x18 */
} obj_02068b54_t;

typedef struct { int a, b; } pair_02068b54_t;

extern int  func_0206b4fc(int zero, void *x);
extern void func_02054568(void *ctx, pair_02068b54_t *pair);

void func_02068b54(obj_02068b54_t *p, void *arg1, void *arg2) {
    pair_02068b54_t pair;
    pair.a = func_0206b4fc(0, arg1);
    pair.b = func_0206b4fc(0, arg2);
    func_02054568(p->f_18, &pair);
}
