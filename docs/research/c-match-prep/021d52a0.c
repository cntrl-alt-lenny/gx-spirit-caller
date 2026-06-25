/* CAMPAIGN-PREP candidate for func_021d52a0 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     changed-bool prologue (named ov004 wall member); ldrsb arg via signed char; lazy-init store-order; tail-call last
 *   risk:       permuter-class: explicitly listed changed-bool wall (021d52a0) — orig reuses dead rec.38 reg (r0) for c, mwcc allocates fresh r1; store-c/!!/temp reshapes all tried & failed; 1 reg off.
 *   confidence: low
 */
/* func_ov004_021d52a0: changed-bool fires a status message (0202c0c0(0x66d) via
 * 021d8798) and clears rec.258; lazy-init rec.258 from 020337b8(ctx, sbyte at
 * rec+0x260); then tail 021d3f44(rec). */
#include "ov004_core.h"
extern int  func_0202c0c0(int id);
extern char *func_0203268c(void);
extern int  func_020337b8(void *ctx, int n);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void func_ov004_021d3f44(void *rec);

void func_ov004_021d52a0(void *rec) {
    char *p = rec;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0x66d), 3);
        *(int *)(p + 0x258) = 0;
    }
    if (*(int *)(p + 0x258) == 0)
        *(int *)(p + 0x258) = func_020337b8(func_0203268c(), *(signed char *)(p + 0x260));
    func_ov004_021d3f44(p);
}
