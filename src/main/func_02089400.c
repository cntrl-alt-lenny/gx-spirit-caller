/* func_02089400: atomic-style swap of data_021a5800; return previous value.
 *
 *     ldr r1, .L_02089414
 *     ldr r2, [r1, #0x0]       ; old = *p
 *     str r0, [r1, #0x0]       ; *p = arg
 *     mov r0, r2               ; return old
 *     bx  lr
 *  .L_02089414: .word data_021a5800
 */

extern int data_021a5800;

int func_02089400(int new_val) {
    int old = data_021a5800;
    data_021a5800 = new_val;
    return old;
}
