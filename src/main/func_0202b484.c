/* func_0202b484: thunk — tail-call `func_0202df78(0x10f4, arg)`. Sibling
 * of func_0202b43c (0xfa7); identical 4-insn + 2-pool-word shape.
 */

extern int func_0202df78(int id, int arg);

int func_0202b484(int arg) {
    return func_0202df78(0x10f4, arg);
}
