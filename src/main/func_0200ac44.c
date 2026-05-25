/* func_0200ac44: tail-call Fill32(0, &data_02186a58, 0x10).
 *
 *     ldr ip, .L_0200ac58    ; Fill32
 *     ldr r1, .L_0200ac5c    ; data_02186a58
 *     mov r0, #0x0
 *     mov r2, #0x10
 *     bx  ip
 */

extern void Fill32(int val, void *dst, int count);

extern char data_02186a58[];

void func_0200ac44(void) {
    Fill32(0, data_02186a58, 0x10);
}
