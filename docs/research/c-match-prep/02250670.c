/* CAMPAIGN-PREP candidate for func_02250670 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-symbol count reloc; :13 bitfield; unsigned guard+loop; minimal 2-guard chain
 *   risk:       simplest in batch — main risk callee-saved reg numbering (orig i=r4,cur=r5,block=r6,id=r9) permuter-class; minor reshape-able guard ls-vs-eq. Highest first-build odds of the loop family.
 *   confidence: med
 */
/* func_ov002_02250670 (ov002, D) — bitfield loop, two guards, simplest shape.
 * block = data_022cf16c + (player&1)*0x868; guard via data_022cf17c (== +0x10).
 * cursor = block+0x260 stride 4 (.id :13); bound = block+0x10.
 * For i: id=cur->id; if 0202effc(id) && 021ca440(player,id)
 *   -> 02253458(player,0xd,i). */
struct Ov002Slot { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int  func_0202effc(int id);
extern int  func_ov002_021ca440(int player, int id);
extern void func_ov002_02253458(int player, int a, int b);

void func_ov002_02250670(int player) {
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
        if (func_0202effc(id) != 0 &&
            func_ov002_021ca440(player, id) != 0) {
            func_ov002_02253458(player, 0xd, i);
        }
        cur++;
    }
}
