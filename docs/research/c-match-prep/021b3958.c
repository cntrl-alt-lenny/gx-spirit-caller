/* CAMPAIGN-PREP candidate for func_021b3958 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :4 bitfield holder, head mla (and;mul;mla;ldrh), 8-byte list walk, next loaded early
 *   risk:       reshape-able: orig loads next(r->next) into r3 BEFORE the tag guard and reuses it as the loop test; if mwcc reloads +6 the ldrh order shifts. Keep cur=r->next before the if.
 *   confidence: med
 */
/* func_ov002_021b3958: 2-D head lookup (data_ov002_022cf1a6, 0x868/player,
 * row*20) -> walk the data_ov002_022d0650 linked list (8-byte records,
 * next at +6); return the first record's id(+0) whose 4-bit tag(:4 at +2)
 * == 13, else 0xffff. Class D: :4 bitfield, head-table mla. */
typedef unsigned short u16;

extern char data_ov002_022cf1a6[];
extern char data_ov002_022d0650[];

struct Rec3958 { u16 id; u16 tag : 4; u16 _r : 12; u16 f4; u16 next; };

int func_ov002_021b3958(int player, int row) {
    struct Rec3958 *r;
    int cur;
    cur = *(u16 *)(data_ov002_022cf1a6 + (player & 1) * 0x868 + row * 20);
    if (cur == 0)
        return 0xffff;
    do {
        r = (struct Rec3958 *)(data_ov002_022d0650 + cur * 8);
        cur = r->next;
        if (r->tag == 13)
            return r->id;
    } while (cur != 0);
    return 0xffff;
}
