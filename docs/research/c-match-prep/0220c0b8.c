/* CAMPAIGN-PREP candidate for func_0220c0b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :1 bitfield reload, 0x868-stride struct array, unsigned do-while
 *   risk:       struct-guessed: count read uses two distinct symbols (cf178 first, cf16c+0xc in-loop) 0xc apart; same field, but addressing-mode (base+offset mul vs +0xc mla) may not split that way
 *   confidence: low
 */
typedef unsigned short u16;
typedef int s32;

typedef struct Card {
    /* 0x00 */ u16 id;
    /* 0x02 */ u16 b0 : 1;
    u16 sub5 : 5;
    u16 type6 : 6;
    u16 pad : 4;
} Card;

typedef unsigned int u32;

typedef struct Cat {
    /* 0x00 */ s32 _0;
    s32 _4;
    s32 _8;
    /* 0x0c */ u32 count;
    /* ... opaque, sizeof == 0x868 */
} Cat;

extern Cat data_ov002_022cf16c[2];

extern s32 func_ov002_021ca698(s32 a, s32 b);
extern s32 func_ov002_022536e8(s32 a, u16 id, u32 i);

s32 func_ov002_0220c0b8(Card *s) {
    u32 i;

    if (!func_ov002_021ca698(s->b0, s->b0)) {
        return 0;
    }
    i = 0;
    if (data_ov002_022cf16c[s->b0].count != 0) {
        do {
            if (func_ov002_022536e8(s->b0, s->id, i)) {
                return 1;
            }
            i++;
        } while (i < data_ov002_022cf16c[s->b0].count);
    }
    return 0;
}
