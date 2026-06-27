/* CAMPAIGN-PREP candidate for func_022046c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (code.d==1 && code.c==5)->2 guard; then id==0x1506/0x1694 tail-call dispatch else 1
 *   risk:       reshape-able: d==1/c==5 read one ldrh, extracted predicated (cmpeq) — one bitfield holder reproduces. Only wobble is pooled 0x1506/0x1694 cmp literal-load order in the id dispatch.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022046c4 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (code.d==1 && code.c==5)->2 short-circuit guard; then id==LIT0/LIT1 tail-call dispatch else 1
 *   risk:       reshape-able: the d==1/c==5 guard reads ONE ldrh and extracts both fields predicated (cmpeq chain) — single bitfield holder reproduces it. id dispatch uses pooled 0x1506/0x1694 cmp; literal-load ORDER is the only wobble.
 *   confidence: med
 */
#include "types.h"

typedef struct Code_46c4 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_46c4;

typedef struct Obj_46c4 {
    u16 id;          /* +0x0 */
    Code_46c4 code;  /* +0x2 */
} Obj_46c4;

extern int func_ov002_0220472c(void);
extern int func_ov002_02204d78(void);

int func_ov002_022046c4(Obj_46c4 *obj) {
    if (obj->code.d == 1 && obj->code.c == 5) {
        return 2;
    }
    if (obj->id == 0x1506) {
        return func_ov002_0220472c();
    }
    if (obj->id == 0x1694) {
        return func_ov002_02204d78();
    }
    return 1;
}
