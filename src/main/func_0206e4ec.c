/* func_0206e4ec: thunk — `func_0206e530(data_0219ed4c, arg)`.
 *
 *     ldr ip, =
 *     mov r1, r0
 *     ldr r0, =data_0219ed4c
 *     bx ip
 */

extern int func_0206e530(void *data, int arg);
extern char data_0219ed4c[];

int func_0206e4ec(int arg) {
    return func_0206e530(data_0219ed4c, arg);
}
