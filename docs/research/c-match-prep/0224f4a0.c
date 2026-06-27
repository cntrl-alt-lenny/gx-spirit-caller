/* CAMPAIGN-PREP candidate for func_0224f4a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     SINGLE load -> id+tag both raw shifts; strh result to ce288[0x48c]+0xc THEN reload ce288[0x48c] (don't bind)
 *   risk:       id is symmetric (word<<19)>>19: orig keeps lsl#19;lsr#19 but mwcc folds raw shifts to a single `and #0x1fff`. reshape-able only via a :13 bitfield, which forces a 2nd ldr (orig uses one) -- pick one miss.
 *   confidence: low
 */
/* func_ov002_0224f4a0: decode slot word arr[idx] at (player row)+0x120 (ONE
 * load -> id and packed tag); if id live (func_0202e234) and func_021ca5bc(tag)
 * pass, resolve func_021c38c4(player,tag), STORE it as the halfword at
 * ce288[0x48c]+0xc, then RELOAD ce288[0x48c] and if func_02257ab8 passes post
 * list event 0xb. (cls D: store-order strh + reload-not-bind + asymmetric tag.) */
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022cf16c[];              /* row table 0x868/player (_LIT0) */
extern char data_ov002_022ce288[];              /* ptr table (_LIT2), +0x48c -> obj */

extern int func_0202e234(int id);
extern int func_ov002_021ca5bc(int tag);
extern int func_ov002_021c38c4(int player, int tag);
extern int func_ov002_02257ab8(int obj, int player);
extern int func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224f4a0(int player, int unused, int idx) {
    u32 word;
    int id;
    int tag;
    int result;
    word = ((u32 *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x120))[idx];
    id = (int)((word << 19) >> 19);
    tag = (((word << 2) >> 24) << 1) + ((word << 18) >> 31);
    if (func_0202e234(id) == 0)
        return;
    if (func_ov002_021ca5bc(tag) == 0)
        return;
    result = func_ov002_021c38c4(player, tag);
    *(u16 *)(*(int *)(data_ov002_022ce288 + 0x48c) + 0xc) = (u16)result;
    if (func_ov002_02257ab8(*(int *)(data_ov002_022ce288 + 0x48c), player) == 0)
        return;
    func_ov002_02253458(player, 0xb, idx);
}
