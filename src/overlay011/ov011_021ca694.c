/* func_ov011_021ca694: 4-bit bitfield extractor at `data_ov011_021d4000 + 0x2a4`,
 * bits 13..16.
 *
 *     ldr r0, .L_021ca6a8
 *     ldr r0, [r0, #0x2a4]
 *     mov r0, r0, lsl #0xf          ; << 15
 *     mov r0, r0, lsr #0x1c         ; >> 28 (extract 4 bits)
 *     bx  lr
 *
 * Net: (x >> 13) & 0xf.
 */

typedef struct {
    char _pad[0x2a4];
    unsigned int flags_2a4;
} ov011_state_2a4_t;

extern ov011_state_2a4_t data_ov011_021d4000;

unsigned func_ov011_021ca694(void) {
    return (data_ov011_021d4000.flags_2a4 << 15) >> 28;
}
