/* CAMPAIGN-PREP candidate for func_02074dcc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind b; rely on LICM to hoist &b->_2ec/&b->_3a4 + constants 0/1 to callee-saved; keep store order
 *   risk:       asm hoists constants 0 and 1 into callee-saved r7/r6 across the loop (6-reg stmdb). If mwcc rematerializes them per-iter the saved-reg set shrinks and prologue diverges. permuter-class (LICM-driven, hard to force from C).
 *   confidence: med
 */
/* func_02074dcc: infinite re-init loop with early-return.
 * b = p->_c bound in r8 across the loop. Loop-invariants HOISTED before
 * .L_690: r5=&b->_2ec, r4=&b->_3a4, AND the constants r7=0, r6=1 (held in
 * callee-saved regs because they feed the per-iteration stores).
 * Store order each iter: _455=0, _1d4=0, _454=1. Early return when
 * func_02074e58(p)==0 (conditionalized: moveq/streqb/ldmeqia/bxeq). */
extern void func_02070c84(void *p);
extern void func_02070ec4(void *p);
extern int  func_02074e58(void *p);
extern void func_02077f8c(void *q);
extern void func_020785cc(void *q);

void func_02074dcc(void *p) {
    char *b = *(char **)((char *)p + 0xc);
    for (;;) {
        func_02070ec4(p);
        *(b + 0x455) = 0;
        *(int *)(b + 0x1d4) = 0;
        *(b + 0x454) = 1;
        func_020785cc(b + 0x2ec);
        func_02077f8c(b + 0x3a4);
        if (func_02074e58(p) == 0) {
            *(b + 0x455) = 8;
            return;
        }
        func_02070c84(p);
        *(unsigned short *)((char *)p + 0x18) = *(unsigned short *)((char *)p + 0x1a);
        *(int *)((char *)p + 0x1c) = *(int *)((char *)p + 0x20);
    }
}
