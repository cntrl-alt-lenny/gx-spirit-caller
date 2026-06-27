/* CAMPAIGN-PREP candidate for func_0224cac4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Cond-load arg; two scans bracket MMIO gate; do/while unsigned; id bitfield
 *   risk:       Orig predicated `ldreq r7,=cf180` (arg1==0x1629); mwcc will branch/unconditional-load not ldreq — permuter-class. Also LIT5/LIT6 const args truncated — struct-guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224cac4 (ov002, class D, MED tier) — brief p_0066.
 * UNVERIFIED + ITERATION-EXPECTED (currently ships as .s; reg-alloc/scheduling
 * wall, brief 302). HARDEST in batch: two scans bracketing a middle MMIO gate,
 * with a CONDITIONALLY-loaded predicate arg (orig `ldreq r7,=cf180` only when
 * arg1==0x1629; r7 is otherwise undefined but still passed).
 *   recipe: cond-load arg; guard1 cf17c/row+0x260/limit row[0x10]/kind13; middle gate 021bb068 + 021bae7c(player,?,-1) early-return; guard2 cf180/row+0x418/limit row[0x14]/kind14; getter func_0202df78(id, arg); do/while unsigned; Ov002Slot.id bitfield
 * NOTE: LIT5/LIT6 (args to 021bb068 / 021bae7c) truncated from the pool dump —
 *       represented as inferred constants ARG_021BB068 / ARG_021BAE7C; CONFIRM.
 */
#include "ov002_core.h"
extern int func_0202df78(int id, int arg);
extern int func_ov002_021bae7c(int player, int arg, int c);
extern int func_ov002_021bb068(int arg);
extern int data_ov002_022cf180[];
#define ARG_021BB068 0      /* TODO confirm: _LIT5 pool word (truncated) */
#define ARG_021BAE7C 0      /* TODO confirm: _LIT6 pool word (truncated) */
void func_ov002_0224cac4(int player, int arg1) {
    char *row;
    int i;
    int sel;            /* r7: predicate arg, conditionally loaded */
    if (arg1 == 0x1629)
        sel = (int)data_ov002_022cf180;
    row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    i = 0;
    if (*(u32 *)((char *)data_ov002_022cf17c + (player & 1) * 0x868) != 0) {
        do {
            if (func_0202df78(((struct Ov002Slot *)(row + 0x260))[i].id, sel) != 0)
                func_ov002_02253458(player, 13, i);
            i++;
        } while (i < *(u32 *)(row + 0x10));
    }
    if (func_ov002_021bb068(ARG_021BB068) != 0) {
        if (func_ov002_021bae7c(player, ARG_021BAE7C, -1) == 0)
            return;
    }
    row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
    i = 0;
    if (*(u32 *)((char *)data_ov002_022cf180 + (player & 1) * 0x868) == 0)
        return;
    do {
        if (func_0202df78(((struct Ov002Slot *)(row + 0x418))[i].id, sel) != 0)
            func_ov002_02253458(player, 14, i);
        i++;
    } while (i < *(u32 *)(row + 0x14));
}
