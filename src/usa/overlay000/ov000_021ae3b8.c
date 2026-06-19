/* func_ov000_021ae3b8: extract top byte of u32 field at data+0x2a8.
 *
 *     ldr r0, .L
 *     ldr r0, [r0, #0x2a8]
 *     mov r0, r0, lsr #0x18       ; >> 24 (unsigned)
 *     bx  lr
 *
 * Same global (data_ov000_021c74ac) as func_ov000_021adb3c but at
 * a different offset. Each file declares its own typedef for the
 * padding shape; they don't need to agree since externs match by
 * symbol name not type.
 */

typedef struct {
    char _pad[0x2a8];
    unsigned int field_2a8;
} ov000_state_2a8_t;

extern ov000_state_2a8_t data_ov000_021c74ac;

unsigned func_ov000_021ae3b8(void) {
    return data_ov000_021c74ac.field_2a8 >> 24;
}
