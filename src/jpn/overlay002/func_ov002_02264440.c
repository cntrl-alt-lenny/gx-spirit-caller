/* func_ov002_02264440: thunk — tail-call `func_ov002_02262ee8(1 - arg, 0x1487)`.
 * Same shape as func_ov002_022643fc; different target + id.
 */

extern int func_ov002_02262ee8(int x, int id);

int func_ov002_02264440(int arg) {
    return func_ov002_02262ee8(1 - arg, 0x1487);
}
