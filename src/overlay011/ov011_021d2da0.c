/* func_ov011_021d2da0: 2-arg tail-call into func_ov011_021d2138.
 *
 *     ldr ip, .L = func_ov011_021d2138
 *     mov r1, r0                    ; caller arg -> r1
 *     ldr r0, .L = data_ov011_021d480c
 *     bx  ip
 *
 * Tail-calls `func_ov011_021d2138(&global, caller_arg)`.
 */

extern int func_ov011_021d2138(void *dst, int arg);
extern char data_ov011_021d480c[];

int func_ov011_021d2da0(int arg) {
    return func_ov011_021d2138(data_ov011_021d480c, arg);
}
