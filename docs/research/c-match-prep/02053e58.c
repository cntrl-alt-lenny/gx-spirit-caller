/* CAMPAIGN-PREP candidate for func_02053e58 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: && two-sided signed bounds assert; idx-first decl; forwarding tail calls
 *   risk:       bmi(idx<0)+cmp;blt fuse as one && guard; mwcc may reorder the two compares or hoist arr->count load. reshape-able (operand/decl order).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_02053e58 (main, class C) - brief 0015.
 * UNVERIFIED build-free draft. recipe: bounds-assert (&& of two signed
 * cmps) then two forwarding tail calls; decl-order idx-first.
 */
extern char data_020ffb04[];   /* assert expr -> r1 (LIT1) */
extern char data_020ffb10[];   /* assert file -> r0 (LIT0) */
extern void func_020a6d54(char *file, char *expr, int zero, int line);
extern void func_02053eb4(void *arr, int idx);
extern void func_02054314(void *arr, int idx);

typedef struct { int count; } Arr02053e58;  /* +0x00 length */

void func_02053e58(Arr02053e58 *arr, int idx) {
    if (!(idx >= 0 && idx < arr->count))
        func_020a6d54(data_020ffb10, data_020ffb04, 0, 0xca);

    func_02054314(arr, idx);
    func_02053eb4(arr, idx);
}
