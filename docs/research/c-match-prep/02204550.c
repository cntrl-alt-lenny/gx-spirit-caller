/* CAMPAIGN-PREP candidate for func_02204550 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     c!=0x23 guard; 5-arg ff170 (stack `1` first); shared fallthrough to 22536e8 pred
 *   risk:       store-order: orig stores the 5th arg `1` to [sp] BEFORE the h4/code.a ldrh; mwcc may evaluate that arg last and float the str past the loads — permuter-class arg-eval scheduling if pre-binding fails.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02204550 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     code.c!=0x23 guard; 5-arg ff170(stack arg=1 stored FIRST); SHARED fallthrough to 522536e8 pred
 *   risk:       store-order: orig writes the `1` to [sp] BEFORE loading h4/code.a; mwcc may evaluate the 5th call-arg last and reorder the str past the ldrh. reshape-able by pre-binding `one` first, else permuter-class arg-eval scheduling.
 *   confidence: low
 */
#include "types.h"

typedef struct Code_4550 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_4550;

typedef struct Obj_4550 {
    u16 id;          /* +0x0 */
    Code_4550 code;  /* +0x2 */
    struct {
        u16 lo6 : 6;
        u16 f6  : 9;  /* +0x4 field off6 w9 (lsl#0x11;lsr#0x17) */
        u16 top : 1;
    } h4;            /* +0x4 */
} Obj_4550;

extern int func_ov002_021f40f4(u16 *p);
extern int func_ov002_021ff170(int parity, int prev, int h4f, int z, int one);
extern int func_ov002_022536e8(int a, int id, int c);

int func_ov002_02204550(Obj_4550 *obj) {
    int t;
    if (obj->code.c != 0x23) {
        t = func_ov002_021f40f4(&obj->id);
        if (func_ov002_021ff170(obj->code.a, t, obj->h4.f6, 0, 1) == 0) {
            return 0;
        }
    }
    return func_ov002_022536e8(obj->code.a, obj->id, 0) > 0 ? 1 : 0;
}
