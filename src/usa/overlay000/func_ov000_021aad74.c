/* func_ov000_021aad74: Fill32(0, &data_ov000_021c744c, 0x4) — zero a 4-byte slot.
 *
 *     ldr ip, .L_021aae68    ; Fill32
 *     ldr r1, .L_021aae6c    ; data_ov000_021c744c
 *     mov r0, #0x0
 *     mov r2, #0x4
 *     bx  ip
 */

extern void Fill32(int val, void *dst, int count);
extern char data_ov000_021c744c[];

void func_ov000_021aad74(void) {
    Fill32(0, data_ov000_021c744c, 0x4);
}
