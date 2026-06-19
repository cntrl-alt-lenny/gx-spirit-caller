/* func_ov011_021cbb44: 2-field setter on the ov011 global state struct
 * at `data_ov011_021d3f20`, offsets 0x26c and 0x270.
 *
 *     ldr r2, .L_021cbc18           ; r2 = &data_ov011_021d3f20
 *     str r0, [r2, #0x26c]
 *     str r1, [r2, #0x270]
 *     bx  lr
 * .L_021cbc18: .word data_ov011_021d3f20
 *
 * Uses a struct typedef to force base+offset codegen — the natural
 * `*(int *)(data + 0x26c) = x;` form gets folded by mwcc into a
 * single `&data+0x26c` pool literal (see ov015_021b3f80.c for the
 * full note).
 */

typedef struct {
    char _pad[0x26c];
    int field_26c;
    int field_270;
} ov011_state_26c_t;

extern ov011_state_26c_t data_ov011_021d3f20;

void func_ov011_021cbb44(int a, int b) {
    data_ov011_021d3f20.field_26c = a;
    data_ov011_021d3f20.field_270 = b;
}
