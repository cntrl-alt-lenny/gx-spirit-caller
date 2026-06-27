/* CAMPAIGN-PREP candidate for func_02062320 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: 16B aggregate-assign as ldm/stm; guard branch shape
 *   risk:       first guard returns via movne path while clearing f_14; mwcc may hoist the single 'o->f_14=0' and merge both exits, changing the strne/movne layout -- reshape-able (split the two f_14=0 writes / branch order).
 *   confidence: med
 */
/* func_02062320 (cls D, size 0x6c): flag reset + state guard + ldm/stm 16B copy.
 *
 *   if (obj->f_14 != 0) { obj->f_14 = 0; return 0; }
 *   obj->f_14 = 0;
 *   if (obj->f_c != 4) return 0;
 *   func_02062c18(obj);
 *   obj->f_c = 5;
 *   if (src != 0) *(struct16*)(obj+0x28) = *(struct16*)src;   // ldm/stm {r0-r3}
 *   return 1;
 *
 * The 16-byte block copy is `ldmneia r4,{r0,r1,r2,r3}; stmneia ip,{...}` i.e. a
 * 4-word aggregate assignment; store-order is the whole struct in one go.
 */

typedef struct { int w[4]; } Blk16;

typedef struct Obj Obj;
struct Obj {
    char  _pad0[0xc];
    int   f_c;      /* state */
    int   f_10;
    int   f_14;     /* guard flag */
    char  _pad18[0x10];
    Blk16 f_28;     /* 16-byte copy destination */
};

extern int func_02062c18(Obj *o);

int func_02062320(Obj *o, Blk16 *src)
{
    if (o->f_14 != 0) {
        o->f_14 = 0;
        return 0;
    }
    o->f_14 = 0;
    if (o->f_c != 4)
        return 0;

    func_02062c18(o);
    o->f_c = 5;
    if (src != 0)
        o->f_28 = *src;
    return 1;
}
