/* CAMPAIGN-PREP candidate for func_02299a98 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: bind ctx in r4 across stages; switch fall-through; reload state global; loop i,j decl-order
 *   risk:       orig RELOADS data_022cd524 (ldr _LIT0) for each ++ but binds ctx in r4; if mwcc hoists the global into a reg or reorders movne-early-return, ldmne diverges. reshape-able (bind/reload + fall-through switch)
 *   confidence: med
 */
/* func_ov002_02299a98: 3-stage init state machine. state = *(int*)(g+8).
 * r4 = ctx = *(void**)(data_022d016c+0xcec) held across all stages. Each
 * stage calls a helper, returns 0 on failure, else advances state (++) and
 * FALLS THROUGH to the next stage. Stage 2 is a counted loop i=0..4. */
extern char data_ov002_022cd524[];
extern char data_ov002_022d016c[];
extern int func_ov002_022974bc(void *ctx, int a);
extern int func_ov002_02297d68(void *ctx);
extern int func_ov002_0229979c(void *ctx, int i, int one);

int func_ov002_02299a98(void) {
    void *ctx = *(void **)(data_ov002_022d016c + 0xcec);
    int i, j;
    switch (*(int *)(data_ov002_022cd524 + 0x8)) {
    case 0:
        if (func_ov002_022974bc(ctx, 1) != 0) return 0;
        *(int *)(data_ov002_022cd524 + 0x8) += 1;
        /* fallthrough */
    case 1:
        if (func_ov002_02297d68(ctx) != 0) return 0;
        *(int *)(data_ov002_022cd524 + 0x8) += 1;
        /* fallthrough */
    case 2:
        for (i = 0, j = 1; ; ) {
            if (func_ov002_0229979c(ctx, i, j) != 0) return 0;
            i++;
            if (i > 4) break;
        }
        return 1;
    default:
        return 1;
    }
}
