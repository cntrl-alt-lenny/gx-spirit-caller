/* CAMPAIGN-PREP candidate for func_022503d8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-symbol count reloc; :13 bitfield; 021b9ba0 takes cursor PTR not id; +0x418
 *   risk:       +0x418 add-split order (orig add #0x18 then #0x400; 0x418 not a single ARM imm) may flip to #0x400,#0x18 — permuter-class. Callee-saved numbering coin; guard ls-vs-eq minor reshape-able.
 *   confidence: med
 */
/* func_ov002_022503d8 (ov002, D) — bitfield table loop, predicate chain.
 * block = data_022cf16c + (player&1)*0x868; guard via data_022cf180 (== +0x14).
 * cursor = block+0x18+0x400 (= +0x418) stride 4 (.id :13); bound = block+0x14.
 * For i: id=cur->id; if 0202e234(id) && 0202eab0(id) && 021ca3f0(player,id) &&
 *   021b9ba0(cur)  -> 02253458(player,0xe,i).  NOTE 021b9ba0 takes the slot
 *   POINTER (r5), not the id. */
struct Ov002Slot { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_0202e234(int id);
extern int  func_0202eab0(int id);
extern int  func_ov002_021ca3f0(int player, int id);
extern int  func_ov002_021b9ba0(struct Ov002Slot *slot);
extern void func_ov002_02253458(int player, int a, int b);

void func_ov002_022503d8(int player) {
    int i;
    char *block;
    struct Ov002Slot *cur;
    int id;

    if (*(unsigned int *)(data_ov002_022cf180 + (player & 1) * 0x868) <= 0)
        return;
    block = data_ov002_022cf16c + (player & 1) * 0x868;
    cur = (struct Ov002Slot *)(block + 0x18 + 0x400);
    for (i = 0; (unsigned int)i < *(unsigned int *)(block + 0x14); i++) {
        id = cur->id;
        if (func_0202e234(id) != 0 &&
            func_0202eab0(id) != 0 &&
            func_ov002_021ca3f0(player, id) != 0 &&
            func_ov002_021b9ba0(cur) != 0) {
            func_ov002_02253458(player, 0xe, i);
        }
        cur++;
    }
}
