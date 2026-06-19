/* func_ov011_021cc07c: indexed-table tail-call.
 *
 *     ldr r2, .L = data_ov011_021d4030
 *     ldr ip, .L = func_0201e7ac
 *     mov r1, #0x0
 *     ldr r0, [r2, r0, lsl #0x2]   ; r0 = table[index]
 *     bx  ip
 *
 * Tail-calls `func_0201e7ac(table[index], 0)`.
 */

extern int func_0201e7ac(int a, int b);
extern int data_ov011_021d4030[];

int func_ov011_021cc07c(int index) {
    return func_0201e7ac(data_ov011_021d4030[index], 0);
}
