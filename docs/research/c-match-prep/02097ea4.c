/* CAMPAIGN-PREP candidate for func_02097ea4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dispatch switch + min/max if-assign (B)
 *   risk:       switch may emit jump-table not cmp-chain; field offsets via padded struct (confirm real type)
 *   confidence: med
 */
/* func_02097ea4: select an offset field by `mode` (0->f24, 1->f2c, 2->f28),
 * add it to `v`, clamp the result to [f24, f28], store at f2c, return 1.
 * Unknown mode -> return 0. Dispatch switch + lower/upper clamp (cmp;movlt /
 * cmp;movgt -> if-assign). Struct offsets reproduced via padded layout. */

typedef struct {
    char         _pad0[0x24];
    int          f_24;   /* +0x24 (lower bound) */
    int          f_28;   /* +0x28 (upper bound) */
    int          f_2c;   /* +0x2c (result slot)  */
} Obj_02097ea4;

int func_02097ea4(Obj_02097ea4 *p, int v, int mode) {
    switch (mode) {
    case 0:
        v = v + p->f_24;
        break;
    case 1:
        v = v + p->f_2c;
        break;
    case 2:
        v = v + p->f_28;
        break;
    default:
        return 0;
    }
    if (v < p->f_24)
        v = p->f_24;
    if (v > p->f_28)
        v = p->f_28;
    p->f_2c = v;
    return 1;
}
