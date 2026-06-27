/* CAMPAIGN-PREP candidate for func_02297b34 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dense switch 0..3 fall-through + state++ per case; ptr-walk loop +8; default return 1
 *   risk:       reshape-able: jump table (addls pc,pc,r0,lsl#2) needs dense 0..3 — OK; main risk is case-0 loop using pointer-walk `p+=8` (matches `add r6,#8`) vs an index*8 induction — keep the p+=8 form; head state/ctx load order may swap
 *   confidence: med
 */
extern char data_ov002_022cd524[];
extern char data_ov002_022d016c[];
extern char data_ov002_022c9038[];
extern int func_ov002_02297158(void *ctx, void *entry);
extern int func_ov002_022979bc(void *ctx, int a);
extern int func_ov002_02298768(void *ctx);
extern int func_ov002_02297d68(void *ctx);
extern int func_ov002_022974bc(void *ctx, int a);

int func_ov002_02297b34(void) {
    int state = *(int *)(data_ov002_022cd524 + 0x8);
    void *ctx = *(void **)(data_ov002_022d016c + 0xcec);
    int i;
    char *p;
    switch (state) {
    case 0:
        p = data_ov002_022c9038;
        for (i = 0; i < 0x43; i++) {
            if (func_ov002_02297158(ctx, p) != 0) return 0;
            p += 8;
        }
        (*(int *)(data_ov002_022cd524 + 0x8))++;
        /* fall through */
    case 1:
        if (func_ov002_022979bc(ctx, 0) != 0 && func_ov002_02298768(ctx) != 0) return 0;
        (*(int *)(data_ov002_022cd524 + 0x8))++;
        /* fall through */
    case 2:
        if (func_ov002_02297d68(ctx) != 0) return 0;
        (*(int *)(data_ov002_022cd524 + 0x8))++;
        /* fall through */
    case 3:
        if (func_ov002_022974bc(ctx, 0) != 0) return 0;
        (*(int *)(data_ov002_022cd524 + 0x8))++;
        /* fall through */
    }
    return 1;
}
