/* CAMPAIGN-PREP candidate for func_0224bbd8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     off-bind row; :13 id inline into b878; b878(id)==b878(arg1) && 021c33e4 chain
 *   risk:       orig evaluates b878(id) FIRST (result to sl) then b878(arg1); if mwcc swaps the two b878 evaluations the arg/result reg coloring flips. arg1 reloaded each iter. reshape-able (operand/eval order) else permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224bbd8 (ov002, class C, MED tier) — p_0100.
 * UNVERIFIED + ITERATION-EXPECTED. Per-parity slot scan, kind 14.
 * guard cf180, slot+0x418, count[row+0x14]. Gate:
 * b878(id) == b878(arg1) && 021c33e4(player,player,i) != 0.
 * id is consumed straight into b878 (orig does not bind it in a callee-saved reg);
 * b878(id) result held in sl across the second b878(arg1) call.
 */
typedef unsigned int u32;
struct Ov002Slot { u32 id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_0202b878(int id);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224bbd8(int player, int arg1) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    int i;
    if (*(u32 *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    for (i = 0; (u32)i < *(u32 *)(row + 0x14); i++) {
        if (func_0202b878(((struct Ov002Slot *)(row + 0x418))[i].id) ==
                func_0202b878(arg1) &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 14, i);
    }
}
