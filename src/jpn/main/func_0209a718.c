/* func_0209a718: thunk — `func_0209a790(data_021a82f8, arg)`.
 *
 *     ldr ip, =
 *     mov r1, r0
 *     ldr r0, =data_021a82f8
 *     bx ip
 */

extern int func_0209a790(void *data, int arg);
extern char data_021a82f8[];

int func_0209a718(int arg) {
    return func_0209a790(data_021a82f8, arg);
}
