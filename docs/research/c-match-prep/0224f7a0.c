/* CAMPAIGN-PREP candidate for func_0224f7a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do/while + :13 bitfield; array +0x260, count base[0x10] via cf17c alias; single ==6 predicate
 *   risk:       do/while-vs-for loop-header shape (as ef84). The cf17c initial guard plus base[0x10] reload must stay two distinct addressing forms (separate pool syms) — they do. reshape-able.
 *   confidence: med
 */
/* func_ov002_0224f7a0: simple +0x260 slot scan; predicate func_0202b878(:13
 * id) == 6, post list event 0xd via func_02253458. Count at base+0x10 (table
 * cf17c). (cls D.) */
typedef unsigned int u32;

struct Slot13 { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];              /* count table alias = cf16c+0x10 */

extern int func_0202b878(int id);
extern int func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224f7a0(int player) {
    char *base;
    struct Slot13 *p;
    int i;
    if (*(int *)(data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    p = (struct Slot13 *)(base + 0x260);
    i = 0;
    do {
        if (func_0202b878(p->id) == 6)
            func_ov002_02253458(player, 0xd, i);
        p++;
    } while (++i < *(int *)(base + 0x10));
}
