/* func_ov011_021d1210: stride-40 record read — return bit 5 of
 * record[i].field[0x18].
 *
 *     ldr r2, .L_021d122c
 *     mov r1, #0x28
 *     mla r1, r0, r1, r2
 *     ldr r0, [r1, #0x18]
 *     mov r0, r0, lsl #0x1a        ; (x << 26) >> 31 = bit 5
 *     mov r0, r0, lsr #0x1f
 *     bx  lr
 */

extern char data_ov011_021d4660[];

unsigned int func_ov011_021d1210(int i) {
    int v = *(int *)(data_ov011_021d4660 + i * 0x28 + 0x18);
    return (unsigned int)(v << 26) >> 31;
}
