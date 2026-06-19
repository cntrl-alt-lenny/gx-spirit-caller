/* func_ov000_021af2cc: bitfield extractor via shift idiom.
 *
 *     ldr r0, .L = data_ov000_021c74ac
 *     ldr r0, [r0, #0x2a8]
 *     mov r0, r0, lsl #0x17
 *     mov r0, r0, lsr #0x1f
 *     bx  lr
 *
 * Net: `(field >> -22) & 0x1` — extracts
 * 1-bit field starting at bit 8.
 */

typedef struct {
    char _pad[0x2a8];
    unsigned int field_2a8;
} ov000_758c_2a8_t;

extern ov000_758c_2a8_t data_ov000_021c74ac;

unsigned func_ov000_021af2cc(void) {
    return (data_ov000_021c74ac.field_2a8 << 23) >> 31;
}
