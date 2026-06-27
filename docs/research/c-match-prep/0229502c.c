/* CAMPAIGN-PREP candidate for func_0229502c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     same-side calls / opposite-side bank; plain '/2'; single score-LE tail
 *   risk:       asymmetry is load-bearing: calls pass turn but score reads (1-turn) bank; if a reshape 'simplifies' both to one side it breaks. divmod is plain '/2'. reshape-able (keep the turn vs 1-turn split exact)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229502c (ov002, class D, MED tier).
 * Recipe: same family as 02294f90 but calls use turn (NOT 1-turn); bank index is OPPOSITE (1-turn); single <=score tail (no >1000).
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

int func_ov002_0229502c(Entity *e) {
    int rec = func_ov002_022576d8((int)e);
    int v;
    if (func_ov002_0228c864(e->turn, rec, func_ov002_0228db8c) < 0)
        return 0;
    v = func_ov002_021c848c(e->turn);
    if (data_ov002_022cf16c[(1 - e->turn) & 1].score <= v / 2)
        return 1;
    return 0;
}
