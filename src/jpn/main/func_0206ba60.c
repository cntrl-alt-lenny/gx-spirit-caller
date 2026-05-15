/* func_0206ba60: set bit 1 on the int at data_0219ec04.
 *
 *     ldr r0, .L_0206bae8
 *     ldr r1, [r0, #0x0]
 *     orr r1, r1, #0x2
 *     str r1, [r0, #0x0]
 *     bx  lr
 *  .L_0206bae8: .word data_0219ec04
 *
 * Same shape as ov015_021b3f80 (offset = 0); see its file for the
 * struct-typedef trick that pins base+offset codegen.
 */

extern unsigned int data_0219ec04;

void func_0206ba60(void) {
    data_0219ec04 |= 0x2;
}
