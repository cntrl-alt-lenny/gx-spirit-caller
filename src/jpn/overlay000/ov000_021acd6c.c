/* func_ov000_021acd6c: insert low 2 bits of arg at bits 7..8 of
 * data_ov000_021c74ac[0x2a4].
 *
 *     ldr r1, .L_021ace68
 *     mov r0, r0, lsl #0x1e
 *     ldr r2, [r1, #0x2a4]
 *     bic r2, r2, #0x180
 *     orr r0, r2, r0, lsr #0x17
 *     str r0, [r1, #0x2a4]
 *     bx  lr
 */

typedef struct {
    char         _pad[0x2a4];
    unsigned int field_2a4;
} ov000_758c_2a4_t;

extern ov000_758c_2a4_t data_ov000_021c74ac;

void func_ov000_021acd6c(unsigned int v) {
    data_ov000_021c74ac.field_2a4 =
        (data_ov000_021c74ac.field_2a4 & ~0x180u) | ((v << 30) >> 23);
}
