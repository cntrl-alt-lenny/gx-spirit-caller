/* CAMPAIGN-PREP candidate for func_021d3bc0 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch (cmp/addls jump-table), nested call ctx, store-order tail
 *   risk:       cases 11/12 have identical bodies; orig keeps .L_44/.L_60 as 2 separate table targets but mwcc may merge them into one (permuter-class, not C-steerable).
 *   confidence: med
 */
/* func_ov004_021d3bc0: dispatch on (func_0203353c()-10) over a 4-way branch
 * table; each arm plays an SE (func_0202c0c0) and posts a status toast via
 * func_ov004_021d8798, then sets state +0x30=0x26 / +0x38=1 / +0x3c=0 and
 * advances the dispatcher. cls D: branch-table dispatch + store-order. */
#include "ov004_core.h"
extern char data_ov004_02209f84[];
extern void *func_0203268c(void);
extern int  func_0203353c(void *ctx);
extern void func_02033554(void *ctx);
extern int  func_0202c0c0(int id);
extern void func_ov004_021d8798(void *tag, int a1, int a2);

void func_ov004_021d3bc0(void *self) {
    char *s = self;
    switch (func_0203353c(func_0203268c())) {
    case 10:
        func_ov004_021d8798(data_ov004_022915e8, (int)data_ov004_02209f84, 0x12);
        break;
    case 11:
        func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0x672), 0x12);
        break;
    case 12:
        func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0x672), 0x12);
        break;
    case 13:
        func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0x673), 0x12);
        break;
    }
    *(int *)(s + 0x30) = 0x26;
    *(int *)(s + 0x38) = 1;
    *(int *)(s + 0x3c) = 0;
    func_02033554(func_0203268c());
}
