/* CAMPAIGN-PREP candidate for func_02299984 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dense switch 0..4 fall-through + state++; bind d016c (r1 reused +0xcec/+0xcf8); unsigned>=3 guard; counted loop i<=4
 *   risk:       reshape-able: bind `d=data_ov002_022d016c` so case-0 reads both +0xcec(ctx) and +0xcf8 from one base (orig holds r1 across) — if mwcc reloads, 1 extra ldr diverges; case-0 cmp is UNSIGNED (movcs) so cast the +0xcf8 read
 *   confidence: med
 */
extern char data_ov002_022cd524[];
extern char data_ov002_022d016c[];
extern int func_ov002_022974bc(void *ctx, int a);
extern int func_ov002_02297d68(void *ctx);
extern int func_ov002_02285d68(void *ctx);
extern int func_ov002_0229979c(void *ctx, int i, int k);

int func_ov002_02299984(void) {
    int state = *(int *)(data_ov002_022cd524 + 0x8);
    char *d = data_ov002_022d016c;
    void *ctx = *(void **)(d + 0xcec);
    int i;
    switch (state) {
    case 0:
        if ((unsigned int)*(int *)(d + 0xcf8) >= 3) return 1;
        if (func_ov002_022974bc(ctx, 0) != 0) return 0;
        (*(int *)(data_ov002_022cd524 + 0x8))++;
        /* fall through */
    case 1:
        if (func_ov002_02297d68(ctx) != 0) return 0;
        (*(int *)(data_ov002_022cd524 + 0x8))++;
        /* fall through */
    case 2:
        func_ov002_02285d68(ctx);
        for (i = 0; i <= 4; i++) {
            if (func_ov002_0229979c(ctx, i, 0) != 0) return 0;
        }
        (*(int *)(data_ov002_022cd524 + 0x8))++;
        /* fall through */
    case 3:
        if (func_ov002_02297d68(ctx) != 0) return 0;
        (*(int *)(data_ov002_022cd524 + 0x8))++;
        /* fall through */
    case 4:
        break;
    }
    return 1;
}
