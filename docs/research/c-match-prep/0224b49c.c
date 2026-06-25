/* CAMPAIGN-PREP candidate for func_0224b49c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if/elseif remap (cmp 0x1507; add#1; moveq); rv held r6; :13 id; ==rv && pred
 *   risk:       orig remap is `cmp #0x1507/beq; add#1;cmp;moveq;b` — mwcc's if/else-if may emit a different cmp/add pattern (uses 0x1507 + add#1 not two literals). rv uninitialised-else may warn. reshape-able (mirror add-1 form) / struct-guessed (0x3a0).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0224b49c (ov002, class C, MED tier) — p_0100.
 * UNVERIFIED + ITERATION-EXPECTED. Prologue id-remap (swap 0x1507<->0x1508), then a
 * per-parity scan tagging slots whose id == the remapped value AND 021ca3f0(player,rv).
 * guard cf184, kind 12, slot+0x3a0, count[row+0x18].
 * Remap: arg1==0x1507 -> 0x1508; arg1==0x1508 -> 0x1507; else r6 stays uninitialised
 * in orig (moveq only) — model as the two-case swap; rv held in r6 across the loop.
 */
typedef unsigned int u32;
struct Ov002Slot { u32 id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];
extern int func_ov002_021ca3f0(int a, int b);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224b49c(int player, int arg1) {
    char *row;
    int i;
    int rv;
    if (arg1 == 0x1507) {
        rv = 0x1508;
    } else if (arg1 == 0x1508) {
        rv = 0x1507;
    }
    row = data_ov002_022cf16c + (player & 1) * 0x868;
    if (*(u32 *)((char *)data_ov002_022cf184 + (player & 1) * 0x868) == 0)
        return;
    for (i = 0; (u32)i < *(u32 *)(row + 0x18); i++) {
        if ((u32)rv == ((struct Ov002Slot *)(row + 0x3a0))[i].id &&
            func_ov002_021ca3f0(player, rv) != 0)
            func_ov002_02253458(player, 12, i);
    }
}
