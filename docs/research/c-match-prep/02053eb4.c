/* CAMPAIGN-PREP candidate for func_02053eb4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind dst(r5); src inline; mul elemsize*(last-idx); reload count for final dec
 *   risk:       mul order r3*r0 = elemsize*(last-idx) must keep elemsize first (sets dest reg); the two count loads (r6 then final str) must not CSE. reshape-able (operand-order/reload).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02053eb4 (main, class C) - brief 0015.
 * UNVERIFIED build-free draft. recipe: bounds-assert, memmove-shift-down
 * via elemsize*(last-idx), then count--. Bind dst/src to locals (held).
 */
extern char data_020ffb04[];
extern char data_020ffb10[];
extern void  func_020a6d54(char *file, char *expr, int zero, int line);
extern void *func_020540d0(void *arr, int idx);          /* &data[idx] */
extern void  func_020a7388(void *dst, void *src, int n); /* memmove */

typedef struct {
    int count;          /* +0x00 */
    int _cap;           /* +0x04 */
    int elemsize;       /* +0x08 */
} Arr02053eb4;

void func_02053eb4(Arr02053eb4 *arr, int idx) {
    int last;
    void *dst;

    if (!(idx >= 0 && idx < arr->count))
        func_020a6d54(data_020ffb10, data_020ffb04, 0, 0xc0);

    last = arr->count - 1;
    if (idx < last) {
        dst = func_020540d0(arr, idx);
        func_020a7388(dst, func_020540d0(arr, idx + 1),
                      arr->elemsize * (last - idx));
    }
    arr->count = arr->count - 1;
}
