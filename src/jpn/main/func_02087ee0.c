/* func_02087ee0: indexed store data[idx*0x24] = arg.
 *
 *     mov r2, #0x24
 *     mul r2, r0, r2          ; r2 = idx * 0x24
 *     ldr r0, .L_02087fdc
 *     str r1, [r0, r2]        ; *(int *)(base + idx*0x24) = arg
 *     bx  lr
 *  .L_02087fdc: .word data_021a4bf0
 *
 * mwcc emits `mov` + `mul` here rather than `mla` because the only
 * accumulator slot is consumed by the address load — see func_020522f8
 * for the `mla` variant when base is loaded earlier.
 */

extern char data_021a4bf0[];

void func_02087ee0(int idx, int arg) {
    *(int *)(data_021a4bf0 + idx * 0x24) = arg;
}
