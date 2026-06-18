/* func_0209a748: thunk — `func_0209a824(data_021a82f8, arg)`.
 *
 *     ldr ip, =
 *     mov r1, r0
 *     ldr r0, =data_021a82f8
 *     bx ip
 */

extern int func_0209a824(void *data, int arg);
extern char data_021a82f8[];

int func_0209a748(int arg) {
    return func_0209a824(data_021a82f8, arg);
}
