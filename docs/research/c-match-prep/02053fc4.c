/* CAMPAIGN-PREP candidate for func_02053fc4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     && bounds assert (ble); ==cap grow; count++; reload count for r8; mul elemsize*(last-idx)
 *   risk:       r8 (callee-saved high) for last=count-1 needs the post-increment count reload to stay separate; mul order elemsize-first; dst=accessor(idx+1) bound, src(idx) inline. reshape-able (reload/operand-order).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02053fc4 (main, class C) - brief 0015.
 * UNVERIFIED build-free draft. recipe: assert(0<=idx<=count), grow if
 * count==cap, count++, memmove-shift-up, then store helper. r8 high reg.
 */
extern char data_020ffb04[];
extern char data_020ffb3c[];
extern void  func_020a6d54(char *file, char *expr, int zero, int line);
extern void *func_020540d0(void *arr, int idx);
extern void  func_0205428c(void *arr, void *val, int idx);
extern void  func_020542b8(void *arr);                    /* grow */
extern void  func_020a7388(void *dst, void *src, int n);  /* memmove */

typedef struct {
    int count;          /* +0x00 */
    int cap;            /* +0x04 */
    int elemsize;       /* +0x08 */
} Arr02053fc4;

void func_02053fc4(Arr02053fc4 *arr, void *val, int idx) {
    int last;
    void *dst;

    if (!(idx >= 0 && idx <= arr->count))
        func_020a6d54(data_020ffb3c, data_020ffb04, 0, 0xa7);

    if (arr->count == arr->cap)
        func_020542b8(arr);

    arr->count = arr->count + 1;
    last = arr->count - 1;
    if (idx < last) {
        dst = func_020540d0(arr, idx + 1);
        func_020a7388(dst, func_020540d0(arr, idx),
                      arr->elemsize * (last - idx));
    }
    func_0205428c(arr, val, idx);
}
