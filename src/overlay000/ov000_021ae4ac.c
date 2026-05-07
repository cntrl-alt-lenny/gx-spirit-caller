/* func_ov000_021ae4ac: 4-bit field at bits 12..15 of data_ov000_021c758c[0x2a8].
 *
 *     ldr r0, .L_021ae4c0
 *     ldr r0, [r0, #0x2a8]
 *     mov r0, r0, lsl #0x10   ; lsl 16
 *     mov r0, r0, lsr #0x1c   ; lsr 28 -> bits 12..15
 *     bx  lr
 *
 * Same shape as func_ov000_021ace6c — see that file for the codegen note.
 */

typedef struct {
    char _pad[0x2a8];
    unsigned int field_2a8;
} ov000_758c_2a8_t;

extern ov000_758c_2a8_t data_ov000_021c758c;

unsigned func_ov000_021ae4ac(void) {
    return (data_ov000_021c758c.field_2a8 << 16) >> 28;
}
