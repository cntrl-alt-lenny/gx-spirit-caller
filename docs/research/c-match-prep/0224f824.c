/* CAMPAIGN-PREP candidate for func_0224f824 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do/while + :13 bitfield; array +0x418, count base[0x14] via cf180; single nonzero predicate
 *   risk:       do/while-vs-for loop-header shape (as ef84). Sibling of ef84/f024 with one predicate dropped; if those match this matches. reshape-able.
 *   confidence: med
 */
/* func_ov002_0224f824: simple +0x418 slot scan; single predicate
 * func_0202eac8(:13 id), post list event 0xe via func_02253458. (cls D.) */
typedef unsigned int u32;

struct Slot13 { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

extern int func_0202eac8(int id);
extern int func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224f824(int player) {
    char *base;
    struct Slot13 *p;
    int i;
    if (*(int *)(data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    p = (struct Slot13 *)(base + 0x418);
    i = 0;
    do {
        if (func_0202eac8(p->id) != 0)
            func_ov002_02253458(player, 0xe, i);
        p++;
    } while (++i < *(int *)(base + 0x14));
}
