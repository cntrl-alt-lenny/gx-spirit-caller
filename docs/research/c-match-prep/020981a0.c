/* CAMPAIGN-PREP candidate for func_020981a0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clamp via if-assign (cmp/movgt/movlt); cache base(r4)+reuse on fail tail
 *   risk:       reshape-able: clamp must stay if-assign not min/max ternary, and base=o->f2c must bind to one reg (r4) reused by subne on the fail path; if mwcc reloads f2c there, 1 ldr diverges.
 *   confidence: med
 */
/* func_020981a0 - set fields + clamp a length to [0, span] + cond flag +
 * dispatch, with a failure-path that recomputes the clamp. Class C/D.
 * Recipe: clamp via if-assign (if(v>span)v=span; if(v<0)v=0;) to match
 * cmp/movgt/movlt (NOT a min/max ternary); r4 caches f2c, span=f28-f2c is
 * computed once and reused on the failure tail (subne r6,r0,r4). */

typedef struct Node {
    char _pad00[0xc];
    unsigned int fc;    /* +0xc flags */
    char _pad10[0x28 - 0x10];
    int  f28;           /* +0x28 */
    int  f2c;           /* +0x2c */
    int  f30;           /* +0x30 */
    int  f34;           /* +0x34 */
    int  f38;           /* +0x38 */
} Node;

extern int func_02097848(Node *o, int mode);
extern int func_02097f20(Node *o);

int func_020981a0(Node *o, int pos, int len, int flag) {
    int base = o->f2c;
    int span = o->f28 - base;
    o->f30 = pos;
    if (len > span) len = span;
    if (len < 0) len = 0;
    o->f34 = pos;
    o->f38 = len;
    if (flag == 0) o->fc |= 0x4;
    func_02097848(o, 0);
    if (flag == 0) {
        if (func_02097f20(o) != 0) len = o->f2c - base;
        else len = -1;
    }
    return len;
}
