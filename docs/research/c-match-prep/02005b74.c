/* CAMPAIGN-PREP candidate for func_02005b74 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch picks ctx into r4 callee-saved; bind ctx; trailing cmp/ldreq/streq tail
 *   risk:       reshape-able: the tail must emit cmp#1/beq then cmp#2/ldreq/streq (the asm tests kind==1 FIRST via beq, then falls into kind==2 streq). Order if/elif as 1-then-2 and keep kind live in r5 across the two calls; if mwcc rematerializes kind, the cmp sequence diverges.
 *   confidence: med
 */
/* func_02005b74: 3-way switch picks ctx ptr from data_02103d6c, calls
 * func_0209448c(0, ctx, 0xa4c) then func_02005ca0(kind), stores kind at
 * ctx+0xa44, then conditionally stores a func ptr at ctx+0xa48.
 * Switch family shared with func_02005c60 / func_02005bfc / func_02005b38.
 *
 *   r5=kind; switch: 1->[d6c+0]  2->[d6c+4]  default->0  => r4=ctx
 *   func_0209448c(0, ctx, 0xa4c)
 *   func_02005ca0(kind)
 *   ctx[0xa44] = kind
 *   if kind==1: ctx[0xa48]=&func_0208fe58
 *   elif kind==2: ctx[0xa48]=&func_0208fdf0
 */

typedef struct {
    void *f_0;
    void *f_4;
} data_02103d6c_t;

extern data_02103d6c_t data_02103d6c;
extern void func_0209448c(int a, void *ctx, int id);
extern void func_02005ca0(int kind);
extern void func_0208fdf0(void);
extern void func_0208fe58(void);

void func_02005b74(int kind) {
    char *ctx;
    switch (kind) {
    case 1:  ctx = (char *)data_02103d6c.f_0; break;
    case 2:  ctx = (char *)data_02103d6c.f_4; break;
    default: ctx = 0; break;
    }
    func_0209448c(0, ctx, 0xa4c);
    func_02005ca0(kind);
    *(int *)(ctx + 0xa44) = kind;
    if (kind == 1) {
        *(void **)(ctx + 0xa48) = (void *)func_0208fe58;
    } else if (kind == 2) {
        *(void **)(ctx + 0xa48) = (void *)func_0208fdf0;
    }
}
