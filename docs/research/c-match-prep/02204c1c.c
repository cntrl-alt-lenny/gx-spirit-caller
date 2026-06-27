/* CAMPAIGN-PREP candidate for func_02204c1c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     21bb068(0x135d)!=0->0; 21c9df0(code.a)==0->0; r=21b3ecc(code.a,code.b,0x152a); (r==0)?1:0
 *   risk:       reshape-able: orig holds obj in r4 and the 3rd block extracts code.b + code.a from ONE ldrh — a single bitfield holder reproduces both; `moveq#1;movne#0` = `(r==0)?1:0`. 0x135d/0x152a pooled.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02204c1c (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     21bb068(0x135d)!=0->0; 21c9df0(code.a)==0->0; r=21b3ecc(code.a, code.b, 0x152a); (r==0)?1:0
 *   risk:       reshape-able: orig holds obj in r4; the 3rd block reloads ldrh and extracts code.b(r1) + code.a(r3) from ONE read — a single bitfield holder reproduces both. final moveq#1/movne#0 = (r==0)?1:0. 0x135d/0x152a are pooled literals.
 *   confidence: med
 */
#include "types.h"

typedef struct Code_4c1c {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_4c1c;

typedef struct Obj_4c1c {
    u16 id;           /* +0x0 */
    Code_4c1c code;   /* +0x2 */
} Obj_4c1c;

extern int func_ov002_021bb068(int id);
extern int func_ov002_021c9df0(int a);
extern int func_ov002_021b3ecc(int a, int b, int tag);

int func_ov002_02204c1c(Obj_4c1c *obj) {
    int r;
    if (func_ov002_021bb068(0x135d) != 0) {
        return 0;
    }
    if (func_ov002_021c9df0(obj->code.a) == 0) {
        return 0;
    }
    r = func_ov002_021b3ecc(obj->code.a, obj->code.b, 0x152a);
    return r == 0 ? 1 : 0;
}
