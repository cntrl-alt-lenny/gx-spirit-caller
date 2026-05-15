/* func_0202bb24: thunk — `func_0202bc30(a, 3)`.
 *
 *     ldr ip, =func_0202bc30
 *     mov r1, #3
 *     bx  ip
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern int func_0202bc30(int a, int n);

int func_0202bb24(int a) {
    return func_0202bc30(a, 3);
}
