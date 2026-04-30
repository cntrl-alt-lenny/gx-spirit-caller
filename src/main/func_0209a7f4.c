/* func_0209a7f4: thunk — `func_0209a884(data_021a83e0, arg)`.
 *
 *     ldr ip, =
 *     mov r1, r0
 *     ldr r0, =data_021a83e0
 *     bx ip
 */

extern int func_0209a884(void *data, int arg);
extern char data_021a83e0[];

int func_0209a7f4(int arg) {
    return func_0209a884(data_021a83e0, arg);
}
