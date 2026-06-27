/* CAMPAIGN-PREP candidate for func_0224fd94 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hi8:8@b22 + b13:1 bitfields => key=hi8*2+b13; reload elem; +0x418 two-add
 *   risk:       packed-decode shift-fusion (orig add r0,r0,e<<18,lsr#31 reusing the <<18 temp) — reshape-able via bitfield order shown; also +0x418 add-split order (orig #0x18 then #0x400) may flip — permuter-class.
 *   confidence: low
 */
/* func_ov002_0224fd94 (ov002, D) — bitfield loop + inline packed-field compare.
 * block = data_022cf16c + (player&1)*0x868; guard via data_022cf180 (== +0x14).
 * cursor = block+0x18+0x400 (= +0x418) stride 4; .id :13. elem reloaded for the
 * packed decode:  key = ((e>>22)&0xff)*2 + ((e>>13)&1)  (hi8:8 at b22, b13:1).
 * For i in 0..count-1 (bound block+0x14):
 *   id=cur->id; if 0202e234(id) && 0202b8a8(id)<=4 && 021b9128(id,5) &&
 *   key != arg2 && 021c33e4(player,player,i) -> 02253458(player,0xe,i). */
struct Ov002Slot {
    unsigned int id : 13;          /* (e<<19)>>19 */
    unsigned int b13 : 1;          /* bit 13 */
    unsigned int : 8;
    unsigned int hi8 : 8;          /* bits [29:22], via (e<<2)>>24 */
    unsigned int : 2;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_0202e234(int id);
extern int  func_0202b8a8(int id);
extern int  func_ov002_021b9128(int id, int k);
extern int  func_ov002_021c33e4(int a, int b, int i);
extern void func_ov002_02253458(int player, int a, int b);

void func_ov002_0224fd94(int player, int arg1, int arg2) {
    int i;
    char *block;
    struct Ov002Slot *cur;
    int id;
    int key;

    if (*(unsigned int *)(data_ov002_022cf180 + (player & 1) * 0x868) <= 0)
        return;
    block = data_ov002_022cf16c + (player & 1) * 0x868;
    cur = (struct Ov002Slot *)(block + 0x18 + 0x400);
    for (i = 0; (unsigned int)i < *(unsigned int *)(block + 0x14); i++) {
        id = cur->id;
        if (func_0202e234(id) != 0 &&
            func_0202b8a8(id) <= 4 &&
            func_ov002_021b9128(id, 5) != 0) {
            key = cur->hi8 * 2 + cur->b13;
            if (key != arg2 &&
                func_ov002_021c33e4(player, player, i) != 0) {
                func_ov002_02253458(player, 0xe, i);
            }
        }
        cur++;
    }
}
