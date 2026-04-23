/* func_ov011_021ca6ac: 1-bit bitfield extractor at `data_ov011_021d4000 + 0x2bc`,
 * bit 8.
 *
 *     ldr r0, .L_021ca6c0
 *     ldr r0, [r0, #0x2bc]
 *     mov r0, r0, lsl #0x17         ; << 23
 *     mov r0, r0, lsr #0x1f         ; >> 31 (extract 1 bit)
 *     bx  lr
 *
 * Net: (x >> 8) & 1.
 */

typedef struct {
    char _pad[0x2bc];
    unsigned int flags_2bc;
} ov011_state_2bc_t;

extern ov011_state_2bc_t data_ov011_021d4000;

unsigned func_ov011_021ca6ac(void) {
    return (data_ov011_021d4000.flags_2bc << 23) >> 31;
}
