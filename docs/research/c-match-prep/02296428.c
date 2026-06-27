/* CAMPAIGN-PREP candidate for func_02296428 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     opposite-bank score guard; same-side calls; pass func_0202e42c as cb ptr; >=2 bool
 *   risk:       orig holds turn in r0 across the (1-turn)-bank score load+cmp then reuses r0 for f02259f74(turn); if mwcc reloads turn after the score access an extra ldrh appears. reshape-able (single e->turn read feeding both, or keep inline and trust CSE)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02296428 (ov002, class D, MED tier).
 * Recipe: opposite-bank score>0x7d0 ->0; f02259f74(turn)==0 ->0; return f021bc000(turn, &func_0202e42c)>=2.
 * turn (r0) is held across the score index/cmp then reused for f02259f74. f021bc000 sig from sibling 021bc000.
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

typedef struct BankData {
    int score;
    char _pad[0x868 - 4];
} BankData;

extern BankData data_ov002_022cf16c[2];
extern int func_ov002_02259f74(int side);
extern int func_ov002_021bc000(int side, int (*cb)(int));
extern int func_0202e42c(int x);

int func_ov002_02296428(Entity *e) {
    if (data_ov002_022cf16c[(1 - e->turn) & 1].score > 0x7d0)
        return 0;
    if (func_ov002_02259f74(e->turn) == 0)
        return 0;
    return func_ov002_021bc000(e->turn, func_0202e42c) >= 2;
}
