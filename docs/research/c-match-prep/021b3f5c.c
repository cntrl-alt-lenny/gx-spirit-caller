/* CAMPAIGN-PREP candidate for func_021b3f5c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :4 bitfield, tag<6 range, conditional f4 load (ldreqh via &&), return head index unchanged
 *   risk:       reshape-able/permuter-class: orig keeps the HEAD index live in r0 across the whole loop and uses r4 for next (mla addr in lr). If mwcc reuses r0 for next or reorders the id/f4 ldreqh chain, 1-2 regs diverge. Try moving head=r->next to loop bottom (as written).
 *   confidence: med
 */
/* func_ov002_021b3f5c: 2-D head lookup (data_ov002_022cf1a6) -> walk
 * data_ov002_022d0650 list (8-byte, next +6); return the INDEX of the first
 * record with tag(:4 at +2)<6 && id(+0)==key0 && f4(+4)==key1, else 0.
 * The match returns the *head* index (r0 is never reassigned in the body;
 * next is carried in a separate reg). Class C/D, 4-reg frame. */
typedef unsigned short u16;

extern char data_ov002_022cf1a6[];
extern char data_ov002_022d0650[];

struct Rec3f5c { u16 id; u16 tag : 4; u16 _r : 12; u16 f4; u16 next; };

int func_ov002_021b3f5c(int player, int row, int key0, int key1) {
    struct Rec3f5c *r;
    int head;
    head = *(u16 *)(data_ov002_022cf1a6 + (player & 1) * 0x868 + row * 20);
    if (head == 0)
        return 0;
    for (;;) {
        r = (struct Rec3f5c *)(data_ov002_022d0650 + head * 8);
        if (r->tag < 6 && r->id == key0 && r->f4 == key1)
            return head;
        head = r->next;
        if (head == 0)
            return 0;
    }
}
