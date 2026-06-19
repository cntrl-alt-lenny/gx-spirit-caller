/* func_ov011_021ca584: 4-bit bitfield extractor from
 * `data_ov011_021d3f20 + 0x2bc`, bits 18..21.
 *
 *     ldr r0, .L_021ca678           ; r0 = &data_ov011_021d3f20
 *     ldr r0, [r0, #0x2bc]          ; r0 = *(u32 *)(p + 0x2bc)
 *     mov r0, r0, lsl #0xa          ; << 10 (kill top 10 bits)
 *     mov r0, r0, lsr #0x1c         ; >> 28 (extract 4-bit field)
 *     bx  lr
 * .L_021ca678: .word data_ov011_021d3f20
 *
 * Net: (x >> 18) & 0xf — a 4-bit bitfield living at bits 18..21 of
 * the word at offset 0x2bc. The `<<10; >>28` idiom is mwcc's fastest
 * way to emit an unsigned bitfield extract when the field sits far
 * from bit 0 and would otherwise need a `bic` mask + load of a
 * large immediate; here it's two barrel-shifts (free with the ARM
 * ALU shifter).
 */

typedef struct {
    char _pad[0x2bc];
    unsigned int flags_2bc;
} ov011_state_2bc_t;

extern ov011_state_2bc_t data_ov011_021d3f20;

unsigned func_ov011_021ca584(void) {
    return (data_ov011_021d3f20.flags_2bc << 10) >> 28;
}
