/* func_ov011_021d11f0: stride-40 record read — return bit 8 of
 * record[i].field[0x18].
 *
 *     ldr r2, .L_021d120c
 *     mov r1, #0x28
 *     mla r1, r0, r1, r2
 *     ldr r0, [r1, #0x18]
 *     mov r0, r0, lsl #0x18
 *     mov r0, r0, lsr #0x1f        ; (x << 24) >> 31 = bit 7 of low byte
 *     bx  lr                        ;                  (= bit 7 of the field)
 */

extern char data_ov011_021d4660[];

unsigned int func_ov011_021d11f0(int i) {
    int v = *(int *)(data_ov011_021d4660 + i * 0x28 + 0x18);
    return (unsigned int)(v << 24) >> 31;
}
