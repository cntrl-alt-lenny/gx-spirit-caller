/* CAMPAIGN-PREP candidate for func_021d5a10 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     changed-bool prologue (named ov004 wall); decl a before b (r5 then r4); b reused as 02034114 arg2 + 021d3b74 arg1; 0x675 handle on stack
 *   risk:       permuter-class: explicitly listed changed-bool wall (021d5a10) — orig reuses dead rec.38 reg r0 for the implicit c; here folded into the if so the latch reg-choice is the divergence; decl-order should fix a/b only.
 *   confidence: low
 */
/* func_ov004_021d5a10: changed-bool runs 02034114(a,b) -> rec.48 then queues a
 * string via 021d3b74 with a 0202c0c0(0x675) handle on the stack. Two call results
 * (a=0203354c, b=02033544), decl-order sensitive; b reused as both 02034114 arg2
 * and 021d3b74 arg1. */
#include "ov004_core.h"
extern int  func_0202c0c0(int id);
extern char *func_0203268c(void);
extern int  func_02033544(void *ctx);
extern int  func_0203354c(void *ctx);
extern int  func_02034114(int a, int b);
extern void func_ov004_021d3b74(void *rec, int a1, int a2, int a3, int a5);

void func_ov004_021d5a10(void *rec) {
    char *p = rec;
    int a, b;
    if (*(int *)(p + 0x38)) {
        *(int *)(p + 0x38) = 0;
        a = func_0203354c(func_0203268c());
        b = func_02033544(func_0203268c());
        *(int *)(p + 0x48) = func_02034114(a, b);
        func_ov004_021d3b74(p, b, 0, *(int *)(p + 0x48), func_0202c0c0(0x675));
    }
}
