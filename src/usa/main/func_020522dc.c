/* func_020522dc: indexed byte read at offset 0x1c of stride-0x30 record.
 * Sibling of func_020522c0; offset differs by 1.
 *
 *     ldr r2, .L_02052368
 *     mov r1, #0x30
 *     ldr r2, [r2, #0x0]
 *     mla r1, r0, r1, r2
 *     ldrb r0, [r1, #0x1c]
 *     bx  lr
 */

extern char *data_0219e30c;

unsigned char func_020522dc(int idx) {
    return *(unsigned char *)(data_0219e30c + idx * 0x30 + 0x1c);
}
