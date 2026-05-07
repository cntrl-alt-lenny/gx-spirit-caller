/* func_ov000_021ace84: insert bit 0 of arg at bit 6 of
 * data_ov000_021c758c[0x2ac].
 *
 *     ldr r1, .L_021acea0
 *     mov r0, r0, lsl #0x1f
 *     ldr r2, [r1, #0x2ac]
 *     bic r2, r2, #0x40
 *     orr r0, r2, r0, lsr #0x19
 *     str r0, [r1, #0x2ac]
 *     bx  lr
 */

typedef struct {
    char         _pad[0x2ac];
    unsigned int field_2ac;
} ov000_758c_2ac_t;

extern ov000_758c_2ac_t data_ov000_021c758c;

void func_ov000_021ace84(unsigned int v) {
    data_ov000_021c758c.field_2ac =
        (data_ov000_021c758c.field_2ac & ~0x40u) | ((v << 31) >> 25);
}
