/* func_0207fed4: `data->ptr + idx * 0x30` (slot pointer); same shape
 * as func_0205236c on a different state struct.
 *
 *     ldr r2, .L_0207fee8
 *     mov r1, #0x30
 *     ldr r2, [r2, #0x0]      ; deref to get array base
 *     mla r0, r1, r0, r2      ; idx * 0x30 + base
 *     bx  lr
 *  .L_0207fee8: .word data_021a18b4
 */

extern char *data_021a18b4;

void *func_0207fed4(int idx) {
    return data_021a18b4 + idx * 0x30;
}
