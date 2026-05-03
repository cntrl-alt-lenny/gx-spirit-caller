/* func_0209153c: thunk — `func_02090c44(a, 0x7fffffff, b, c)`.
 *
 *     ldr ip, =func_02090c44
 *     mov r3, r2
 *     mov r2, r1
 *     mvn r1, #0x80000000     ; r1 = ~0x80000000 = 0x7fffffff
 *     bx ip
 */

extern int func_02090c44(int a, int b, int c, int d);
int func_0209153c(int a, int b, int c) {
    return func_02090c44(a, 0x7fffffff, b, c);
}
