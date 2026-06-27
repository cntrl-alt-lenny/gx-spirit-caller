/* CAMPAIGN-PREP candidate for func_0221d0d8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     smull magic 0x66666667 => '/5'; switch on f0; (u16) cap; loop induction
 *   risk:       permuter-class: already shipped as walled .s. The 6 callee-saved bases (r4-fp) hold derived ID compares + d016c ptr across the loop; mwcc will not reproduce that hoisting/reg-alloc. The switch IS a compare-tree not a jump table.
 *   confidence: low
 */
/* func_ov002_0221d0d8 (ov002, class D) — 5-iteration loop; per-iter guard
 * 0225764c(self, self->b0, i) then switch on self->f0 over message-IDs
 * {0x1409,0x153d,0x15ae,0x1882} computing a u16 value, then post via
 * 021d5a08 with (2, value) on the stack. Case 0x1409: func_021c8470(b0,i)/5
 * capped 0xffff. Case 0x153d (>=0x1409 && <0x15ae): self->f8. Case 0x15ae:
 * d016c[0xce8]. Case 0x1882: func_021bbc58(b0,11)*200. r0=self.
 * NOTE: already shipped as whole-function .s (reg-alloc-walled). */
#include "ov002_core.h"

extern char data_ov002_022d016c[];
extern int  func_ov002_021bbc58(int b0, int a);
extern int  func_ov002_021c8470(int b0, int i);
extern int  func_ov002_021d5a08(void *self, int b0, int i, int f0);
extern int  func_ov002_0225764c(void *self, int b0, int i);

struct Self0d8 { unsigned short f0; unsigned short b0; unsigned short f4; unsigned short f6; unsigned short f8; };

int func_ov002_0221d0d8(void *self) {
    struct Self0d8 *s = (struct Self0d8 *)self;
    int i;
    for (i = 0; i < 5; i++) {
        int val = 0;
        if (func_ov002_0225764c(self, s->b0 & 1, i) == 0) continue;
        switch ((int)s->f0) {
        case 0x1409:
            val = func_ov002_021c8470(s->b0 & 1, i) / 5;
            if (val >= 0xffff) val = 0xffff;
            break;
        case 0x153d:
            val = s->f8;
            break;
        case 0x15ae:
            val = *(int *)(data_ov002_022d016c + 0xce8);
            break;
        case 0x1882:
            val = func_ov002_021bbc58(s->b0 & 1, 11) * 200;
            break;
        }
        func_ov002_021d5a08(self, s->b0 & 1, i, (u16)val);
    }
    return 0;
}
