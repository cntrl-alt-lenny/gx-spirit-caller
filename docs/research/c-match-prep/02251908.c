/* CAMPAIGN-PREP candidate for func_02251908 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     same loop recipe; cf17c guard + row+0x10 count; 4-term && ending in 021ca440(player,id) 2-arg
 *   risk:       Same loop family => register-rotation + guard condition-bit near-miss (permuter-class). Note final guard is func_021ca440(player,id) (id, NOT i) unlike the 021c33e4(player,player,i) variants; verified from arg setup.
 *   confidence: med
 */
/* func_ov002_02251908: loop slots [0x260], post kind-0xd when id maps,
 * func_0202de9c==0, func_0202eac8 holds, and func_021ca440(player,id) holds. */
struct Ov002Slot { unsigned int id : 13; };
extern int func_0202de9c(int a);
extern int func_0202e234(int a);
extern int func_0202eac8(int a);
extern int func_ov002_021ca440(int player, int id);
extern int func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
void func_ov002_02251908(int player) {
    int off = (player & 1) * 0x868;
    char *row;
    struct Ov002Slot *slot;
    int i;
    if (*(int *)(data_ov002_022cf17c + off) == 0)
        return;
    row = data_ov002_022cf16c + off;
    slot = (struct Ov002Slot *)(row + 0x260);
    for (i = 0; (unsigned int)i < *(unsigned int *)(row + 0x10); i++) {
        int id = slot[i].id;
        if (func_0202e234(id) && func_0202de9c(id) == 0 && func_0202eac8(id)
            && func_ov002_021ca440(player, id))
            func_ov002_02253458(player, 0xd, i);
    }
}
