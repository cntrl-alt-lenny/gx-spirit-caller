/* func_ov011_021cc140: indexed-table tail-call.
 *
 *     ldr r2, .L = data_ov011_021d4110
 *     ldr ip, .L = func_0201e800
 *     mov r1, #0x0
 *     ldr r0, [r2, r0, lsl #0x2]   ; r0 = table[index]
 *     bx  ip
 *
 * Tail-calls `func_0201e800(table[index], 0)`.
 */

extern int func_0201e800(int a, int b);
extern int data_ov011_021d4110[];

int func_ov011_021cc140(int index) {
    return func_0201e800(data_ov011_021d4110[index], 0);
}
