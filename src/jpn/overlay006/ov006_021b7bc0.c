/* func_ov006_021b7bc0: 2D-indexed halfword store to the same
 * stride-14 record table as func_ov006_021b7be0. 4 args:
 * leading-unused, record-index, field-index, value. Return 1.
 *
 *     ldr  ip, .L_021b7cdc              ; r12 = &data_ov006_0224f2e0
 *     mov  r0, #0xe                     ; stride = 14
 *     mla  r0, r1, r0, ip               ; r0 = r1 * 14 + base
 *     mov  r1, r2, lsl #0x1             ; r1 = j * 2
 *     strh r3, [r1, r0]                 ; record[j] = v
 *     mov  r0, #0x1
 *     bx   lr
 *   .L_021b7cdc: .word data_ov006_0224f2e0
 */

extern char data_ov006_0224f2e0[];

int func_ov006_021b7bc0(int unused, int i, int j, unsigned short v) {
    unsigned short *record;

    (void)unused;
    record = (unsigned short *)(data_ov006_0224f2e0 + i * 14);
    record[j] = v;
    return 1;
}
