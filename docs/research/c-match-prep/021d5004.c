/* CAMPAIGN-PREP candidate for func_021d5004 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     changed-bool prologue; bind b500 (r4 held across 2 uses); materialized-bool tst chain; reload 0203268c each use
 *   risk:       permuter-class: the two `tst eb4,#bit; movne#1;moveq#0; cmp#1` materialised booleans — orig materialises, mwcc branches direct (021d4870/021d57ec wall); compounded by changed-bool reg pick.
 *   confidence: low
 */
/* func_ov004_021d5004: changed-bool clear of rec.258, lazy-init rec.258 via
 * 02033770, then a tst-flag guard chain on 0203268c.eb4 bits 0x1000/0x2000 and
 * b500.unk48 selecting phase constants 0x20/0x18/0x1d. */
#include "ov004_core.h"
extern char *func_0203268c(void);
extern int  func_02033770(void *ctx, int n);
extern int  func_020337fc(void *ctx);
extern void func_02033808(void *ctx, int v);

void func_ov004_021d5004(void *rec) {
    char *p = rec;
    char *b = data_ov004_0220b500;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) *(int *)(p + 0x258) = 0;
    if (*(int *)(p + 0x258) == 0)
        *(int *)(p + 0x258) = func_02033770(func_0203268c(), 2);
    if (*(int *)(data_ov004_0220e500 + 0xc90) != 0 && *(int *)(b + 0x48) == 1) {
        if (func_020337fc(func_0203268c()) != 0) return;
    }
    if (*(int *)(p + 0x258) == 0) return;
    if (*(int *)(func_0203268c() + 0xeb4) & 0x1000) return;
    if (*(int *)(func_0203268c() + 0xeb4) & 0x2000) {
        func_02033808(func_0203268c(), 1);
        *(int *)(p + 0x30) = 0x20; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
        return;
    }
    if (*(int *)(b + 0x48) == 1) {
        *(int *)(p + 0x30) = 0x18; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
        return;
    }
    *(int *)(p + 0x30) = 0x1d; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
}
