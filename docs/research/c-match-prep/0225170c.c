/* CAMPAIGN-PREP candidate for func_0225170c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     identical to 0225070c recipe (id :13, cf180 guard, reloaded count, && chain), predicate2=ed90
 *   risk:       Exact structural clone of 0225070c (verified there): register rotation + guard popeq-vs-ldmls near-miss. permuter-class; if 0225070c's reg-alloc is cracked the fix transfers verbatim.
 *   confidence: med
 */
/* func_ov002_0225170c: clone of 0225070c with the second predicate replaced
 * by func_0202ed90 (cluster14 sibling). */
struct Ov002Slot { unsigned int id : 13; };
extern int func_0202e234(int a);
extern int func_0202ed90(int a);
extern int func_ov002_021c33e4(int player, int a, int idx);
extern int func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
void func_ov002_0225170c(int player) {
    int off = (player & 1) * 0x868;
    char *row;
    struct Ov002Slot *slot;
    int i;
    if (*(int *)(data_ov002_022cf180 + off) == 0)
        return;
    row = data_ov002_022cf16c + off;
    slot = (struct Ov002Slot *)(row + 0x418);
    for (i = 0; (unsigned int)i < *(unsigned int *)(row + 0x14); i++) {
        int id = slot[i].id;
        if (func_0202e234(id) && func_0202ed90(id)
            && func_ov002_021c33e4(player, player, i))
            func_ov002_02253458(player, 0xe, i);
    }
}
