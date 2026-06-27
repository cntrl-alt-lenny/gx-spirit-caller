/* CAMPAIGN-PREP candidate for func_0224b3b0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     off-bind row; :13 id; e234 && de9c==0 && 021c33e4(player,player,i) chain
 *   risk:       de9c(id)==0 is cmp#0;bne-skip (proceed on zero) — && polarity should match; id bound in r9 across e234/de9c. permuter-class only if the 3-guard branch chain schedules differently; else reshape-able.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224b3b0 (ov002, class C, MED tier) — p_0100.
 * UNVERIFIED + ITERATION-EXPECTED. Per-parity slot scan, three guards, kind 14.
 * guard cf180, slot+0x418, count[row+0x14]. id held in r9. Gate:
 * e234(id)!=0 && de9c(id)==0 && 021c33e4(player,player,i)!=0. Note 021c33e4 takes
 * (player,player,i) not id.
 */
typedef unsigned int u32;
struct Ov002Slot { u32 id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_0202de9c(int id);
extern int func_0202e234(int id);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224b3b0(int player) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    int i;
    int id;
    if (*(u32 *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    for (i = 0; (u32)i < *(u32 *)(row + 0x14); i++) {
        id = ((struct Ov002Slot *)(row + 0x418))[i].id;
        if (func_0202e234(id) != 0 &&
            func_0202de9c(id) == 0 &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 14, i);
    }
}
