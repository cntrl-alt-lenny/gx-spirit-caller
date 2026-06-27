/* CAMPAIGN-PREP candidate for func_02026f78 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: signed-short struct (ldrsh) so reload signed; bind t for sum+aee reuse; store-order
 *   risk:       permuter-class: orig keeps ONE predicated loop body (streqh) for the iter-0 work; if mwcc peels iteration 0, the whole body restructures. Also global->reg pool order (r2=ae8,r1=aee) is mwcc's.
 *   confidence: low
 */
/* func_02026f78 (main, class D) - 3-iter loop writing {u16 a,b} pairs to
 * data_0219a914[i]; only iter 0 also writes data_02186aee/ae8. The running sum is
 * truncated to s16 through memory each step (strh then ldrsh). Returns 1.
 *   entry[i].a = sum_before; entry[i].b = arg[i]; sum += (s16)entry[i].b;
 *   iter0 only: data_02186aee = (s16)entry[0].b; data_02186ae8 = (s16)entry[0].a; */
typedef short s16;

typedef struct Pair78 { s16 a, b; } Pair78;

extern Pair78 data_0219a914[];   /* [3] */
extern s16    data_02186ae8;
extern s16    data_02186aee;

int func_02026f78(int *arg) {
    int sum = 0;
    int i;
    for (i = 0; i < 3; i++) {
        s16 t;
        data_0219a914[i].a = sum;
        data_0219a914[i].b = arg[i];
        t = data_0219a914[i].b;          /* ldrsh, reused for sum and aee store */
        if (i == 0) {
            data_02186aee = t;
            data_02186ae8 = data_0219a914[i].a;   /* fresh ldrsh of .a (=0) */
        }
        sum += t;
    }
    return 1;
}
