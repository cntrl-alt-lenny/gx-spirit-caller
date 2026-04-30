/* func_020338a8: drop arg 0, pass arg 1 as new arg 0 (`mov r0, r1`).
 *
 *     ldr ip, =func_02046b3c
 *     mov r0, r1
 *     bx ip
 */
extern int func_02046b3c(int a);
int func_020338a8(int unused, int b) {
    return func_02046b3c(b);
}
