/* CAMPAIGN-PREP candidate for func_02204768 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield a/b; mla parity-base + b*0x14 slot; (slot>>18)&1 -> lsr#0x12;tst
 *   risk:       reg-reuse: orig recomputes code.a (r0) after the first call, then derives parity(lr) and b(r3) from a re-loaded ldrh. mwcc may keep a in a callee-saved reg and skip the reload — reshape-able by re-reading obj->code; tst#1 vs and likely fine.
 *   confidence: med
 */
#include "types.h"

typedef struct Code_768 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_768;

typedef struct Obj_768 {
    u16 id;          /* +0x0 */
    Code_768 code;   /* +0x2 */
} Obj_768;

extern int data_ov002_022cf1ac[2][0x868 / 4];
extern int func_ov002_021ca2b8(int a);
extern int func_ov002_022536e8(u16 id, int k);

int func_ov002_02204768(Obj_768 *obj) {
    int a;
    int b;
    int slot;
    int r;
    a = obj->code.a;
    if (func_ov002_021ca2b8(a) == 0) {
        return 0;
    }
    a = obj->code.a;
    b = obj->code.b;
    slot = data_ov002_022cf1ac[a & 1][b * 0x14 / 4];
    if ((slot >> 0x12) & 1) {
        return 0;
    }
    r = func_ov002_022536e8(obj->id, 0);
    return (r > 0) ? 1 : 0;
}
