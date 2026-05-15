/* func_020522c0: indexed byte read at offset 0x1d of stride-0x30 record.
 *
 *     ldr r2, .L_0205234c
 *     mov r1, #0x30
 *     ldr r2, [r2, #0x0]
 *     mla r1, r0, r1, r2          ; r1 = data->p + idx*0x30
 *     ldrb r0, [r1, #0x1d]
 *     bx  lr
 *  .L_0205234c: .word data_0219e30c
 *
 * Same `data_0219e30c.p` chain as brief-022 func_0207fdec (slot pointer);
 * here we read the byte at +0x1d of the slot.
 */

extern char *data_0219e30c;

unsigned char func_020522c0(int idx) {
    return *(unsigned char *)(data_0219e30c + idx * 0x30 + 0x1d);
}
