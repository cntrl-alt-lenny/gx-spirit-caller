/* CAMPAIGN-PREP candidate for func_02033654 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop; reload field bound+base each iter; addne accumulator
 *   risk:       strength-reduction of i*0xc to r6 accumulator and per-iter base reload must hold
 *   confidence: med
 */
/* func_02033654 — count nonzero results over a counted array */

typedef struct {
    unsigned char _e[0xc];   /* element stride 0xc */
} Elem_02033654;

typedef struct {
    unsigned char _pad_00[0xe7c];
    Elem_02033654 *base;     /* +0xe7c */
    unsigned char _pad_e80[0xeac - 0xe80];
    int n;                   /* +0xeac */
} Obj_02033654;

extern int func_02053170(Elem_02033654 *e);

int func_02033654(Obj_02033654 *p)
{
    int i;
    int count = 0;
    for (i = 0; i < p->n; i++) {
        if (func_02053170(&p->base[i]))
            count++;
    }
    return count;
}
