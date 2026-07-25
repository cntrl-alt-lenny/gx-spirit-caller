/* func_0209a730: thunk — `func_0209a7dc(data_021a8300, arg)`.
 *
 *     ldr ip, =
 *     mov r1, r0
 *     ldr r0, =data_021a8300
 *     bx ip
 */

extern int func_0209a7dc(void *data, int arg);
extern char data_021a8300[];

int func_0209a730(int arg) {
    return func_0209a7dc(data_021a8300, arg);
}
