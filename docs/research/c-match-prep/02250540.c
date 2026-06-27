/* CAMPAIGN-PREP candidate for func_02250540 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-symbol count reloc; :13 bitfield; unsigned guard+loop; <=4 not <4 (bgt)
 *   risk:       callee-saved reg numbering (i=r4,cur=r5,block=r6,id=r9) — permuter-class coin; minor reshape-able: guard cmp#0 ls vs eq if mwcc folds (unsigned)<=0. Structurally simple, should match cleanly otherwise.
 *   confidence: med
 */
/* func_ov002_02250540 (ov002, D) — bitfield loop, three predicate guards.
 * block = data_022cf16c + (player&1)*0x868; guard via data_022cf17c (== +0x10).
 * cursor = block+0x260 stride 4 (.id :13); bound = block+0x10.
 * For i: id=cur->id; if 0202e234(id) && 0202ef38(id) && 0202b8a8(id)<=4
 *   -> 02253458(player,0xd,i). */
struct Ov002Slot { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int  func_0202e234(int id);
extern int  func_0202ef38(int id);
extern int  func_0202b8a8(int id);
extern void func_ov002_02253458(int player, int a, int b);

void func_ov002_02250540(int player) {
    int i;
    char *block;
    struct Ov002Slot *cur;
    int id;

    if (*(unsigned int *)(data_ov002_022cf17c + (player & 1) * 0x868) <= 0)
        return;
    block = data_ov002_022cf16c + (player & 1) * 0x868;
    cur = (struct Ov002Slot *)(block + 0x260);
    for (i = 0; (unsigned int)i < *(unsigned int *)(block + 0x10); i++) {
        id = cur->id;
        if (func_0202e234(id) != 0 &&
            func_0202ef38(id) != 0 &&
            func_0202b8a8(id) <= 4) {
            func_ov002_02253458(player, 0xd, i);
        }
        cur++;
    }
}
