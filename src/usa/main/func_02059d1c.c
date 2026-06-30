/* CAMPAIGN-PREP candidate for func_02059d1c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT/CLEAR teardown; reload p->m each use (no bind)
 *   risk:       mwcc may cache p->member (r4->+0xc) in a callee-saved reg instead of reloading every use; if so the ldr-per-store pattern flips
 *   confidence: med
 */
/* func_02059d1c: repetitive free-and-null teardown. The original
 * RELOADS p->res (at +0xc) before every free/store, so do NOT bind
 * it to a local -- reference p->res->field each time.
 *   for off in {0,4,8,c,10,14,c8}: free(res->[off]); res->[off]=0
 *   then free(res); p->res = 0
 */

typedef struct {
    void *a;     /* +0x00 */
    void *b;     /* +0x04 */
    void *c;     /* +0x08 */
    void *d;     /* +0x0c */
    void *e;     /* +0x10 */
    void *f;     /* +0x14 */
    char _pad_18[0xc8 - 0x18];
    void *g;     /* +0xc8 */
} Res;

typedef struct {
    char _pad_00[0xc];
    Res *res;    /* +0x0c */
} Owner;

extern void func_02045364(void *p);

void func_02059d1c(Owner *p) {
    if (p->res == 0) return;

    func_02045364(p->res->a); p->res->a = 0;
    func_02045364(p->res->b); p->res->b = 0;
    func_02045364(p->res->c); p->res->c = 0;
    func_02045364(p->res->d); p->res->d = 0;
    func_02045364(p->res->e); p->res->e = 0;
    func_02045364(p->res->f); p->res->f = 0;
    func_02045364(p->res->g); p->res->g = 0;
    func_02045364(p->res);
    p->res = 0;
}
