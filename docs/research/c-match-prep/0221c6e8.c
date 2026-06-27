/* CAMPAIGN-PREP candidate for func_0221c6e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :1 reads; if-chain state dispatch; pass-through self->b0/f0 to sinks
 *   risk:       struct-guessed: sink arg-order/arity for 021e276c/0225368c/021d7d0c inferred from r0-r3 only; also reload-vs-bind of d016c/ce288 base. permuter-class if mwcc reloads halfwords per-use.
 *   confidence: low
 */
/* func_ov002_0221c6e8 (ov002, class D) — state dispatch returning status
 * bytes. Entry: r0 = self (u16 f0 at +0, u16 b0:1 at +2, h4 at +4).
 * Gate on a global state word d016c[0xcf8]==5 -> sub-dispatch on the
 * d016c/ce288 state byte ce288[0x5a8] (0x7e/0x7f/0x80) returning 0x78/
 * 0x7e/0x7f. Else: if ((h4>>2)&1) return 0; post via 021e276c return 0. */
#include "ov002_core.h"

extern char data_ov002_022d016c[];
extern char data_ov002_022ce288[];
extern int  func_ov002_021ae400(int slot, int id);
extern int  func_ov002_021af9d0(int slot, int a, int b, int c);
extern int  func_ov002_021afb74(void);
extern int  func_ov002_021d7d0c(void *self, int b0, int r);
extern int  func_ov002_021e276c(int f0, int self0, int a, int b);
extern int  func_ov002_0225368c(int slot, int f0, int kind);

struct Self6e8 { u16 f0; u16 b0 : 1; u16 : 16; u16 : 2; u16 m4 : 1; };

int func_ov002_0221c6e8(void *self) {
    struct Self6e8 *s = (struct Self6e8 *)self;
    if (*(int *)(data_ov002_022d016c + 0xcf8) == 5) {
        int st = *(int *)(data_ov002_022ce288 + 0x5a8);
        if (st == 0x7e) {
            func_ov002_021d7d0c(self, s->b0, func_ov002_021afb74());
            return 0x78;
        }
        if (st == 0x7f) {
            func_ov002_021af9d0(s->b0, 6, s->f0, 0);
            return 0x7e;
        }
        if (st != 0x80) return 0;
        if (func_ov002_0225368c(s->b0, s->f0, 0) == 0) return 0;
        func_ov002_021ae400(s->b0, 0x4d);
        return 0x7f;
    }
    if (s->m4) return 0;
    func_ov002_021e276c(s->b0, s->f0, 1, 0);
    return 0;
}
