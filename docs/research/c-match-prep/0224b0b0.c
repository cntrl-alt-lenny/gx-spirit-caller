/* CAMPAIGN-PREP candidate for func_0224b0b0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     off-bind row; :13 id bound across 3 getters; <=4 (bgt-skip) && ==0xf chain
 *   risk:       b8a8(id)<=4 is signed cmp #4;bgt-skip — if mwcc emits movgt/predication or hoists the third compare the branch layout diverges; id must stay bound in r9. reshape-able (id local + && order).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224b0b0 (ov002, class C, MED tier) — p_0100.
 * UNVERIFIED + ITERATION-EXPECTED. Per-parity slot scan, three getter guards, kind 13.
 * guard cf17c, slot+0x260, count[row+0x10]. id held in r9 across e234/b8a8/b878.
 * Gate: e234(id)!=0 && b8a8(id)<=4 && b878(id)==0xf.
 */
typedef unsigned int u32;
struct Ov002Slot { u32 id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int func_0202b878(int id);
extern int func_0202b8a8(int id);
extern int func_0202e234(int id);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224b0b0(int player) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    int i;
    int id;
    if (*(u32 *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) == 0)
        return;
    for (i = 0; (u32)i < *(u32 *)(row + 0x10); i++) {
        id = ((struct Ov002Slot *)(row + 0x260))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202b8a8(id) <= 4 &&
            func_0202b878(id) == 0xf)
            func_ov002_02253458(player, 13, i);
    }
}
