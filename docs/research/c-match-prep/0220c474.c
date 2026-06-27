/* CAMPAIGN-PREP candidate for func_0220c474 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :6==5 gate, two guards inside, fall-through shared return 1
 *   risk:       reshape-able: both the type6!=5 path and the success path return 1 via the same .L_64 mov; if mwcc splits them, restructure so only the two guards return 0 (already structured this way). Table mul-0x868 struct-guessed
 *   confidence: med
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

typedef struct Cat {
    /* 0x00 */ s32 flag;
    /* ... opaque, sizeof == 0x868 */
} Cat;

extern Cat data_ov002_022cf180[2];

extern s32 func_ov002_021ca698(s32 a, s32 b);

s32 func_ov002_0220c474(Card *s) {
    if (s->type6 == 0x5) {
        if (!func_ov002_021ca698(s->b0, s->b0)) {
            return 0;
        }
        if (data_ov002_022cf180[s->b0].flag == 0) {
            return 0;
        }
    }
    return 1;
}
