/* CAMPAIGN-PREP candidate for func_021adbbc (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: u8 read as :8 bitfield (lsl#24;lsr#24); &t out-ptr; bind o, re-read f4
 *   risk:       permuter-class: mwcc peepholes (hw<<24)>>24 to `and #0xff` (orig keeps lsl;lsr) and may reorder the f8 movlt/ldrge clamp vs the cmp — documented byte-combine peephole-split wall (ov008_core.h).
 *   confidence: low
 */
/* func_ov008_021adbbc — clamp + bitfield-insert store (class D byte-combine).
 * data_ov008_021b2dc8 is a u16-field struct; +4 and +6 hold u8-packed values
 * read as (hw<<24)>>24 => unsigned :8 bitfield members. */
#include "ov008_core.h"

extern void func_ov008_021ac06c(int x, int *out, int a2);

typedef struct {
    unsigned short pad0;        /* +0 */
    unsigned short pad2;        /* +2 */
    unsigned int f4 : 8;        /* +4 byte0 (the (hw<<24)>>24 field) */
    unsigned int f4_hi : 8;
    unsigned int f4_rest : 16;
    unsigned int f6 : 8;        /* +6 byte0 */
    unsigned int f6_hi : 8;
    unsigned int f6_rest : 16;
    unsigned short f8;          /* +8 store target */
} Obj021b2dc8;

void func_ov008_021adbbc(int a0) {
    Obj021b2dc8 *o = (Obj021b2dc8 *)data_ov008_021b2dc8;
    int t = o->f4;                       /* str r3,[sp] before the call */
    func_ov008_021ac06c(a0, &t, o->f6 - 2);
    if (t == o->f4) return;              /* ldmeqia sp!,{r3,pc} */
    o->f8 = (o->f4 < t) ? 4 : 0xfffc;    /* movlt #4 / ldrge 0xfffc */
    o->f4 = (o->f4 & ~0xff) | (t & 0xff);/* bic+orr+strh re-pack +4 */
}
