/* CAMPAIGN-PREP candidate for func_022044e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield a; (a&1)*0x868 + (1-a)&1 dual word-table guards; ff2c8 pred
 *   risk:       reshape-able: orig has lsl;lsr (:1 field) AND separate `and #1` for the index; mwcc likely drops the redundant `&1` on a 0/1 field — widen holder so the `&1` survives.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022044e0 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield a; (a&1)*0x868 + rsb(1-a)&1 dual word-table guards; tail pred on ff2c8(self,a)
 *   risk:       reshape-able: orig emits BOTH lsl;lsr (1-bit field) AND a separate `and ip,r1,#1`; mwcc drops a redundant `&1` on a :1 field. Re-mask as `(a&1)` may collapse — if so, widen the holder so the index `&1` survives.
 *   confidence: low
 */
#include "types.h"

typedef struct Code_44e0 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_44e0;

typedef struct Obj_44e0 {
    u16 id;          /* +0x0 */
    Code_44e0 code;  /* +0x2 */
} Obj_44e0;

extern int data_ov002_022cf17c[2][0x868 / 4];
extern int data_ov002_022cf178[2][0x868 / 4];
extern int func_ov002_021ff2c8(void *self, int arg1);

int func_ov002_022044e0(Obj_44e0 *obj) {
    int a;
    a = obj->code.a;
    if (data_ov002_022cf17c[a & 1][0] == 0) {
        return 0;
    }
    if (data_ov002_022cf178[(1 - a) & 1][0] == 0) {
        return 0;
    }
    return func_ov002_021ff2c8(obj, a) > 0 ? 1 : 0;
}
