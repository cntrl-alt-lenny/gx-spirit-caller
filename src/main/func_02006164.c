/* func_02006164: bit 1 of `data_02103d74[0x28]`.
 *
 *     ldr r0, =data
 *     ldr r0, [r0, #0x28]
 *     mov r0, r0, lsl #0x1e   ; lsl 30 → bit at pos 1 → MSB
 *     mov r0, r0, lsr #0x1f   ; lsr 31 → return that bit
 */

typedef struct {
    char         _pad_0x00[0x28];
    unsigned int _bit0_pad : 1;
    unsigned int bit_1     : 1;
    unsigned int _hi       : 30;
} state_28_t;

extern state_28_t data_02103d74;

unsigned int func_02006164(void) {
    return data_02103d74.bit_1;
}
