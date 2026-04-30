/* func_0206e550: thunk — `func_0206e530(data_0219ed48, arg)`.
 *
 *     ldr ip, =
 *     mov r1, r0
 *     ldr r0, =data_0219ed48
 *     bx ip
 */

extern int func_0206e530(void *data, int arg);
extern char data_0219ed48[];

int func_0206e550(int arg) {
    return func_0206e530(data_0219ed48, arg);
}
