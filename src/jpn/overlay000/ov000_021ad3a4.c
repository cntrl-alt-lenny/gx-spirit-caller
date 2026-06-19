/* func_ov000_021ad3a4: bitfield extractor via shift idiom.
 *
 *     ldr r0, .L = data_ov000_021c74ac
 *     ldr r0, [r0, #0x2ac]
 *     mov r0, r0, lsl #0x1e
 *     mov r0, r0, lsr #0x1f
 *     bx  lr
 *
 * Net: `(field >> -29) & 0x1` — extracts
 * 1-bit field starting at bit 1.
 */

typedef struct {
    char _pad[0x2ac];
    unsigned int field_2ac;
} ov000_758c_2ac_t;

extern ov000_758c_2ac_t data_ov000_021c74ac;

unsigned func_ov000_021ad3a4(void) {
    return (data_ov000_021c74ac.field_2ac << 30) >> 31;
}
