/* func_0202b400: thunk — tail-call `func_0202df24(0xfc9, arg)`. Sibling
 * of func_0202b3e8 (0xfa7); identical 4-insn + 2-pool-word shape.
 */

extern int func_0202df24(int id, int arg);

int func_0202b400(int arg) {
    return func_0202df24(0xfc9, arg);
}
