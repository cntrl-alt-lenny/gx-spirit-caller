/* CAMPAIGN-PREP candidate for func_0224fcd4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early arg2!=0 delegate; two-symbol count reloc; :13 bitfield; unsigned loop
 *   risk:       return-type guessed (orig leaves r0 from fb58/loop) — if caller ignores r0, void vs int is harmless; struct-guessed cursor +0x3a0. Reshape-able if wrong; callee-saved numbering permuter-class.
 *   confidence: med
 */
/* func_ov002_0224fcd4 (ov002, D) — bitfield table loop + tail-call delegate.
 * if (arg2 != 0) return func_0224fb58(player,arg1,arg2);  (bl + restore, not b).
 * else: block = data_022cf16c + (player&1)*0x868; guard via data_022cf184
 * (== block+0x18, two relocs); cursor = block+0x3a0 stride 4, .id :13.
 * For i: id=cur->id; if 0202b878(id)==1 && 021ca3f0(player,id) &&
 *   0223c918(player,id) -> 02253458(player, 0xc, i). bound = block+0x18. */
struct Ov002Slot { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];
extern int  func_0202b878(int id);
extern int  func_ov002_021ca3f0(int player, int id);
extern int  func_ov002_0223c918(int player, int id);
extern void func_ov002_02253458(int player, int a, int b);
extern int  func_ov002_0224fb58(int player, int arg1, int arg2);

int func_ov002_0224fcd4(int player, int arg1, int arg2) {
    int i;
    char *block;
    struct Ov002Slot *cur;
    int id;

    if (arg2 != 0)
        return func_ov002_0224fb58(player, arg1, arg2);

    if (*(unsigned int *)(data_ov002_022cf184 + (player & 1) * 0x868) <= 0)
        return 0;
    block = data_ov002_022cf16c + (player & 1) * 0x868;
    cur = (struct Ov002Slot *)(block + 0x3a0);
    for (i = 0; (unsigned int)i < *(unsigned int *)(block + 0x18); i++) {
        id = cur->id;
        if (func_0202b878(id) == 1 &&
            func_ov002_021ca3f0(player, id) != 0 &&
            func_ov002_0223c918(player, id) != 0) {
            func_ov002_02253458(player, 0xc, i);
        }
        cur++;
    }
    return 0;
}
