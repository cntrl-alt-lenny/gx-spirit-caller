/* CAMPAIGN-PREP candidate for func_02294938 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload turn each call; if-assign min; bind a,b in call order
 *   risk:       orig RELOADS e->turn (ldrh repeated) each of 5 uses; if mwcc CSEs the bitfield into one reg the ldrh count diverges. reshape-able
 *   confidence: med
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

extern int func_ov002_022536e8(int flag, int id, int zero);
extern int func_ov002_021bc618(int flag);
extern int func_ov002_02259f74(int flag);
extern int func_ov002_021bae7c(int flag, int arg, int neg);

int func_ov002_02294938(Entity *e) {
    int a;
    int b;

    a = func_ov002_022536e8(e->turn, e->id, 0);
    b = func_ov002_021bc618(e->turn);
    if (func_ov002_02259f74(e->turn) == 0)
        return 0;
    if (func_ov002_021bae7c(e->turn, 0x17a3, -1)) {
        if (func_ov002_021bae7c(1 - e->turn, 0x1398, -1))
            return 0;
    }
    if (a >= b)
        a = b;
    return a >= 2;
}
