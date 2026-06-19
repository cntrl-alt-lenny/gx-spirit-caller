/* func_ov006_021b7b94: indexed halfword store to a global u16 array, return 1.
 *
 *     ldr  r0, .L_021b7ca8             ; r0 = &data_ov006_0224f2c8
 *     mov  r1, r1, lsl #0x1             ; r1 = idx * 2
 *     strh r2, [r0, r1]                 ; arr[idx] = value
 *     mov  r0, #0x1
 *     bx   lr
 *   .L_021b7ca8: .word data_ov006_0224f2c8
 */

extern unsigned short data_ov006_0224f2c8[];

int func_ov006_021b7b94(int unused, int idx, unsigned short value) {
    (void)unused;
    data_ov006_0224f2c8[idx] = value;
    return 1;
}
