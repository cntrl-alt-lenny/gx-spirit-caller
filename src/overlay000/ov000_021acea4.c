/* func_ov000_021acea4: bitfield extractor via shift idiom.
 *
 *     ldr r0, .L = data_ov000_021c758c
 *     ldr r0, [r0, #0x2ac]
 *     mov r0, r0, lsl #0x16
 *     mov r0, r0, lsr #0x1d
 *     bx  lr
 *
 * Net: `(field >> -19) & 0x7` — extracts
 * 3-bit field starting at bit 7.
 */

typedef struct {
    char _pad[0x2ac];
    unsigned int field_2ac;
} ov000_758c_2ac_t;

extern ov000_758c_2ac_t data_ov000_021c758c;

unsigned func_ov000_021acea4(void) {
    return (data_ov000_021c758c.field_2ac << 22) >> 29;
}
