/* CAMPAIGN-PREP candidate for func_0220c5fc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: sparse switch cmp-chain (6,f,16 source order), two 0x868/0x14 mla arms
 *   risk:       permuter-class: each arm's b0*0x868 mla + sub5*0x14 mul shuffles r4/ip/lr differently between the two arms in orig (register rotation); a C reshape won't force the per-arm reg pairing. Branch order matched via ascending cases
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

typedef struct Entry { s32 f0; u16 _4[8]; } Entry;      /* sizeof 0x14 */
typedef struct Cat { Entry e[107]; u16 _t[6]; } Cat;    /* sizeof 0x868 */

extern Cat data_ov002_022cf1a8[2];

extern s32 func_ov002_0220736c(Card *s);
extern s32 func_ov002_02207a70(Card *s);

s32 func_ov002_0220c5fc(Card *s) {
    switch (s->type6) {
    case 0x6:
        return 1;
    case 0xf:
        if (!(data_ov002_022cf1a8[s->b0].e[s->sub5].f0 & 0x2)) {
            return 0;
        }
        return func_ov002_0220736c(s);
    case 0x16:
        if (!(data_ov002_022cf1a8[s->b0].e[s->sub5].f0 & 0x4)) {
            return 0;
        }
        return func_ov002_02207a70(s);
    }
    return 0;
}
