/* func_0206e478: thunk — `func_0206e4bc(data_0219ec6c, arg)`.
 *
 *     ldr ip, =
 *     mov r1, r0
 *     ldr r0, =data_0219ec6c
 *     bx ip
 */

extern int func_0206e4bc(void *data, int arg);
extern char data_0219ec6c[];

int func_0206e478(int arg) {
    return func_0206e4bc(data_0219ec6c, arg);
}
