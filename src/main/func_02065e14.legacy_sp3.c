/* func_02065e14: stmfd-only + helper(?, pool, 6) == 0 bool tail.
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     ldr r1, [pool]; mov r2, #6
 *     bl func_020a7440(arg, pool, 6)
 *     cmp r0, #0; moveq r0, #1; movne r0, #0
 *     pop
 */
extern char data_02101598[];
extern int func_020a7440(int arg, char *p, int n);

int func_02065e14(int arg) {
    return func_020a7440(arg, data_02101598, 6) == 0;
}
