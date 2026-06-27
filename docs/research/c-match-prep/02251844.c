/* CAMPAIGN-PREP candidate for func_02251844 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     same 0225070c loop recipe; 4-term && with func_0202de9c(id)==0 (bne-skip) inverted guard
 *   risk:       Same loop family => register-rotation + guard popeq-vs-ldmls near-miss (permuter-class). The de9c(id)==0 term must stay ==0 (not !de9c) to emit the orig cmp#0;bne; logic verified by sibling shapes.
 *   confidence: med
 */
/* func_ov002_02251844: loop slots [0x418], post kind-0xe when id maps,
 * func_0202de9c==0, func_0202eac8 holds, and the 2-D gate holds. */
struct Ov002Slot { unsigned int id : 13; };
extern int func_0202de9c(int a);
extern int func_0202e234(int a);
extern int func_0202eac8(int a);
extern int func_ov002_021c33e4(int player, int a, int idx);
extern int func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
void func_ov002_02251844(int player) {
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
        if (func_0202e234(id) && func_0202de9c(id) == 0 && func_0202eac8(id)
            && func_ov002_021c33e4(player, player, i))
            func_ov002_02253458(player, 0xe, i);
    }
}
