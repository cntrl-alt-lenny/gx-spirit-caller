/* func_ov011_021d0c1c: Fill32(0, &data_ov011_021d4660, 0x1a0) — zero a 416-byte slot.
 *
 *     ldr ip, .L_021d0c30    ; Fill32
 *     ldr r1, .L_021d0c34    ; data_ov011_021d4660
 *     mov r0, #0x0
 *     mov r2, #0x1a0
 *     bx  ip
 */

extern void Fill32(int val, void *dst, int count);
extern char data_ov011_021d4660[];

void func_ov011_021d0c1c(void) {
    Fill32(0, data_ov011_021d4660, 0x1a0);
}
