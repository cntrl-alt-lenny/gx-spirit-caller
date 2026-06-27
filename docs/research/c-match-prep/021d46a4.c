/* CAMPAIGN-PREP candidate for func_021d46a4 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sibling of 4584; first error block FALLS THROUGH (no return); :3 bitfield
 *   risk:       same changed-bool reg-reuse wall as 021d4584 (orig recycles dead unk38 reg for the gate; mwcc allocates fresh) — 1 reg off. permuter-class.
 *   confidence: med
 */
/* func_ov004_021d46a4: sibling of 021d4584. Same changed-edge toast + bitfield-
 * selected func_021db874/db994 + ctx fill, BUT the first stage's error block
 * FALLS THROUGH into the shared tail (no early return) — the lone structural
 * difference from 021d4584. cls D: lsl#1d;lsr#1d bitfield (data_02104f4c[0xa3c]).
 */
#include "ov004_core.h"
extern char data_02104f4c[];
extern char data_02105989[];
extern void *func_0203268c(void);
extern void  func_020332a4(void *ctx, void *buf);
extern int   func_02033318(void *ctx, int a1);
extern int   func_02033344(void *ctx);
extern int   func_02033354(void *ctx);
extern int   func_ov004_021c9d60(int a0, int a1);
extern void  func_ov004_021d8798(void *tag, int a1, int a2);
extern void  func_ov004_021db874(void *p);
extern void  func_ov004_021db994(void *p);

struct bits3 { unsigned char f : 3; };

void func_ov004_021d46a4(char *self) {
    int buf[11];
    int changed = 0;
    if (*(int *)(self + 0x38) != 0) {
        *(int *)(self + 0x38) = 0;
        changed = 1;
    }
    if (changed) {
        func_ov004_021d8798(data_ov004_022915e8, func_ov004_021c9d60(0, 0x14), 0);
        if (((struct bits3 *)(data_02104f4c + 0xa3c))->f != 0)
            func_ov004_021db994(data_02105989);
        else
            func_ov004_021db874(data_02105989);
        func_020332a4(func_0203268c(), buf);
        if (func_02033318(func_0203268c(), 1) < 0) {
            *(int *)(self + 0x30) = 0x27;
            *(int *)(self + 0x38) = 1;
            *(int *)(self + 0x3c) = 0;
        }
    }
    if (func_02033344(func_0203268c()) == 0)
        return;
    if (func_02033354(func_0203268c()) < 0) {
        *(int *)(self + 0x30) = 0x27;
        *(int *)(self + 0x38) = 1;
        *(int *)(self + 0x3c) = 0;
        return;
    }
    *(int *)(self + 0x30) = 0xf;
    *(int *)(self + 0x38) = 1;
    *(int *)(self + 0x3c) = 0;
}
