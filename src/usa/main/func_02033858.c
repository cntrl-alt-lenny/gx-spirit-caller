/* func_02033858: drop arg 0, pass arg 1 as new arg 0 (`mov r0, r1`).
 *
 *     ldr ip, =func_02046ad0
 *     mov r0, r1
 *     bx ip
 */
extern int func_02046ad0(int a);
int func_02033858(int unused, int b) {
    return func_02046ad0(b);
}
