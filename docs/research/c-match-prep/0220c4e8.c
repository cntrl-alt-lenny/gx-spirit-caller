/* CAMPAIGN-PREP candidate for func_0220c4e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: bound Gctx base, two 0x868/0x14 indices (one g->_4&1, one b0/sub5), tst
 *   risk:       permuter-class: first index block packs 0x14/0x868/two bases into r2/r3/ip/lr — register rotation in the mla-base-fusion is a coin-flip a C reshape won't pin. Also struct-guessed: Gctx _4/_8/idx offsets and dual entry widths (ldrh vs ldr) inferred
 *   confidence: low
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
} Card;

typedef struct EntryH { u16 f0; u16 _2[9]; } EntryH;      /* sizeof 0x14 */
typedef struct EntryW { s32 f0; u16 _4[8]; } EntryW;      /* sizeof 0x14 */
typedef struct CatH { EntryH e[107]; u16 _t[6]; } CatH;   /* sizeof 0x868 */
typedef struct CatW { EntryW e[107]; u16 _t[6]; } CatW;   /* sizeof 0x868 */

typedef struct Gctx {
    /* 0x00 */ u32 _0;
    /* 0x04 */ u32 _4;
    /* 0x08 */ u32 _8;
    u32 _c[5];
    /* 0x20 */ u32 idx;
} Gctx;

extern Gctx data_ov002_022cd3f4;
extern CatH data_ov002_022cf1a4[2];
extern CatW data_ov002_022cf1a8[2];

extern s32 func_ov002_021c92fc(void);

s32 func_ov002_0220c4e8(Card *s) {
    s32 mask;

    if (s->type6 != 0x14) {
        return 1;
    }
    if (data_ov002_022cd3f4._8 != 0) {
        return 0;
    }
    if (data_ov002_022cf1a4[data_ov002_022cd3f4._4 & 1]
            .e[data_ov002_022cd3f4.idx].f0 == 0) {
        return 0;
    }
    mask = func_ov002_021c92fc();
    return (data_ov002_022cf1a8[s->b0].e[s->sub5].f0 & mask) != 0;
}
