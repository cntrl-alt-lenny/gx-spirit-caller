/* CAMPAIGN-PREP candidate for func_02204b08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     code.c==2 guard; ff3bc(self) bool guard; r=21b99b4(code.a, h4.f6); (r>=0)?1:0
 *   risk:       reshape-able: obj held in r4 across both calls; orig RELOADS code+h4 via a second ldrh after ff3bc — re-read obj->code/obj->h4 so mwcc doesn't hoist. struct-guessed h4 off6 w9.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02204b08 (ov002, class D, MED tier) — brief 498.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     code.c==2 guard; ff3bc(self) bool guard; r=21b99b4(code.a, h4.f6); return (r>=0)?1:0
 *   risk:       reshape-able: obj held in r4 across both calls (stmfd {r4,lr}); the SECOND ldrh reloads code+h4 after ff3bc — re-read obj->code/obj->h4 (don't let mwcc hoist). final movge#1/movlt#0 = (r>=0)?1:0. struct-guessed h4 off6 w9.
 *   confidence: med
 */
#include "types.h"

typedef struct Code_4b08 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_4b08;

typedef struct Obj_4b08 {
    u16 id;           /* +0x0 */
    Code_4b08 code;   /* +0x2 */
    struct {
        u16 lo6 : 6;
        u16 f6  : 9;  /* +0x4 off6 w9 (lsl#0x11;lsr#0x17) */
        u16 top : 1;
    } h4;             /* +0x4 */
} Obj_4b08;

extern int func_ov002_021ff3bc(void *self);
extern int func_ov002_021b99b4(int a, int h4f);

int func_ov002_02204b08(Obj_4b08 *obj) {
    int r;
    if (obj->code.c != 2) {
        return 0;
    }
    if (func_ov002_021ff3bc(obj) == 0) {
        return 0;
    }
    r = func_ov002_021b99b4(obj->code.a, obj->h4.f6);
    return r >= 0 ? 1 : 0;
}
