/* CAMPAIGN-PREP candidate for func_02208ad4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag0 read AFTER type6 branch (not hoisted); f21/low16 bitfields; unsigned low16<0xbb8
 *   risk:       low16<0xbb8 is unsigned (movhi): orig compares `cmp 0xbb8,low16;movhi` (const-first). mwcc may emit `cmp low16,#0xbb8;blo` — same semantics, different cmp operand order. reshape-able (works either way) / minor.
 *   confidence: med
 */
/* func_ov002_02208ad4 (ov002, D) — bitfield equality guards + two same-call.
 *   type6=(attr>>6)&0x3f ; if(type6 != 0xf) return 0
 *   w14=word@+0x14 ; flag0=attr bit0
 *   if(((w14>>21)&1) != flag0) return 0                    (f21, lsl#a lsr#1f)
 *   low16 = w14 & 0xffff ; if(low16 < 0xbb8) return 0      (cmp 0xbb8,low16;movhi 0)
 *   if(!func_021ca698(flag0, 0)) return 0
 *   reload attr; return func_021ca698(flag0, 1) ? 1 : 0.
 * flag0 held in r0 across the low16 guard then reused as 1st call arg; attr
 * reloaded for the 2nd call. low16 cmp is unsigned (movhi). f21 @bit21 & low16
 * @bit0..15 do not overlap. */
struct Obj {
    unsigned short u0;
    unsigned short flag0 : 1, : 5, type6 : 6, : 4;   /* +0x2 */
    unsigned short u4;
    char pad6[0x14 - 0x6];
    unsigned low16 : 16, : 5, f21 : 1, : 10;         /* +0x14 */
};

extern int func_ov002_021ca698(int, int);

int func_ov002_02208ad4(struct Obj *card) {
    int flag0;
    if (card->type6 != 0xf) return 0;
    flag0 = card->flag0;
    if ((int)card->f21 != flag0) return 0;
    if (card->low16 < 0xbb8) return 0;
    if (!func_ov002_021ca698(flag0, 0)) return 0;
    return func_ov002_021ca698(card->flag0, 1) != 0;
}
