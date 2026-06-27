/* CAMPAIGN-PREP candidate for func_0220c160 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :6 type guard, :1 reload table index (mul 0x868), tail call
 *   risk:       reshape-able: func ptr literal func_0202f050 passed as 2nd arg must keep r1 (ldr _LIT0) interleaved with bit0; if mwcc reorders the ldr, a scheduling diff (move the arg expression earlier)
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

extern Cat data_ov002_022cf17c[2];

extern void func_0202f050(void);
extern s32 func_ov002_021bc000(s32 a, void (*fn)(void));
extern s32 func_ov002_021ff354(Card *s, s32 arg1);

s32 func_ov002_0220c160(Card *s, s32 arg1) {
    if (s->type6 != 0x23) {
        if (!func_ov002_021bc000(s->b0, func_0202f050)) {
            return 0;
        }
    }
    if (data_ov002_022cf17c[s->b0].flag == 0) {
        return 0;
    }
    return func_ov002_021ff354(s, arg1);
}
