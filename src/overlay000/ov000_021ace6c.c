/* func_ov000_021ace6c: bitfield extractor via shift idiom.
 *
 *     ldr r0, .L = data_ov000_021c758c
 *     ldr r0, [r0, #0x2a4]
 *     mov r0, r0, lsl #0x17
 *     mov r0, r0, lsr #0x1e
 *     bx  lr
 *
 * Net: `(field >> -21) & 0x3` — extracts
 * 2-bit field starting at bit 7.
 */

typedef struct {
    char _pad[0x2a4];
    unsigned int field_2a4;
} ov000_758c_2a4_t;

extern ov000_758c_2a4_t data_ov000_021c758c;

unsigned func_ov000_021ace6c(void) {
    return (data_ov000_021c758c.field_2a4 << 23) >> 30;
}
