/* func_ov011_021d1d18: sign-extend low byte of int at data_ov011_021d403c+0x284.
 *
 *     ldr r0, .L = data_ov011_021d403c
 *     ldr r0, [r0, #0x284]
 *     mov r0, r0, lsl #0x18
 *     mov r0, r0, asr #0x18
 *     bx  lr
 *
 * The `lsl #24; asr #24` is mwcc's idiom for `(signed char)(int)x` —
 * sign-extending the low 8 bits of a 32-bit word. The field is
 * stored full-width (ldr, not ldrb) but only the low byte carries
 * meaning.
 */

typedef struct {
    char _pad[0x284];
    int word;
} ov011_state_284_t;

extern ov011_state_284_t data_ov011_021d403c;

int func_ov011_021d1d18(void) {
    return (signed char)data_ov011_021d403c.word;
}
