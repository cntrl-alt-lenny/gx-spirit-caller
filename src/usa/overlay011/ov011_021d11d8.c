/* func_ov011_021d11d8: stride-40 record read — return bit 8 of
 * record[i].field[0x18] (the same word as 021d11f0 and 021d1210, different bit).
 *
 *     ldr r2, .L_021d12b8
 *     mov r1, #0x28
 *     mla r1, r0, r1, r2
 *     ldr r0, [r1, #0x18]
 *     mov r0, r0, lsl #0x17        ; (x << 23) >> 31 = bit 8
 *     mov r0, r0, lsr #0x1f
 *     bx  lr
 */

extern char data_ov011_021d4580[];

unsigned int func_ov011_021d11d8(int i) {
    int v = *(int *)(data_ov011_021d4580 + i * 0x28 + 0x18);
    return (unsigned int)(v << 23) >> 31;
}
