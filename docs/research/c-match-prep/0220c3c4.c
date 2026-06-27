/* CAMPAIGN-PREP candidate for func_0220c3c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: 2-D index (b0*0x868 mla + sub5*0x14 mul), :6 f4 bitfield arg
 *   risk:       struct-guessed: outer sizeof 0x868 and Entry 0x14 inferred (pad makes 0x868 exact); orig computes and#1/mul0x14/mla in that exact order — if mwcc evaluates sub5 index before b0, the mul/mla register pairing rotates (permuter-class)
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
    /* 0x04 */ u16 f4lo : 9;
    u16 f4mid : 6;
    u16 f4hi : 1;
} Card;

typedef struct Entry {
    /* 0x00 */ u16 f0;
    u16 _2[9];
} Entry; /* sizeof == 0x14 */

typedef struct Cat {
    /* 0x00 */ Entry entries[107];
    u16 _tail[6]; /* pad so sizeof == 0x868 */
} Cat;

extern Cat data_ov002_022cf1a0[2];

extern s32 func_ov002_021b86f4(s32 arg1, s32 b);

s32 func_ov002_0220c3c4(Card *s, s32 arg1) {
    if (!arg1) {
        return 0;
    }
    if (data_ov002_022cf1a0[s->b0].entries[s->sub5].f0 == 0) {
        return 0;
    }
    return func_ov002_021b86f4(arg1, s->f4mid);
}
