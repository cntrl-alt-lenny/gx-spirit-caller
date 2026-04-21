/* func_ov000_021ac550: extracts bit 0 of the word at +0x0.
 *
 *     ldr r0, [r0, #0x0]
 *     mov r0, r0, lsl #0x1f
 *     mov r0, r0, lsr #0x1f
 *     bx  lr
 */

typedef struct {
    unsigned int bit0 : 1;
} Ov000Flags;

unsigned int func_ov000_021ac550(Ov000Flags *p) {
    return p->bit0;
}
