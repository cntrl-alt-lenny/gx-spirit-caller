/* CAMPAIGN-PREP candidate for func_0224aa14 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     off-bind row; :13 id; id bound in callee-saved across 3 calls; &&-chain
 *   risk:       orig holds id in sl across e234/b890/b9128; if mwcc reloads id from slot the bitfield re-extract diverges. arg1 lives in r7 across loop — reload-vs-bind of b890(arg1). reshape-able (bind id to local).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224aa14 (ov002, class C, MED tier) — p_0100.
 * UNVERIFIED + ITERATION-EXPECTED. Per-parity slot scan: keep slots whose id passes
 * func_0202e234, then func_ov002_021b9128(id, func_0202b890(arg1)). Posts kind 14.
 * guard cf180, slot+0x418, count[row+0x14]. id held in callee-saved (sl) across calls.
 */
typedef unsigned int u32;
struct Ov002Slot { u32 id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_0202b890(int a);
extern int func_0202e234(int id);
extern int func_ov002_021b9128(int id, int b);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224aa14(int player, int arg1) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    int i;
    int id;
    if (*(u32 *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    for (i = 0; (u32)i < *(u32 *)(row + 0x14); i++) {
        id = ((struct Ov002Slot *)(row + 0x418))[i].id;
        if (func_0202e234(id) != 0 &&
            func_ov002_021b9128(id, func_0202b890(arg1)) != 0)
            func_ov002_02253458(player, 14, i);
    }
}
