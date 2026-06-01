/* func_ov011_021cf2b8: set the field at bits 23:21 of +0x2b0 to 1
 * (clear bits 28:21, then set bit 21).
 *
 *     ldr   r1, =data_ov011_021d4000
 *     ldr   r0, =0xe01fffff
 *     ldr   r2, [r1, #0x2b0]
 *     and   r0, r2, r0
 *     orr   r0, r0, #0x200000
 *     str   r0, [r1, #0x2b0]
 *     bx    lr
 */

extern char data_ov011_021d4000[];

void func_ov011_021cf2b8(void) {
    *(int *)(data_ov011_021d4000 + 0x2b0) =
        (*(int *)(data_ov011_021d4000 + 0x2b0) & 0xe01fffff) | 0x200000;
}
