/* CAMPAIGN-PREP candidate for func_0205ce40 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     loop-invariant idx=0 as local (pins r7); reload owner->coll; sp8 out-flag local; stack-arg tag
 *   risk:       reshape-able: the index 0 must stay live in a callee reg as orig does — if mwcc constant-folds idx and drops r7, the loop body's reg layout shifts. Also the data_02100cb8 stack tag at sp[4] and elem offsets are struct-guessed.
 *   confidence: med
 */
/* func_0205ce40: drain-loop over a sub-collection at owner[0x38]. If
 * owner[0x30]!=0, no-op return 0. While the collection is non-empty, fetch
 * element 0 (func_020540d0(coll,0)), feed it to func_02057980 with two
 * stack args (index 0 and a data tag), and:
 *   - if the writeback flag sp[0x8]!=0 OR the call returns nonzero ->
 *     owner[0]=0x6a, return 0 (error)
 *   - else if elem[0xc]==elem[0x8] (fully consumed) -> remove element 0
 *     (func_02053e58(coll,0)) and continue; otherwise stop, return 0.
 * The index is the loop-invariant constant 0 (orig pins it in r7 and
 * stores it to sp[0]); written as a local so it materialises into a reg. */

extern char data_02100cb8[];
extern void func_02053e58(void *coll, int idx);
extern int  func_02054140(void *coll);
extern void *func_020540d0(void *coll, int idx);
extern int  func_02057980(void *a, void *b, void *elem, void *outflag);

typedef struct Owner3 { char _pad30[0x30]; int f30; char _pad34[0x04]; void *coll; void *f08_unused; } Owner3;
typedef struct Owner3b { void *f00; char _pad[0x04]; void *f08; } Owner3b;
typedef struct Elem { char _pad[0x08]; int f08; int f0c; } Elem;

int func_0205ce40(void *a, void *ownerp) {
    Owner3 *owner = (Owner3 *)ownerp;
    int idx = 0;
    int sp8;
    int rc;

    if (owner->f30 != 0) return 0;
    if (func_02054140(owner->coll) == 0) return 0;

    for (;;) {
        Elem *e = (Elem *)func_020540d0(owner->coll, idx);
        sp8 = 0;
        rc = func_02057980(a, ((Owner3b *)owner)->f08, e, &sp8);
        if (sp8 != 0 || rc != 0) {
            *(int *)owner = 0x6a;
            return 0;
        }
        if (e->f0c != e->f08) return 0;
        func_02053e58(owner->coll, idx);
        if (func_02054140(owner->coll) == 0) return 0;
    }
}
