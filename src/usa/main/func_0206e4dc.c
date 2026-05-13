/* func_0206e4dc: thunk — `func_0206e4bc(data_0219ec68, arg)`.
 *
 *     ldr ip, =
 *     mov r1, r0
 *     ldr r0, =data_0219ec68
 *     bx ip
 */

extern int func_0206e4bc(void *data, int arg);
extern char data_0219ec68[];

int func_0206e4dc(int arg) {
    return func_0206e4bc(data_0219ec68, arg);
}
