/* CAMPAIGN-PREP candidate for func_0224f9c0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-symbol count reloc; :13 bitfield; unsigned guard+loop; reload count
 *   risk:       callee-saved reg numbering (orig i=r4,cur=r5,block=r6,id=r9) — permuter-class; minor reshape-able: guard ldmls vs eq if mwcc folds (unsigned)<=0 to ==0.
 *   confidence: med
 */
/* func_ov002_0224f9c0 (ov002, D) — bitfield table loop, predicate chain.
 * block = data_ov002_022cf16c + (player&1)*0x868. Count guard read via the
 * SEPARATE symbol data_ov002_022cf17c (== block+0x10) so two relocs emit;
 * loop bound re-reads block[+0x10] each iter (calls force reload). Both reads
 * unsigned -> guard ldmls (cmp#0,LS) and loop bcc (unsigned lower).
 * cursor = block+0x260, stride 4, each elem .id is a :13 bitfield.
 * For i in 0..count-1: id=cur->id; if 0202e234(id) && 0202b8a8(id)==4 &&
 *   021ca440(player,id) -> 02253458(player, 0xd, i). */
struct Ov002Slot { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int  func_0202e234(int id);
extern int  func_0202b8a8(int id);
extern int  func_ov002_021ca440(int player, int id);
extern void func_ov002_02253458(int player, int a, int b);

void func_ov002_0224f9c0(int player) {
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
            func_0202b8a8(id) == 4 &&
            func_ov002_021ca440(player, id) != 0) {
            func_ov002_02253458(player, 0xd, i);
        }
        cur++;
    }
}
