/* CAMPAIGN-PREP candidate for func_0205fa30 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind c=*p, refcount RMW first, marshal a2/a3/a5 to stack before call, reload out-node
 *   risk:       func_0205be60 arg-marshal (a1 in r2, &out in r3, a2/a3/a5 stacked) may reorder vs source; reshape-able via arg/decl order. struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0205fa30 (main, class C).
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:  bind c=*p (r4); emit refcount RMW first; marshal a2,a3,a5 into stack slots before the call; out-node reloaded from sp
 *   risk:    arg-marshal order to func_0205be60 (a1->r2, &out->r3, a2/a3/a5 stacked) and the c->f210 inc-store placement; offsets guessed
 *   confidence: med
 */
/* func_0205fa30: bump c->f210 refcount, call func_0205be60 to resolve a node
 * (out via &node), then func_0205fb88(c,node); if node->f8 set, also
 * func_020560a8(c, node->f18). c = *arg0. Any nonzero subcall result returns. */

extern int func_0205be60(void *c, int three, void *a1, void **out, void *a2, void *a3, void *a5);
extern int func_0205fb88(void *c, void *node);
extern int func_020560a8(void *c, void *arg);

typedef struct Ctx {
    char _p000[0x210];
    int  f210;           /* +0x210  refcount */
} Ctx;

typedef struct Node {
    char  _p00[0x08];
    int   f8;            /* +0x08 */
    char  _p0c[0x18 - 0x0c];
    void *f18;           /* +0x18 */
} Node;

int func_0205fa30(Ctx **pp, void *a1, void *a2, void *a3, void *a5) {
    Ctx *c = *pp;
    Node *node;
    int r;

    c->f210 = c->f210 + 1;
    r = func_0205be60(c, 3, a1, (void **)&node, a2, a3, a5);
    if (r != 0) return r;
    r = func_0205fb88(c, node);
    if (r != 0) return r;
    if (((Node *)node)->f8 == 0) return 0;
    return func_020560a8(c, ((Node *)node)->f18);
}
