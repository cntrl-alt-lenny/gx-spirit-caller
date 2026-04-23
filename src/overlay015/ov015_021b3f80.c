/* func_ov015_021b3f80: set bit 2 on the int at data_ov015_021b5e28 + 0xaa0.
 *
 *     ldr r0, .L_021b3f94
 *     ldr r1, [r0, #0xaa0]
 *     orr r1, r1, #0x4
 *     str r1, [r0, #0xaa0]
 *     bx  lr
 * .L_021b3f94: .word data_ov015_021b5e28
 *
 * Flag-on accessor for a bitfield 0xaa0 bytes into the ov015 module
 * state struct.
 */

/* Shape enforces base+offset codegen: a plain
 * `*(int *)(data_ov015_021b5e28 + 0xaa0) |= 0x4;` gets folded by mwcc
 * into a single `&base+0xaa0` literal, emitting `ldr r1, [r0, #0]`
 * rather than the baserom's `ldr r1, [r0, #0xaa0]`. Accessing the
 * field through a struct typedef forces the offset-form. */
typedef struct {
    char _pad[0xaa0];
    int flags;
} ov015_state_tail_t;

extern ov015_state_tail_t data_ov015_021b5e28;

void func_ov015_021b3f80(void) {
    data_ov015_021b5e28.flags |= 0x4;
}
