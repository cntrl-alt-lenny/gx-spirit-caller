/* CAMPAIGN-PREP candidate for func_02250234 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-symbol count reloc; paired f(id)==f(arg1) calls; bitfield key; 0x5dc thresh
 *   risk:       0x5dc constant: orig sub fp,#0x28c from the live 0x868 reg vs a literal ldr — codegen artifact, permuter-class (no C reshape forces sub-from-0x868). 10 callee regs + key fusion add to drift.
 *   confidence: low
 */
/* func_ov002_02250234 (ov002, D) — bitfield loop, many predicate calls.
 * block = data_022cf16c + (player&1)*0x868; guard via data_022cf17c (== +0x10).
 * cursor = block+0x260 stride 4 (.id :13); bound = block+0x10.
 * threshold 0x5dc = 0x868-0x28c (orig materialises via sub from live 0x868).
 * For i: id=cur->id; if 0202e234(id) && 0202b950(id)<=0x5dc &&
 *   0202b890(id)==0202b890(arg1) && 0202b878(id)==0202b878(arg1) &&
 *   021ca440(player,id) &&
 *   021b3fd8(player,0xb,0x12a1, key)==0  -> 02253458(player,0xd,i).
 *   key = ((e>>22)&0xff)*2 + ((e>>13)&1) (hi8:8@b22, b13:1@b13). */
struct Ov002Slot {
    unsigned int id : 13;
    unsigned int b13 : 1;
    unsigned int : 8;
    unsigned int hi8 : 8;
    unsigned int : 2;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int  func_0202e234(int id);
extern int  func_0202b950(int id);
extern int  func_0202b890(int x);
extern int  func_0202b878(int x);
extern int  func_ov002_021ca440(int player, int id);
extern int  func_ov002_021b3fd8(int player, int a, int b, int key);
extern void func_ov002_02253458(int player, int a, int b);

void func_ov002_02250234(int player, int arg1) {
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
            func_0202b950(id) <= 0x5dc &&
            func_0202b890(id) == func_0202b890(arg1) &&
            func_0202b878(id) == func_0202b878(arg1) &&
            func_ov002_021ca440(player, id) != 0 &&
            func_ov002_021b3fd8(player, 0xb, 0x12a1, cur->hi8 * 2 + cur->b13) == 0) {
            func_ov002_02253458(player, 0xd, i);
        }
        cur++;
    }
}
