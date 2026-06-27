/* CAMPAIGN-PREP candidate for func_0225070c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id :13 bitfield; cf180 guard + reloaded row+0x14 count; && chain; *0x868 mul
 *   risk:       Compiled+disasm: body matches insn-for-insn EXCEPT register rotation (orig i=r4/row=r6/slot=r5; mwcc i=r5/row=r4/slot=r6) and guard popeq vs orig ldmls. permuter-class.
 *   confidence: med
 */
/* func_ov002_0225070c: loop ov002 slots [0x418], post kind-0xe when the
 * id maps nonzero, passes func_0202ef38, and the 2-D gate holds. */
struct Ov002Slot { unsigned int id : 13; };
extern int func_0202e234(int a);
extern int func_0202ef38(int a);
extern int func_ov002_021c33e4(int player, int a, int idx);
extern int func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
void func_ov002_0225070c(int player) {
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
        if (func_0202e234(id) && func_0202ef38(id)
            && func_ov002_021c33e4(player, player, i))
            func_ov002_02253458(player, 0xe, i);
    }
}
