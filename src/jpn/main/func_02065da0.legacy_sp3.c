/* func_02065da0: stmfd-only + helper(?, pool, 6) == 0 bool tail.
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     ldr r1, [pool]; mov r2, #6
 *     bl func_020a734c(arg, pool, 6)
 *     cmp r0, #0; moveq r0, #1; movne r0, #0
 *     pop
 */
extern char data_021014b8[];
extern int func_020a734c(int arg, char *p, int n);

int func_02065da0(int arg) {
    return func_020a734c(arg, data_021014b8, 6) == 0;
}
