/* func_ov011_021ca67c: 4-bit field clear at `data_ov011_021d4000 + 0x2bc`.
 *
 *     ldr r0, .L_021ca690           ; r0 = &data_ov011_021d4000
 *     ldr r1, [r0, #0x2bc]          ; r1 = *(u32 *)(p + 0x2bc)
 *     bic r1, r1, #0x3c0000         ; clear bits 18..21
 *     str r1, [r0, #0x2bc]
 *     bx  lr
 * .L_021ca690: .word data_ov011_021d4000
 *
 * Pairs with ov011_021ca664's reader: this clears the 4-bit field,
 * that reads it. `0x003c0000` = bits 18..21 set.
 */

typedef struct {
    char _pad[0x2bc];
    unsigned int flags_2bc;
} ov011_state_2bc_t;

extern ov011_state_2bc_t data_ov011_021d4000;

void func_ov011_021ca67c(void) {
    data_ov011_021d4000.flags_2bc &= ~0x3c0000u;
}
