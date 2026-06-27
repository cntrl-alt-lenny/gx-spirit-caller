/* CAMPAIGN-PREP candidate for func_021b3fd8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :4 bitfield tag<6, conditional f4 (ldreqh via &&), bool return, next loaded early into r4
 *   risk:       reshape-able: here next IS loaded early (ldrh r4,[ip,#6] before guard) and r0 is reused as the id/f4 scratch, so the do-while with cur=r->next first is the right shape; the residual risk is mwcc predicating the `return 1` (movne) vs orig branch (inline/branch class).
 *   confidence: med
 */
/* func_ov002_021b3fd8: same scan as 021b3f5c but returns 1 on match (bool),
 * else 0. Walk data_ov002_022d0650 (8-byte, next +6) from a 2-D head lookup
 * (data_ov002_022cf1a6); match tag(:4 at +2)<6 && id(+0)==key0 && f4(+4)==key1.
 * Class C/D, 4-reg frame. */
typedef unsigned short u16;

extern char data_ov002_022cf1a6[];
extern char data_ov002_022d0650[];

struct Rec3fd8 { u16 id; u16 tag : 4; u16 _r : 12; u16 f4; u16 next; };

int func_ov002_021b3fd8(int player, int row, int key0, int key1) {
    struct Rec3fd8 *r;
    int cur;
    cur = *(u16 *)(data_ov002_022cf1a6 + (player & 1) * 0x868 + row * 20);
    if (cur == 0)
        return 0;
    do {
        r = (struct Rec3fd8 *)(data_ov002_022d0650 + cur * 8);
        cur = r->next;
        if (r->tag < 6 && r->id == key0 && r->f4 == key1)
            return 1;
    } while (cur != 0);
    return 0;
}
