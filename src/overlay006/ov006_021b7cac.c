/* func_ov006_021b7cac: indexed signed-halfword load from a global u16 array.
 *
 *     ldr   r0, .L_021b7cbc            ; r0 = &data_ov006_0224f3e8
 *     mov   r1, r1, lsl #0x1            ; r1 = idx * 2
 *     ldrsh r0, [r0, r1]                ; r0 = (short)arr[idx]
 *     bx    lr
 *   .L_021b7cbc: .word data_ov006_0224f3e8
 *
 * 3 insns + 1 pool word = 0x14 bytes.
 */

extern short data_ov006_0224f3e8[];

int func_ov006_021b7cac(int unused, int idx) {
    (void)unused;
    return data_ov006_0224f3e8[idx];
}
