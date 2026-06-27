/* CAMPAIGN-PREP candidate for func_0224f910 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do/while + :13 bitfield held in a local across 3 &&-chained predicate calls; array +0x3a0, count base[0x18]
 *   risk:       orig holds id in callee-saved r9 across all 3 calls; mwcc should keep the local live, but the &&-chain branch-to-skip targets must collapse to one shared edge as orig does. reshape-able (else permuter-class branch layout).
 *   confidence: med
 */
/* func_ov002_0224f910: +0x3a0 slot scan; :13 id passes func_0202b878==7 AND
 * func_021ca3f0(player,id) AND func_0223bb28(player,id) -> post list event 0xc
 * via func_02253458. id is held across the three calls. Count base+0x18
 * (table cf184). (cls D.) */
typedef unsigned int u32;

struct Slot13 { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];              /* count table alias = cf16c+0x18 */

extern int func_0202b878(int id);
extern int func_ov002_021ca3f0(int player, int id);
extern int func_ov002_0223bb28(int player, int id);
extern int func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224f910(int player) {
    char *base;
    struct Slot13 *p;
    int i;
    if (*(int *)(data_ov002_022cf184 + (player & 1) * 0x868) == 0)
        return;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    p = (struct Slot13 *)(base + 0x3a0);
    i = 0;
    do {
        int id = p->id;
        if (func_0202b878(id) == 7 &&
            func_ov002_021ca3f0(player, id) != 0 &&
            func_ov002_0223bb28(player, id) != 0)
            func_ov002_02253458(player, 0xc, i);
        p++;
    } while (++i < *(int *)(base + 0x18));
}
