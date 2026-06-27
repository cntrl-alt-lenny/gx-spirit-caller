/* CAMPAIGN-PREP candidate for func_0220c1e4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: linear bl-guard chain, :1 reload each call, signed <3 cmp
 *   risk:       reshape-able: final two bb90c calls could compile as `return a()||b()` and share the type6==0x23 mov #1 block differently; if branch targets diverge, rewrite the last two as explicit ifs returning 1 (already done) or as ||
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

extern s32 func_ov002_02206a98(Card *s);
extern s32 func_ov002_021ca2b8(s32 a);
extern s32 func_ov002_021ca3f0(s32 a, s32 id);
extern s32 func_ov002_021bc618(s32 a);
extern s32 func_ov002_021bb90c(s32 a, s32 id);

s32 func_ov002_0220c1e4(Card *s) {
    if (!func_ov002_02206a98(s)) {
        return 0;
    }
    if (!func_ov002_021ca2b8(s->b0)) {
        return 0;
    }
    if (!func_ov002_021ca3f0(s->b0, 0x19ba)) {
        return 0;
    }
    if (func_ov002_021bc618(s->b0) < 3) {
        return 0;
    }
    if (s->type6 == 0x23) {
        return 1;
    }
    if (func_ov002_021bb90c(s->b0, 0x19a3)) {
        return 1;
    }
    if (func_ov002_021bb90c(s->b0, 0x19a4)) {
        return 1;
    }
    return 0;
}
