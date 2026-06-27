/* CAMPAIGN-PREP candidate for func_02295fb8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f5:5 + f12:2 bitfields; bic/orr RMW :2 stores in source order; bit21 mask test
 *   risk:       orig holds the ENTRY halfword in lr and reuses it for the first bic/orr store (no reload), then reloads; mwcc emits a fresh ldrh before e->f12=1 -> off-by-one ldrh. permuter-class (C can't easily reuse the stale-equal lr value); else struct-guessed f5/f12 bit positions
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02295fb8 (ov002, class D, MED tier).
 * Recipe: index data_022cf1ac[(turn&1)] at f5*0x14 (f5 = bits1-5 of halfword), read word0, test bit21 -> return 0.
 * Then RMW e->f12(:2 @bits12-13)=1; call f02257ab8(e,1-turn); RMW e->f12=3; return res!=0. STORE-ORDER critical.
 * data_022cf1ac = data_022cf16c+0x40 (slot sub-array).
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
    unsigned short f5 : 5;     /* bits 1-5 */
    unsigned short : 6;        /* bits 6-11 */
    unsigned short f12 : 2;    /* bits 12-13 */
} Entity;

extern char data_ov002_022cf1ac[];
extern int func_ov002_02257ab8(int a, int b);

int func_ov002_02295fb8(Entity *e) {
    int res;
    if ((*(int *)(data_ov002_022cf1ac + (e->turn & 1) * 0x868 + e->f5 * 0x14) >> 21) & 1)
        return 0;
    e->f12 = 1;
    res = func_ov002_02257ab8((int)e, 1 - e->turn);
    e->f12 = 3;
    return res != 0;
}
