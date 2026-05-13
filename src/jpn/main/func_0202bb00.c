/* func_0202bb00: thunk — `func_0202bc30(a, 2)`.
 *
 *     ldr ip, =func_0202bc30
 *     mov r1, #2
 *     bx  ip
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern int func_0202bc30(int a, int n);

int func_0202bb00(int a) {
    return func_0202bc30(a, 2);
}
