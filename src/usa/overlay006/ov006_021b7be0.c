/* func_ov006_021b7be0: 2D-indexed signed-halfword load from a
 * stride-14 record table. Takes a leading unused arg (probably a
 * context pointer the caller convention uses elsewhere), followed
 * by record-index `i` and field-index `j`.
 *
 *     ldr   r3, .L_021b7cf8             ; r3 = &data_ov006_0224f2e0
 *     mov   r0, #0xe                    ; stride = 14
 *     mla   r0, r1, r0, r3              ; r0 = r1 * 14 + r3 (base + i*14)
 *     mov   r1, r2, lsl #0x1            ; r1 = j * 2
 *     ldrsh r0, [r1, r0]                ; return (short)r0[r1]
 *     bx    lr
 *   .L_021b7cf8: .word data_ov006_0224f2e0
 *
 * The leading unused arg (r0 ignored) is why `i` lands in r1 and `j`
 * in r2 instead of the usual r0/r1. This 3-arg shape is consistent
 * with a "handle-object-style" getter on some codebases.
 */

extern char data_ov006_0224f2e0[];

int func_ov006_021b7be0(int unused, int i, int j) {
    short *record;

    (void)unused;
    record = (short *)(data_ov006_0224f2e0 + i * 14);
    return record[j];
}
