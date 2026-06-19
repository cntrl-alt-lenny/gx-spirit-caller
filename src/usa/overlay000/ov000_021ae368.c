/* func_ov000_021ae368: clear top byte of data_ov000_021c74ac[0x2a8].
 *
 *     ldr r0, .L_021ae488
 *     ldr r1, [r0, #0x2a8]
 *     bic r1, r1, #0xff000000
 *     str r1, [r0, #0x2a8]
 *     bx  lr
 *  .L_021ae488: .word data_ov000_021c74ac
 */

typedef struct {
    char         _pad[0x2a8];
    unsigned int field_2a8;
} ov000_758c_2a8_t;

extern ov000_758c_2a8_t data_ov000_021c74ac;

void func_ov000_021ae368(void) {
    data_ov000_021c74ac.field_2a8 &= ~0xff000000u;
}
