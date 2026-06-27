/* CAMPAIGN-PREP candidate for func_020541b8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order [0][4][8][c][10]; cap==0?8 as cmp+moveq if-assign; reload [4]/[8] for data alloc
 *   risk:       mwcc must keep mov r0,#0 hoisted (str r0,[r4] count=0) and the moveq cap=8 BEFORE stores; the cap!=0 reload of [4]&[8] for mul must not be CSE'd from locals. reshape-able (store-order / reload), struct-guessed on field count.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020541b8 (main, class C/D) - brief 0015.
 * UNVERIFIED build-free draft. recipe: alloc(0x18), two asserts, ordered
 * field stores [0][4][8][c][10] with cap-default 8, then conditional data
 * alloc into +0x14. STORE-ORDER critical.
 */
extern char data_020ffb04[];
extern char data_020ffb5c[];
extern char data_020ffb64[];
extern char data_020ffb70[];
extern void *func_020453e8(int size);
extern void  func_020a6d54(char *file, char *expr, int zero, int line);

typedef struct {
    int   count;        /* +0x00 */
    int   cap;          /* +0x04 */
    int   elemsize;     /* +0x08 */
    int   grow;         /* +0x0c */
    int   zone;         /* +0x10 */
    void *data;         /* +0x14 */
} Arr020541b8;

void *func_020541b8(int elemsize, int cap, int zone) {
    Arr020541b8 *arr;

    arr = func_020453e8(0x18);
    if (arr == 0)
        func_020a6d54(data_020ffb5c, data_020ffb04, 0, 0x52);
    if (elemsize == 0)
        func_020a6d54(data_020ffb64, data_020ffb04, 0, 0x53);

    if (cap == 0)
        cap = 8;
    arr->count    = 0;
    arr->cap      = cap;
    arr->elemsize = elemsize;
    arr->grow     = cap;
    arr->zone     = zone;
    if (arr->cap != 0) {
        arr->data = func_020453e8(arr->cap * arr->elemsize);
        if (arr->data == 0)
            func_020a6d54(data_020ffb70, data_020ffb04, 0, 0x5e);
    } else {
        arr->data = 0;
    }
    return arr;
}
