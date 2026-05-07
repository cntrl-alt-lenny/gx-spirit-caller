/* func_ov000_021ace2c: insert low 4 bits of arg at bits 0..3 of
 * data_ov000_021c758c[0x2a4].
 *
 *     ldr r1, .L_021ace48
 *     and r0, r0, #0xf
 *     ldr r2, [r1, #0x2a4]
 *     bic r2, r2, #0xf
 *     orr r0, r2, r0
 *     str r0, [r1, #0x2a4]
 *     bx  lr
 *
 * Field is at bit 0 — no `lsl/lsr` shift; mwcc emits a direct
 * `and r0, r0, #0xf` mask.
 */

typedef struct {
    char         _pad[0x2a4];
    unsigned int field_2a4;
} ov000_758c_2a4_t;

extern ov000_758c_2a4_t data_ov000_021c758c;

void func_ov000_021ace2c(unsigned int v) {
    data_ov000_021c758c.field_2a4 =
        (data_ov000_021c758c.field_2a4 & ~0xfu) | (v & 0xf);
}
