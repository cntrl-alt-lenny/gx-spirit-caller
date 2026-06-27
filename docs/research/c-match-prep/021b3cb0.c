/* CAMPAIGN-PREP candidate for func_021b3cb0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: dual :4 bitfields (lo4/hi4 at +2), id+optional-f4 guard, return matched ptr, list walk
 *   risk:       permuter-class: DOCUMENTED reg-alloc wall (ships as .s, brief 358). The loop iterator and r->id both contend for r0/lr; mwcc colours the base/iterator differently from orig. A C reshape will not fix it; escape to .s.
 *   confidence: low
 */
/* func_ov002_021b3cb0: walk data_ov002_022d0650 (8-byte records, next +6)
 * from index arg0; match records whose tag(:4 at +2) is 1 or 2, id(+0)==key,
 * hi-nibble(bits4-7 at +2)==0, and (mode<0 || f4(+4)==mode); return the
 * matched record POINTER, else 0. NOTE: already ships as whole-function .s
 * (brief 294/358 reg-alloc endgame); attempted here for the front-load. */
typedef unsigned short u16;

extern char data_ov002_022d0650[];

struct Rec3cb0 { u16 id; u16 lo4 : 4; u16 hi4 : 4; u16 _r : 8; u16 f4; u16 next; };

struct Rec3cb0 *func_ov002_021b3cb0(int node, int key, int mode) {
    struct Rec3cb0 *r;
    if (node == 0)
        return 0;
    do {
        r = (struct Rec3cb0 *)(data_ov002_022d0650 + node * 8);
        node = r->next;
        if ((r->lo4 == 1 || r->lo4 == 2) && r->id == key && r->hi4 == 0) {
            if (mode < 0 || r->f4 == mode)
                return r;
        }
    } while (node != 0);
    return 0;
}
