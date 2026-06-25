/* CAMPAIGN-PREP candidate for func_0206b47c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     save ctx (r5) before key store; assert as two null-checks; reload f4
 *   risk:       GF_ASSERT idiom: single cmp r4 + bne then re-cmp at .L_448. If mwcc folds the two null-checks into one branch, the second addeq/popeq tail diverges. reshape-able (keep two `if(ent==0)` statements).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206b47c (main, class C) - brief 494.
 * UNVERIFIED build-free draft. recipe: save-arg-first decl-order; GF_ASSERT
 * double-null-check; refcount decrement reloaded; tail free on hitting 0.
 */
/* func_0206b47c: h=func_02068c08(ctx); ent=func_0205442c(h,&key);
 * if(!ent) assert(); if(!ent) return; if(--ent->f4!=0) return;
 * func_020544c8(func_02068c08(ctx), &key);  key = arg1, on the stack. */

extern const char data_02101db0[];
extern const char data_02101e3c[];
extern void *func_02068c08(void *ctx);
extern void *func_0205442c(void *h, int *key);
extern void  func_020544c8(void *h, int *key);
extern void  func_020a6d54(const char *a, const char *b, int c, int d);

typedef struct { char _pad[4]; int f4; } RefEnt;

void func_0206b47c(void *ctx, int arg1)
{
    int key = arg1;
    RefEnt *ent = (RefEnt *)func_0205442c(func_02068c08(ctx), &key);
    if (ent == 0)
        func_020a6d54(data_02101e3c, data_02101db0, 0, 0xf4);
    if (ent == 0)
        return;
    ent->f4 = ent->f4 - 1;
    if (ent->f4 != 0)
        return;
    func_020544c8(func_02068c08(ctx), &key);
}
