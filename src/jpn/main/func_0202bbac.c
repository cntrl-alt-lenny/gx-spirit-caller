/* func_0202bbac: thunk — `func_0202bc30(a, 5)`.
 *
 *     ldr ip, =func_0202bc30
 *     mov r1, #5
 *     bx  ip
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern int func_0202bc30(int a, int n);

int func_0202bbac(int a) {
    return func_0202bc30(a, 5);
}
