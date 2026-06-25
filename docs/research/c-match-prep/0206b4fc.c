/* CAMPAIGN-PREP candidate for func_0206b4fc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r4=arg1 declared/stored before r5=ctx; if(ent) bump+return; reload slot0
 *   risk:       Return value: orig reloads rec.val from the stack (`ldr r0,[sp]`) rather than keeping the func_020552dc result live. If mwcc keeps it in a reg, the final ldr is dropped. reshape-able (return the struct field, as written).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206b4fc (main, class C) - brief 494.
 * UNVERIFIED build-free draft. recipe: arg1 saved first (decl-order r4 then
 * r5); lookup hit -> bump refcount + return f0 via ldrne chain; miss ->
 * build 2-int record {val,1} and insert, return val by reloading slot0.
 */
/* func_0206b4fc: ent=func_0205442c(func_02068c08(ctx),&key);  key=arg1.
 * if(ent){ ent->f4++; return ent->f0; }
 * rec.val=func_020552dc(arg1); rec.one=1;
 * func_02054568(func_02068c08(ctx),&rec); return rec.val. */

extern void *func_02068c08(void *ctx);
extern void *func_0205442c(void *h, void **key);
extern void  func_02054568(void *h, void *rec);
extern void *func_020552dc(void *x);

typedef struct { void *f0; int f4; } RefEnt;
typedef struct { void *val; int one; } Rec;

void *func_0206b4fc(void *ctx, void *arg1)
{
    void *key = arg1;
    RefEnt *ent = (RefEnt *)func_0205442c(func_02068c08(ctx), &key);
    Rec rec;
    if (ent) {
        ent->f4 = ent->f4 + 1;
        return ent->f0;
    }
    rec.val = func_020552dc(arg1);
    rec.one = 1;
    func_02054568(func_02068c08(ctx), &rec);
    return rec.val;
}
