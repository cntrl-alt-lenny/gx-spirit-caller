/* func_02052350: indexed byte read at offset 0x1c of stride-0x30 record.
 * Sibling of func_02052334; offset differs by 1.
 *
 *     ldr r2, .L_02052368
 *     mov r1, #0x30
 *     ldr r2, [r2, #0x0]
 *     mla r1, r0, r1, r2
 *     ldrb r0, [r1, #0x1c]
 *     bx  lr
 */

extern char *data_0219e3ec;

unsigned char func_02052350(int idx) {
    return *(unsigned char *)(data_0219e3ec + idx * 0x30 + 0x1c);
}
