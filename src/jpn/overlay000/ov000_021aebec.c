/* func_ov000_021aebec: returns 1 iff bit 11 of
 * `data_ov000_021c74ac[0x2a8]` is zero.
 *
 *     ldr r0, .L_021aecf4
 *     ldr r0, [r0, #0x2a8]
 *     mov r0, r0, lsl #0x14
 *     movs r0, r0, lsr #0x1f
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 *
 * (x << 20) >> 31 extracts bit 11. `movs` sets flags directly.
 */

typedef struct {
    char         _pad[0x2a8];
    unsigned int field_2a8;
} ov000_758c_2a8_t;

extern ov000_758c_2a8_t data_ov000_021c74ac;

int func_ov000_021aebec(void) {
    return ((data_ov000_021c74ac.field_2a8 << 20) >> 31) == 0;
}
