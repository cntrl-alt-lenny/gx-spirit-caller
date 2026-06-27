/* CAMPAIGN-PREP candidate for func_021d5838 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     changed-bool prologue; bind b500 base g; dense switch->jump-table (addls pc); a=0203354c then b=02033544 decl-order; b reused as 021d3b74 arg1
 *   risk:       permuter-class: changed-bool reg pick (g+38 dead reg vs fresh) plus the `if(g.4c==0) g.88=~0` mvneq-predicated store — mwcc may branch instead of predicate; switch table body order should match but the prologue diverges first.
 *   confidence: low
 */
/* func_ov004_021d5838: changed-bool runs a 02034114 lookup -> rec.48 then either
 * 021d8cd0 teardown (if global.unk64) or 021d3b74 string queue; gate on 022915e8;
 * 02034160(rec.48) range; else reset 021040ac.bac, negate two b500 fields via
 * 021ce1bc, and switch(0203354c) over phase constants; tail 02033554. */
#include "ov004_core.h"
extern char data_021040ac[];
extern char *func_0203268c(void);
extern void func_02033488(void *ctx);
extern int  func_02033544(void *ctx);
extern int  func_0203354c(void *ctx);
extern void func_02033554(void *ctx);
extern int  func_02034114(int a, int b);
extern int  func_02034160(unsigned int x);
extern void func_ov004_021ce1bc(int idx);
extern void func_ov004_021d3b74(void *rec, int a1, int a2, int a3, int a5);
extern void func_ov004_021d8cd0(void *rec);

void func_ov004_021d5838(void *rec) {
    char *p = rec;
    char *g = data_ov004_0220b500;
    int c = 0;
    if (*(int *)(p + 0x38)) { *(int *)(p + 0x38) = 0; c = 1; }
    if (c) {
        int a = func_0203354c(func_0203268c());
        int b = func_02033544(func_0203268c());
        *(int *)(p + 0x48) = func_02034114(a, b);
        if (*(int *)(g + 0x64) != 0) {
            func_ov004_021d8cd0(data_ov004_022915e8);
            *(int *)(g + 0x64) = 0;
        } else {
            func_ov004_021d3b74(p, b, 0, *(int *)(p + 0x48), 0);
        }
    }
    if (*(int *)data_ov004_022915e8 != 0) return;
    if (func_02034160(*(int *)(p + 0x48)) != 0) {
        func_02033488(func_0203268c());
        *(int *)(p + 0x30) = 0x29; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0;
    } else {
        if (*(int *)(g + 0x4c) == 0) *(int *)(g + 0x88) = ~0;
        *(int *)(data_021040ac + 0xbac) = ~0;
        func_ov004_021ce1bc(0);
        func_ov004_021ce1bc(1);
        switch (func_0203354c(func_0203268c())) {
        case 0: case 1: case 2:
            *(int *)(p + 0x30) = 0x18; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0; break;
        case 3:
            *(int *)(p + 0x30) = 0x22; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0; break;
        case 6:
            *(int *)(p + 0x30) = 0x29; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0; break;
        case 7:
            *(int *)(p + 0x30) = 0x28; *(int *)(p + 0x38) = 1; *(int *)(p + 0x3c) = 0; break;
        default: break;
        }
    }
    func_02033554(func_0203268c());
}
