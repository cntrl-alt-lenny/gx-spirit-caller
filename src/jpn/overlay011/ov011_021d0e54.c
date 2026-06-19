/* func_ov011_021d0e54: stride-40 record read — return bits 13..23
 * (11-bit field) of record[i].field[0x8] where records are 40 bytes.
 *
 *     ldr r2, .L_021d0f34
 *     mov r1, #0x28                ; stride = 0x28 (40)
 *     mla r1, r0, r1, r2           ; r1 = base + i * 40
 *     ldr r0, [r1, #0x8]           ; r0 = record.field_0x8
 *     mov r0, r0, lsl #0xd         ; (x << 13) >> 24 = bits 13..23
 *     mov r0, r0, lsr #0x18
 *     bx  lr
 */

extern char data_ov011_021d4580[];

unsigned int func_ov011_021d0e54(int i) {
    int v = *(int *)(data_ov011_021d4580 + i * 0x28 + 0x8);
    return (unsigned int)(v << 13) >> 24;
}
