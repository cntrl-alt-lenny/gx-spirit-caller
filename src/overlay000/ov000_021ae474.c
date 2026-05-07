/* func_ov000_021ae474: clear top byte of data_ov000_021c758c[0x2a8].
 *
 *     ldr r0, .L_021ae488
 *     ldr r1, [r0, #0x2a8]
 *     bic r1, r1, #0xff000000
 *     str r1, [r0, #0x2a8]
 *     bx  lr
 *  .L_021ae488: .word data_ov000_021c758c
 */

typedef struct {
    char         _pad[0x2a8];
    unsigned int field_2a8;
} ov000_758c_2a8_t;

extern ov000_758c_2a8_t data_ov000_021c758c;

void func_ov000_021ae474(void) {
    data_ov000_021c758c.field_2a8 &= ~0xff000000u;
}
