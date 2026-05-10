/* func_020a36c8: double-deref getter — return (*data)->f_8.
 *
 *     ldr r0, .L_020a36d8
 *     ldr r0, [r0, #0x0]
 *     ldr r0, [r0, #0x8]
 *     bx  lr
 *  .L_020a36d8: .word data_021a98f8
 */

extern char data_021a98f8[];

int func_020a36c8(void) {
    char *p = *(char **)data_021a98f8;
    return *(int *)(p + 0x8);
}
