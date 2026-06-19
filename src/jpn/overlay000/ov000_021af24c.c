/* func_ov000_021af24c: insert low 8 bits of arg at bits 14..21 of
 * data_ov000_021c74ac[0x2ac].
 *
 *     ldr r1, .L_021af354
 *     mov r0, r0, lsl #0x18
 *     ldr r2, [r1, #0x2ac]
 *     bic r2, r2, #0x3fc000
 *     orr r0, r2, r0, lsr #0xa
 *     str r0, [r1, #0x2ac]
 *     bx  lr
 */

typedef struct {
    char         _pad[0x2ac];
    unsigned int field_2ac;
} ov000_758c_2ac_t;

extern ov000_758c_2ac_t data_ov000_021c74ac;

void func_ov000_021af24c(unsigned int v) {
    data_ov000_021c74ac.field_2ac =
        (data_ov000_021c74ac.field_2ac & ~0x3fc000u) | ((v << 24) >> 10);
}
