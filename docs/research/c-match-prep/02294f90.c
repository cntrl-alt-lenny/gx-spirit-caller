/* CAMPAIGN-PREP candidate for func_02294f90 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     opposite-bank score guard; signed /2 via plain '/'; two cond-return tails
 *   risk:       orig reloads turn halfword 3x (ldrh per use) and holds v in r0 reusing asr#1 for both cmp and >1000; if mwcc binds turn or spills v/2 the reloads/cmp diverge. reshape-able (don't bind turn; let '/' fold)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02294f90 (ov002, class D, MED tier).
 * Recipe: opposite-bank score guard; signed v/2 (add r0,r0,lsr#31;asr#1); two-tail (<=score, >1000).
 * Struct family confirmed from sibling 02294bb4/02294e40: Entity{u16 id; u16 turn:1;}, BankData[2] stride 0x868, score at +0.
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
extern int func_ov002_022576d8(int e);
extern int func_ov002_0228c864(int side, int rec, void *cb);
extern int func_ov002_021c848c(int side);
extern int func_ov002_0228db8c();

int func_ov002_02294f90(Entity *e) {
    int rec = func_ov002_022576d8((int)e);
    int v;
    if (func_ov002_0228c864(1 - e->turn, rec, func_ov002_0228db8c) < 0)
        return 0;
    v = func_ov002_021c848c(1 - e->turn);
    if (data_ov002_022cf16c[(1 - e->turn) & 1].score <= v / 2)
        return 1;
    if (v / 2 > 0x3e8)
        return 1;
    return 0;
}
