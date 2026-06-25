/* CAMPAIGN-PREP candidate for func_0224abcc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     off-bind row; :13 id; e234 then 021c988c(player,15,i) guard; kind-15 const
 *   risk:       orig loads kind 15 into TWO regs (r8 for sink, r9 mirror for predicate); mwcc may keep one reg and re-mov, flipping r8/r9 use. permuter-class (const-reg mirror, no C reshape forces a second live copy).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224abcc (ov002, class C, MED tier) — p_0100.
 * UNVERIFIED + ITERATION-EXPECTED. Per-parity slot scan, two predicate guards, kind 15.
 * guard cf188, slot+0x5d0, count[row+0x1c]. Note kind 15 passed to BOTH the
 * 021c988c predicate (r1) and the sink (r1): one shared constant register (r8/r9).
 */
typedef unsigned int u32;
struct Ov002Slot { u32 id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf188[];
extern int func_0202e234(int id);
extern int func_ov002_021c988c(int a, int b, int c);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224abcc(int player) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    int i;
    if (*(u32 *)((char *)data_ov002_022cf188 + (player & 1) * 0x868) == 0)
        return;
    for (i = 0; (u32)i < *(u32 *)(row + 0x1c); i++) {
        if (func_0202e234(((struct Ov002Slot *)(row + 0x5d0))[i].id) != 0 &&
            func_ov002_021c988c(player, 15, i) != 0)
            func_ov002_02253458(player, 15, i);
    }
}
