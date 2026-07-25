/* CAMPAIGN-PREP candidate for func_02033604 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop; reload field bound+base each iter; addne accumulator
 *   risk:       strength-reduction of i*0xc to r6 accumulator and per-iter base reload must hold
 *   confidence: med
 */
/* func_02033604 — count nonzero results over a counted array */

typedef struct {
    unsigned char _e[0xc];   /* element stride 0xc */
} Elem_02033654;

typedef struct {
    unsigned char _pad_00[0xe74];
    Elem_02033654 *base;     /* +0xe74 */
    unsigned char _pad_e80[0xea4 - 0xe78];
    int n;                   /* +0xea4 */
} Obj_02033654;

extern int func_020530fc(Elem_02033654 *e);

int func_02033604(Obj_02033654 *p)
{
    int i;
    int count = 0;
    for (i = 0; i < p->n; i++) {
        if (func_020530fc(&p->base[i]))
            count++;
    }
    return count;
}
