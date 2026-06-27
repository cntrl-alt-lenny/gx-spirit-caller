/* CAMPAIGN-PREP candidate for func_021d4584 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned :3 bitfield -> lsl#1d;lsr#1d; changed-edge bool; first error returns
 *   risk:       the changed-bool (orig reuses the dead unk38 reg r0 for `changed`; mwcc picks a fresh reg) = the documented ov004 changed-bool wall — 1 reg off on the gate. permuter-class.
 *   confidence: med
 */
/* func_ov004_021d4584: on the "changed" edge (self+0x38), post a toast, then run
 * func_021db874/db994 (selected by a 3-bit bitfield in data_02104f4c[0xa3c]) on a
 * format global, fill a stack ctx via func_020332a4, and advance two dispatcher
 * stages; each stage's <0 result latches an error state. cls D: lsl#1d;lsr#1d
 * bitfield.  field = low 3 bits of data_02104f4c[0xa3c]  ->  unsigned :3.
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

void func_ov004_021d4584(char *self) {
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
            return;
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
