/* func_ov000_021ae48c: returns 1 iff top byte of
 * `data_ov000_021c758c[0x2a8]` equals 8.
 *
 *     ldr r0, .L_021ae4a8
 *     ldr r0, [r0, #0x2a8]
 *     mov r0, r0, lsr #0x18    ; r0 = top-byte (zero-extend via lsr 24)
 *     cmp r0, #0x8
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

typedef struct {
    char         _pad[0x2a8];
    unsigned int field_2a8;
} ov000_758c_2a8_t;

extern ov000_758c_2a8_t data_ov000_021c758c;

int func_ov000_021ae48c(void) {
    return (data_ov000_021c758c.field_2a8 >> 24) == 8;
}
