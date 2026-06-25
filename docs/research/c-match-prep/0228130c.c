/* CAMPAIGN-PREP candidate for func_0228130c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two separate b8c0 calls (don't cache); :13 bitfield; ternary !=?1:0; slot[5..9] loop
 *   risk:       orig calls b8c0(kind) TWICE — must stay two `bl`; the +0xf8 (slot10) field offset is struct-guessed. Mostly reshape-able (split call already done)
 *   confidence: med
 */
/* func_ov002_0228130c (ov002, cls C) — call-guard chain + slot-id compare.
 * t=b8c0(kind): if t==2 return kind!=slot[10].id; if (b8c0(kind) again)==4
 * and b878(kind)==0x17 -> 02281920(player,0x19a3) else 02281920(player,0x19a4),
 * return 1 if nonzero; finally scan slots[5..9], return 0 if any id==kind,
 * else 1. Per-player base cf16c+(player&1)*0x868; id is :13 (lsl#19;lsr#19). */
extern char data_ov002_022cf16c[];
extern int  func_0202b878(int a);
extern int  func_0202b8c0(int a);
extern int  func_ov002_02281920(int player, int kind);

struct Ov002Slot { unsigned int id : 13; };

int func_ov002_0228130c(int player, int kind) {
    char *base = data_ov002_022cf16c + (player & 1) * 0x868;
    int i;
    if (func_0202b8c0(kind) == 2)
        return (kind != ((struct Ov002Slot *)(base + 0xf8))->id) ? 1 : 0;
    if (func_0202b8c0(kind) == 4) {
        if (func_0202b878(kind) == 0x17) {
            if (func_ov002_02281920(player, 0x19a3) != 0)
                return 1;
        } else {
            if (func_ov002_02281920(player, 0x19a4) != 0)
                return 1;
        }
    }
    for (i = 5; i < 0xa; i++) {
        if (kind == ((struct Ov002Slot *)(base + 0x30 + i * 0x14))->id)
            return 0;
    }
    return 1;
}
