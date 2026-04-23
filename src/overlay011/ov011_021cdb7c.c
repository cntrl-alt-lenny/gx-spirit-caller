/* func_ov011_021cdb7c: 1-bit bitfield extractor at `data_ov011_021d4000 + 0x2ac`,
 * bit 17.
 *
 *     ldr r0, .L_021cdb90
 *     ldr r0, [r0, #0x2ac]
 *     mov r0, r0, lsl #0xe          ; << 14
 *     mov r0, r0, lsr #0x1f         ; >> 31 (extract 1 bit)
 *     bx  lr
 *
 * Net: (x >> 17) & 1.
 */

typedef struct {
    char _pad[0x2ac];
    unsigned int flags_2ac;
} ov011_state_2ac_t;

extern ov011_state_2ac_t data_ov011_021d4000;

unsigned func_ov011_021cdb7c(void) {
    return (data_ov011_021d4000.flags_2ac << 14) >> 31;
}
