/* CAMPAIGN-PREP candidate for func_022963c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard &&-chain; turn:1 reloaded per call (no bind); final movge/movlt bool >=3
 *   risk:       orig reloads turn (ldrh;lsl#31;lsr#31) before EACH of the 3 calls; if mwcc CSE-hoists e->turn into one reg the three reloads collapse to one -> diverge. reshape-able (keep e->turn inline; do not introduce a local)
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_022963c4 (ov002, class D-light, MED tier).
 * Recipe: clean guard chain over turn (bit0). f02259f74(turn)==0 ->0; f02280980(turn)<=0 ->0; return f021bbf50(1-turn)>=3.
 * turn reloaded (ldrh) at each call -> do not bind to a local.
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

extern int func_ov002_02259f74(int side);
extern int func_ov002_02280980(int side);
extern int func_ov002_021bbf50(int side);

int func_ov002_022963c4(Entity *e) {
    if (func_ov002_02259f74(e->turn) == 0)
        return 0;
    if (func_ov002_02280980(e->turn) <= 0)
        return 0;
    return func_ov002_021bbf50(1 - e->turn) >= 3;
}
