/* CAMPAIGN-PREP candidate for func_0224ef84 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     do/while + :13 bitfield (lsl;lsr) + reload count base[0x14] via separate cf180 alias
 *   risk:       do/while-vs-for loop shape: orig falls straight into body (no top branch); if mwcc emits a for-style pre-test the loop header diverges. reshape-able (do/while chosen).
 *   confidence: med
 */
/* func_ov002_0224ef84: scan the (player&1) row table's +0x418 slot array;
 * for each slot whose :13 id passes func_0202e2e0 and func_021c33e4,
 * post list event 0xe via func_02253458. (cls D: lsl#19;lsr#19 :13 bitfield,
 * count reloaded each iter, do/while.) */
typedef unsigned int u32;

struct Slot13 { unsigned int id : 13; };        /* 4-byte element, lsl#19;lsr#19 */

extern char data_ov002_022cf16c[];              /* row table, 0x868/player (_LIT2) */
extern char data_ov002_022cf180[];              /* count table alias = cf16c+0x14 (_LIT1) */

extern int func_0202e2e0(int id);
extern int func_ov002_021c33e4(int player, int self, int idx);
extern int func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224ef84(int player) {
    char *base;
    struct Slot13 *p;
    int i;
    if (*(int *)(data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    base = data_ov002_022cf16c + (player & 1) * 0x868;
    p = (struct Slot13 *)(base + 0x418);
    i = 0;
    do {
        if (func_0202e2e0(p->id) != 0 &&
            func_ov002_021c33e4(player, player, i) != 0)
            func_ov002_02253458(player, 0xe, i);
        p++;
    } while (++i < *(int *)(base + 0x14));
}
