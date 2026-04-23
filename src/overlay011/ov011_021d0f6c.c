/* func_ov011_021d0f6c: stride-40 record read — return low byte of
 * record[i].field[0xc].
 *
 *     ldr r2, .L_021d0f88
 *     mov r1, #0x28
 *     mla r1, r0, r1, r2
 *     ldr r0, [r1, #0xc]
 *     mov r0, r0, lsl #0x18
 *     mov r0, r0, lsr #0x18
 *     bx  lr
 */

extern char data_ov011_021d4660[];

unsigned int func_ov011_021d0f6c(int i) {
    int v = *(int *)(data_ov011_021d4660 + i * 0x28 + 0xc);
    return (unsigned int)(v << 24) >> 24;
}
