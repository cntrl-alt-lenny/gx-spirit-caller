/* CAMPAIGN-PREP candidate for func_02204fa8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield c/a/b; c+0xee+0xff00 wrap to u16; mla f4-parity base + f20*0x14 halfword
 *   risk:       many bitfield reloads from ip(code) held across guards, plus ctx fields f4/f20 feed the final mla. mwcc reg-alloc for the (code held in ip) vs re-ldrh path is the divergence — permuter-class; final mla operand-order also at risk.
 *   confidence: low
 */
#include "types.h"

typedef struct Code_fa8 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_fa8;

typedef struct Obj_fa8 {
    u16 id;          /* +0x0 */
    Code_fa8 code;   /* +0x2 */
} Obj_fa8;

typedef struct Ctx_fa8 {
    int f0;          /* +0x0 */
    int f4;          /* +0x4 */
    int f8;          /* +0x8 */
    u8 pad[0x14];
    int f1c;         /* +0x1c */
    int f20;         /* +0x20 */
} Ctx_fa8;

extern int data_ov002_022d016c[];
extern Ctx_fa8 data_ov002_022cd3f4;
extern u16 data_ov002_022cf1a2[2][0x868 / 2];
extern int func_ov002_021b3ecc(u16 id);

int func_ov002_02204fa8(Obj_fa8 *obj) {
    int c;
    int parity;
    int b;
    u16 cell;
    c = (obj->code.c + 0xee + 0xff00) & 0xffff;
    if ((u32)c > 1) {
        return 0;
    }
    parity = obj->code.a;
    if (data_ov002_022d016c[0xcec / 4] != parity) {
        return 0;
    }
    b = obj->code.b;
    if (data_ov002_022cd3f4.f1c != b) {
        return 0;
    }
    if (func_ov002_021b3ecc(obj->id) != 0) {
        return 0;
    }
    if (data_ov002_022cd3f4.f8 != 0) {
        return 0;
    }
    cell = data_ov002_022cf1a2[data_ov002_022cd3f4.f4 & 1]
                              [data_ov002_022cd3f4.f20 * 0x14 / 2];
    return (cell != 0) ? 1 : 0;
}
