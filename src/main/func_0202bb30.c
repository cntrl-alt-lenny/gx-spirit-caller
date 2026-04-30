/* func_0202bb30: thunk — `func_0202bc84(a, 1)`.
 *
 *     ldr ip, =func_0202bc84
 *     mov r1, #1
 *     bx  ip
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern int func_0202bc84(int a, int n);

int func_0202bb30(int a) {
    return func_0202bc84(a, 1);
}
