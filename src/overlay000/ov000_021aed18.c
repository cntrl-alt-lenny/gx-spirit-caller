/* func_ov000_021aed18: insert bit 0 of arg at bit 10 of
 * data_ov000_021c758c[0x2a8].
 *
 *     ldr r1, .L_021aed34
 *     mov r0, r0, lsl #0x1f
 *     ldr r2, [r1, #0x2a8]
 *     bic r2, r2, #0x400
 *     orr r0, r2, r0, lsr #0x15
 *     str r0, [r1, #0x2a8]
 *     bx  lr
 */

typedef struct {
    char         _pad[0x2a8];
    unsigned int field_2a8;
} ov000_758c_2a8_t;

extern ov000_758c_2a8_t data_ov000_021c758c;

void func_ov000_021aed18(unsigned int v) {
    data_ov000_021c758c.field_2a8 =
        (data_ov000_021c758c.field_2a8 & ~0x400u) | ((v << 31) >> 21);
}
