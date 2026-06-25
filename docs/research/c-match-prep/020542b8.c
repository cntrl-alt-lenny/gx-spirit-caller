/* CAMPAIGN-PREP candidate for func_020542b8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     field RMW cap+=grow; realloc(cap*elemsize, data); reload data for null test (ldmne tail)
 *   risk:       realloc arg order r1=cap*elemsize(size) r0=data(old)->so signature is (size,ptr); the cmp #0;ldmneia is the if-non-null-early-return shape. reshape-able (helper arg-order), struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020542b8 (main, class C/D) - brief 0015.
 * UNVERIFIED build-free draft. recipe: cap += grow; realloc data to
 * cap*elemsize; store; assert-non-null tail (predicated ldmne epilogue).
 * Reload fields each use to match the ldr-per-access asm.
 */
extern char data_020ffb04[];
extern char data_020ffb70[];
extern void *func_020453cc(int newsize, void *ptr);  /* realloc(size, old) */
extern void  func_020a6d54(char *file, char *expr, int zero, int line);

typedef struct {
    int   count;        /* +0x00 */
    int   cap;          /* +0x04 */
    int   elemsize;     /* +0x08 */
    int   grow;         /* +0x0c */
    int   zone;         /* +0x10 */
    void *data;         /* +0x14 */
} Arr020542b8;

void func_020542b8(Arr020542b8 *arr) {
    arr->cap = arr->cap + arr->grow;
    arr->data = func_020453cc(arr->cap * arr->elemsize, arr->data);
    if (arr->data == 0)
        func_020a6d54(data_020ffb70, data_020ffb04, 0, 0x41);
}
