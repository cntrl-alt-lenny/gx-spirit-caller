/* func_02089318: atomic-style swap of data_021a5720; return previous value.
 *
 *     ldr r1, .L_02089414
 *     ldr r2, [r1, #0x0]       ; old = *p
 *     str r0, [r1, #0x0]       ; *p = arg
 *     mov r0, r2               ; return old
 *     bx  lr
 *  .L_02089414: .word data_021a5720
 */

extern int data_021a5720;

int func_02089318(int new_val) {
    int old = data_021a5720;
    data_021a5720 = new_val;
    return old;
}
