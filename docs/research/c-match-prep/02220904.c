/* CAMPAIGN-PREP candidate for func_02220904 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     scaled products via mla (no rec-bind); :1+:5 fields; OR/BIC store-back order kept
 *   risk:       struct-guessed: the discontiguous packed value (:8@22 + :1@13) is written as explicit shifts; mwcc may pick different lsl/lsr scheduling vs two real bitfields — campaign tunes the two field decls.
 *   confidence: med
 */
/* func_ov002_02220904 (ov002, D) — deck-table validate + bitfield store-back.
 * f2(@+2): a=:1 at bit0, b=:5 at bit1. rec = cf16c + a*0x868 + 0x30 + b*0x14
 * (separate scaled products, base via mla — do NOT bind rec to a local).
 * Load w=rec word; packed = ((w>>22)&0xff)<<1 + ((w>>13)&1) (discontiguous:
 * :8 at bit22 OR :1 at bit13). Compare to f4's :9 at bit6 ((f4<<0x11>>0x17)).
 * On match + arg1 valid + helper==1: f4 |= 2; then bit2 = bit1. */
typedef unsigned short u16;
struct Card { u16 f0; u16 f2; u16 f4; };
extern char data_ov002_022cf16c[];
extern int  func_0202f9e8(int x);

int func_ov002_02220904(struct Card *c, u16 *arg1) {
    int a = c->f2 & 1;
    int b = (c->f2 << 0x1a) >> 0x1b;
    int w = *(int *)(data_ov002_022cf16c + a * 0x868 + 0x30 + b * 0x14);
    int packed = (((w >> 22) & 0xff) << 1) + ((w >> 13) & 1);
    if (((c->f4 << 0x11) >> 0x17) != packed)
        return 0;
    if (arg1 != 0 && func_0202f9e8(*arg1) == 1) {
        u16 v = c->f4 | 0x2;
        c->f4 = (v & ~0x4) | (((v >> 1) & 1) << 2);
    }
    return 0;
}
