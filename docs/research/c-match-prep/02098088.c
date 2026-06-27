/* CAMPAIGN-PREP candidate for func_02098088 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     >4 params to force arg home-store push; field stores; orr then bic
 *   risk:       struct-guessed + reshape-able: the [sp,#0xc]/[sp,#0x10] reads assume a3/a4/a5 map to those slots after pushing r0-r3. If the param count/types shift the home-area offsets, the 3 ldr [sp,#..] diverge.
 *   confidence: med
 */
/* func_02098088 - >4-arg entry: spills incoming r0-r3 to home area, reads
 * 5th/6th stacked args, sets struct fields, sets/clears flags.
 * Class C: the leading stmdb {r0,r1,r2,r3} is mwcc's argument home-store
 * for a function whose later args live on the stack; reproduce by giving
 * it >4 params (so a3..a5 are at [sp,#0xc]/[sp,#0x10] after the push). */

typedef struct Node {
    char _pad00[0x8];
    int  f8;            /* +0x8 */
    unsigned int fc;    /* +0xc flags */
    char _pad10[0x30 - 0x10];
    int  f30;           /* +0x30 */
    int  f34;           /* +0x34 */
} Node;

extern int func_02097848(Node *o, int mode);

int func_02098088(Node *o, int a1, int a2, int a3, int a4, int a5) {
    if (a3 == 0) return 0;
    o->f8 = a3;
    o->f30 = a4;
    o->f34 = a5;
    if (func_02097848(o, 6) == 0) return 0;
    o->fc |= 0x10;
    o->fc &= ~0x20u;
    return 1;
}
