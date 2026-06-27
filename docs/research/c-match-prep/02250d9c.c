/* CAMPAIGN-PREP candidate for func_02250d9c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id :13 bitfield; word reloaded for asymmetric (<<2>>24)/(<<18>>31) unpack; mla index
 *   risk:       Compiled+disasm: NEAR-EXACT (mla/popeq/popne/popgt all match). Sole diff: unpack combine emits add r1,bit,field,lsl#1 vs orig separate mov lsl#1 + add ...,lsr#31. reshape-able-finicky.
 *   confidence: med
 */
/* func_ov002_02250d9c: single slot [0x120] guard-chain; addr-unpack of the
 * packed slot word forwarded to func_ov002_021c38c4. */
struct Ov002Slot { unsigned int id : 13; };
extern int func_0202b878(int a);
extern int func_0202e234(int a);
extern int func_ov002_021c38c4(int player, int a);
extern int func_ov002_021ca440(int player, int id);
extern int func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf16c[];
void func_ov002_02250d9c(int player, int arg1, int idx) {
    char *p = data_ov002_022cf16c + (player & 1) * 0x868 + 0x120;
    int id = ((struct Ov002Slot *)(p + idx * 4))->id;
    int word;
    int v;
    if (func_0202e234(id) == 0)
        return;
    if (func_0202b878(id) != 7)
        return;
    word = *(int *)(p + idx * 4);
    v = (((unsigned int)(word << 2) >> 24) << 1) + ((unsigned int)(word << 18) >> 31);
    if (func_ov002_021c38c4(player, v) > 2)
        return;
    if (func_ov002_021ca440(player, id) == 0)
        return;
    func_ov002_02253458(player, 0xb, idx);
}
