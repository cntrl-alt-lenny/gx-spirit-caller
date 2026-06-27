/* CAMPAIGN-PREP candidate for func_021b4270 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C/D: sum=0 pre-zeroed in r0, accumulator-first add (addeq r0,r0,r1), :4 tag<6, conditional f4 (ldreqh)
 *   risk:       reshape-able: orig zeroes r0 BEFORE the cur==0 test (mov r0,#0; cmp r4,#0; ldmeqia) — declare/init sum first so the empty-return path reuses the same r0. add must be sum-first (sum+=f4) to pick r0 as dest. Conditional f4 via &&.
 *   confidence: med
 */
/* func_ov002_021b4270: 2-D head lookup (data_ov002_022cf1a6) -> walk
 * data_ov002_022d0650 list (8-byte, next +6); ACCUMULATE f4(+4) over every
 * record with tag(:4 at +2)<6 && id(+0)==key; return the sum (0 if none/empty).
 * Class C/D, accumulator-first add. */
typedef unsigned short u16;

extern char data_ov002_022cf1a6[];
extern char data_ov002_022d0650[];

struct Rec4270 { u16 id; u16 tag : 4; u16 _r : 12; u16 f4; u16 next; };

int func_ov002_021b4270(int player, int row, int key) {
    struct Rec4270 *r;
    int cur;
    int sum;
    sum = 0;
    cur = *(u16 *)(data_ov002_022cf1a6 + (player & 1) * 0x868 + row * 20);
    if (cur == 0)
        return 0;
    do {
        r = (struct Rec4270 *)(data_ov002_022d0650 + cur * 8);
        cur = r->next;
        if (r->tag < 6 && r->id == key)
            sum += r->f4;
    } while (cur != 0);
    return sum;
}
