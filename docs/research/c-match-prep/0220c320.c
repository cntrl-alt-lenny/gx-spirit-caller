/* CAMPAIGN-PREP candidate for func_0220c320 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :6 guard, bit21(f14)==b0 via unsigned lsl;lsr, mul-0x868 table
 *   risk:       reshape-able: orig holds field2 in r2 once then RE-loads for the table index; the (f14<<10)>>31 must stay unsigned (u32 f14) to emit lsr not asr — if signed, asr diverges. Compare-operand order bit21!=b0 fixed
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

typedef struct Card {
    /* 0x00 */ u16 id;
    /* 0x02 */ u16 b0 : 1;
    u16 sub5 : 5;
    u16 type6 : 6;
    u16 pad : 4;
    /* 0x04 */ u16 f4;
    /* 0x06 */ u16 _6;
    /* 0x08 */ u32 _8;
    /* 0x0c */ u32 _c;
    /* 0x10 */ u32 _10;
    /* 0x14 */ u32 f14;
} Card;

typedef struct Cat {
    /* 0x00 */ s32 flag;
    /* ... opaque, sizeof == 0x868 */
} Cat;

extern Cat data_ov002_022cf17c[2];

extern s32 func_ov002_021ff3bc(void);
extern s32 func_ov002_021ff354(Card *s, s32 arg1);

s32 func_ov002_0220c320(Card *s, s32 arg1) {
    if (s->type6 != 0xf) {
        return 0;
    }
    if (((s->f14 << 10) >> 31) != s->b0) {
        return 0;
    }
    if (!func_ov002_021ff3bc()) {
        return 0;
    }
    if (!func_ov002_021ff354(s, arg1)) {
        return 0;
    }
    return data_ov002_022cf17c[s->b0].flag != 0;
}
