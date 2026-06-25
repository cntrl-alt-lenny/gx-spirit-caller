/* CAMPAIGN-PREP candidate for func_022045dc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield c/a; rsb parity=1-a; double mla chain (parity*0x868 + idx*0x14); reload per-global
 *   risk:       bind-vs-reload: orig RELOADS data_022cd3f4 [0] and [0x1c] in the second block (separate ldr). mwcc may CSE them into one load — reshape-able by forcing fresh reads; also (*p<<19>>19) bitfield vs the second (*p<<17>>31) single-bit-test extraction.
 *   confidence: low
 */
#include "types.h"

typedef struct Code_5dc {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_5dc;

typedef struct Obj_5dc {
    u16 pad0;
    Code_5dc code;   /* +0x2 */
    u8 pad4[0x10];
    int f14;         /* +0x14 */
} Obj_5dc;

typedef struct Ctx_5dc {
    int f0;
    u8 pad4[0x18];
    int f1c;         /* +0x1c */
} Ctx_5dc;

extern Ctx_5dc data_ov002_022cd3f4;
extern u8 data_ov002_022cf16c[2][0x868];
extern int func_0203058c(int x);
extern int func_0202e2f8(int x);

struct Sub_5dc { u8 pad[0x30]; int f30; }; /* 0x14 stride? see note */

int func_ov002_022045dc(Obj_5dc *obj) {
    int parity;
    int idx;
    int val;
    int *p;
    if (obj->code.c != 0x12) {
        return 0;
    }
    if (obj->f14 == 0) {
        return 0;
    }
    parity = 1 - obj->code.a;
    if (data_ov002_022cd3f4.f0 != parity) {
        return 0;
    }
    idx = data_ov002_022cd3f4.f1c;
    p = (int *)(data_ov002_022cf16c[data_ov002_022cd3f4.f0 & 1] + idx * 0x14 + 0x30);
    val = (*p << 0x13) >> 0x13;
    if (val == 0) {
        return 0;
    }
    if (func_0203058c(val) == 0 && func_0202e2f8(val) == 0) {
        p = (int *)(data_ov002_022cf16c[data_ov002_022cd3f4.f0 & 1] + idx * 0x14 + 0x30);
        if (((u32)(*p << 0x11) >> 0x1f) != 0) {
            return 1;
        }
    }
    return 0;
}
