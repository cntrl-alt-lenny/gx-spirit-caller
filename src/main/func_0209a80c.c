/* func_0209a80c: thunk — `func_0209a884(data_021a83d8, arg)`.
 *
 *     ldr ip, =
 *     mov r1, r0
 *     ldr r0, =data_021a83d8
 *     bx ip
 */

extern int func_0209a884(void *data, int arg);
extern char data_021a83d8[];

int func_0209a80c(int arg) {
    return func_0209a884(data_021a83d8, arg);
}
