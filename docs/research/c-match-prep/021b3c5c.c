/* CAMPAIGN-PREP candidate for func_021b3c5c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: 8-byte struct walk, :4 bitfield range-skip, early-return ptr
 *   risk:       orig loads next(r->next->r0) before the field guard and reuses ip=field across two cmps; a C field-reload or guard reorder shifts ldrh order (reshape-able: keep `node=r->next` before the guard).
 *   confidence: med
 */
/* func_ov002_021b3c5c: walk a linked list of 8-byte records at
 * data_ov002_022d0650 starting at node index arg0 (next index at +6);
 * skip records whose 4-bit field at +2 is >=6; return the first record
 * whose id(+0)==arg1 && field==arg2, else 0. */
typedef unsigned short u16;
extern char data_ov002_022d0650[];

struct Rec3c5c { u16 id; u16 field : 4; u16 _pad; u16 next; };

struct Rec3c5c *func_ov002_021b3c5c(int node, int id, int field) {
    struct Rec3c5c *r;
    if (node == 0)
        return 0;
    do {
        r = (struct Rec3c5c *)((char *)data_ov002_022d0650 + node * 8);
        node = r->next;
        if (r->field < 6 && r->id == id && r->field == field)
            return r;
    } while (node != 0);
    return 0;
}
