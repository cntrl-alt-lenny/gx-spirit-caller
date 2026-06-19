/* func_ov011_021d2cb0: 2-arg tail-call into func_ov011_021d2048.
 *
 *     ldr ip, .L = func_ov011_021d2048
 *     mov r1, r0                    ; caller arg -> r1
 *     ldr r0, .L = data_ov011_021d472c
 *     bx  ip
 *
 * Tail-calls `func_ov011_021d2048(&global, caller_arg)`.
 */

extern int func_ov011_021d2048(void *dst, int arg);
extern char data_ov011_021d472c[];

int func_ov011_021d2cb0(int arg) {
    return func_ov011_021d2048(data_ov011_021d472c, arg);
}
