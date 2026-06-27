/* CAMPAIGN-PREP candidate for func_02251104 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id :13 bitfield; cf17c guard + row+0x10 count; && chain with nested || sub-branch
 *   risk:       Same loop family as 0225070c => register-rotation near-miss (permuter-class). Extra risk: the (021bd030>=0 || 0202b8c0==2) bge/bne branch ordering may differ from orig nested guard.
 *   confidence: med
 */
/* func_ov002_02251104: loop slots [0x260], post kind-0xd when type==0x16,
 * func_021b8f80==0, and (func_021bd030(player)>=0 OR func_0202b8c0==2). */
struct Ov002Slot { unsigned int id : 13; };
extern int func_0202b878(int a);
extern int func_0202b8c0(int a);
extern int func_ov002_021b8f80(int a);
extern int func_ov002_021bd030(int player);
extern int func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
void func_ov002_02251104(int player) {
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
        if (func_0202b878(id) == 0x16 && func_ov002_021b8f80(id) == 0
            && (func_ov002_021bd030(player) >= 0 || func_0202b8c0(id) == 2))
            func_ov002_02253458(player, 0xd, i);
    }
}
