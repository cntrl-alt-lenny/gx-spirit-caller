/* CAMPAIGN-PREP candidate for func_0207eae4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BOUNDS-guard predicated store + bool; unsigned cmp, base-first add idx*8
 *   risk:       mwcc must predicate (cc/cs) the whole body+bool instead of branching; struct offsets guessed
 *   confidence: med
 */
/* func_0207eae4: bounded index lookup, write element ptr, return bool.
 *
 *   ldr  r3, [r0, #0x18]        ; t = p->tbl
 *   ldrh r2, [r3]              ; n = t->count
 *   cmp  r1, r2                ; (unsigned) idx < n ?
 *   ldrcc r2, [r3, #0xc]       ; base = t->base
 *   addcc r1, r2, r1, lsl #0x3 ; base + idx*8  (base first)
 *   strcc r1, [r0]             ; p->slot = that
 *   movcc r0, #0x1             ; return 1
 *   movcs r0, #0x0             ; else return 0
 *   bx   lr
 *
 * cmp is unsigned (cc) -> idx must be unsigned for the cc branch.
 * Element stride is 8 (idx<<3).
 */

typedef struct {
    unsigned short count;  /* +0x0 */
    char           _pad02[0xa];
    int            base;   /* +0xc */
} Tbl0207eae4;

typedef struct {
    int          slot;        /* +0x0 result */
    char         _pad04[0x14];
    Tbl0207eae4 *tbl;         /* +0x18 */
} S0207eae4;

int func_0207eae4(S0207eae4 *p, unsigned int idx) {
    Tbl0207eae4 *t = p->tbl;
    if (idx < t->count) {
        p->slot = t->base + (idx << 3);
        return 1;
    }
    return 0;
}
