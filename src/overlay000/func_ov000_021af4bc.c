/* func_ov000_021af4bc: Fill32(0, &data_ov000_021c7594, 0x30) — zero a 48-byte slot.
 *
 *     ldr ip, .L_021af4d0    ; Fill32
 *     ldr r1, .L_021af4d4    ; data_ov000_021c7594
 *     mov r0, #0x0
 *     mov r2, #0x30
 *     bx  ip
 */

extern void Fill32(int val, void *dst, int count);
extern char data_ov000_021c7594[];

void func_ov000_021af4bc(void) {
    Fill32(0, data_ov000_021c7594, 0x30);
}
