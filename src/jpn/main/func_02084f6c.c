/* func_02084f6c: claim the data_021a4740 slot if currently null —
 * zero out the arg's first int and then save the arg pointer.
 *
 *     ldr r1, .L_02085070
 *     ldr r2, [r1, #0x0]
 *     cmp r2, #0x0
 *     moveq r2, #0x0
 *     streq r2, [r0, #0x0]
 *     streq r0, [r1, #0x0]
 *     bx  lr
 *  .L_02085070: .word data_021a4740
 *
 * If the global slot is null on entry, *arg = 0 then global = arg.
 * If non-null, fall through with no side effect.
 */

extern int *data_021a4740;

void func_02084f6c(int *p) {
    if (data_021a4740 == 0) {
        *p = 0;
        data_021a4740 = p;
    }
}
