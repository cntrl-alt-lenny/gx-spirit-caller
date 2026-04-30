/* func_0202bb0c: thunk — `func_0202bc38(a, 0, b)` (a in r0, b was in r1).
 *
 *     ldr ip, =func_0202bc38
 *     mov r2, r1            ; b → r2
 *     mov r1, #0            ; const → r1
 *     bx  ip
 *
 * 4 insns + 1 pool = 0x14 bytes.
 */

extern int func_0202bc38(int a, int n, int b);

int func_0202bb0c(int a, int b) {
    return func_0202bc38(a, 0, b);
}
