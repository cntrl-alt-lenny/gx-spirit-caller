/* CAMPAIGN-PREP candidate for func_02203cb4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield code.c(:6)/code.a(:1); mla idx*0x38 base; struct-base bound to slot
 *   risk:       struct-guessed: 0x38 stride, 0xcec global field, and the rsb(idx=val-1) vs cmpeq lr,r1>>31 ordering. Likely the eq-guard chain (cmp r3,#0xd; cmpeq) ordering — reshape-able by keeping && order; offsets need real-struct confirm.
 *   confidence: low
 */
#include "types.h"

typedef struct Code_cb4 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_cb4;

typedef struct Obj_cb4 {
    u16 pad0;
    Code_cb4 code;   /* +0x2 */
    u8 pad4[0x10];
    u16 cur;         /* +0x14 */
    u16 max;         /* +0x16 */
} Obj_cb4;

typedef struct Slot_cb4 {
    u8 pad0[0x8];
    int flag;        /* +0x8 */
} Slot_cb4; /* 0x38 stride */

typedef struct Ctx_cb4 {
    int f0;
    u8 pad4[0x18];
    int f1c;         /* +0x1c */
} Ctx_cb4;

extern int data_ov002_022d016c[];
extern Slot_cb4 data_ov002_022cd420[];
extern Ctx_cb4 data_ov002_022cd3f4;
extern int func_ov002_021c1e44(int a, int b);

int func_ov002_02203cb4(Obj_cb4 *obj) {
    Slot_cb4 *slot;
    int idx;
    idx = data_ov002_022d016c[0xcec / 4] - 1;
    slot = &data_ov002_022cd420[idx];
    if (obj->code.c == 0xd && idx == obj->code.a) {
        if (slot->flag != 0) {
            if (obj->cur < obj->max) {
                if (func_ov002_021c1e44(data_ov002_022cd3f4.f0,
                                        data_ov002_022cd3f4.f1c) == 0) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
