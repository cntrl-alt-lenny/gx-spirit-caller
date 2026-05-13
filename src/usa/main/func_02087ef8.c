/* func_02087ef8: indexed 32-bit store of zero-extended u16.
 *
 *     mov r2, #0x24
 *     mul r2, r0, r2          ; r2 = idx * 0x24
 *     mov r0, r1, lsl #0x10
 *     ldr r1, .L_02087ffc
 *     mov r0, r0, lsr #0x10    ; r0 = (u16) v zero-extended
 *     str r0, [r1, r2]         ; *(int *)(base + idx*0x24) = r0
 *     bx  lr
 *  .L_02087ffc: .word data_021a4bec
 *
 * Variant of brief-020 func_02087ee0: same stride-0x24 indexed
 * 32-bit store, but the value is widened from u16 (so mwcc emits
 * `lsl 16; lsr 16` to zero-extend before the `str`).
 */

extern char data_021a4bec[];

void func_02087ef8(int idx, int v) {
    *(int *)(data_021a4bec + idx * 0x24) = (unsigned short)v;
}
