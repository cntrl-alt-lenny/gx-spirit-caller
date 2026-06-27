/* CAMPAIGN-PREP candidate for func_02204ab8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     a=code.a; v=cf16c[(a&1)*0x868]; v>0x3e8->0; else (d016c[+0xcec]==a)?0:2
 *   risk:       reshape-able: orig holds code.a in r3 across the table load and reuses it in `cmp r0,r3` — bind `a` once; `moveq#0;movne#2` two-const map = `==a?0:2`. The `(a&1)` `and` may drop on the :1 field.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02204ab8 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     a=code.a; v=cf16c[(a&1)*0x868] word; v>0x3e8->0; else (d016c[+0xcec]==a)?0:2
 *   risk:       reshape-able: orig keeps code.a (r3) live across the table load and reuses it in the final `cmp r0,r3` — bind `a` once. value-map is `moveq#0;movne#2` (two non-zero consts) — the ternary `==a?0:2` reproduces it. (a&1) `and` may be dropped on the :1 field.
 *   confidence: med
 */
#include "types.h"

typedef struct Code_4ab8 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_4ab8;

typedef struct Obj_4ab8 {
    u16 id;           /* +0x0 */
    Code_4ab8 code;   /* +0x2 */
} Obj_4ab8;

extern int data_ov002_022cf16c[2][0x868 / 4];
extern char data_ov002_022d016c[];

int func_ov002_02204ab8(Obj_4ab8 *obj) {
    int a;
    a = obj->code.a;
    if (data_ov002_022cf16c[a & 1][0] > 0x3e8) {
        return 0;
    }
    return *(int *)(data_ov002_022d016c + 0xcec) == a ? 0 : 2;
}
