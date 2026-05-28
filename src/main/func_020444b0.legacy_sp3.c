/* func_020444b0: stmfd-only prologue + helper(pool, LIT, arg) != 0 bool tail.
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     ldr r1, [pool]; mov r2, r0; ldr r0, [r1, #0]; mov r1, #0x400
 *     bl func_02043ca4(*data, 0x400, arg)
 *     cmp r0, #0; movne r0, #1; moveq r0, #0
 *     pop
 */
extern int data_0219da78;
extern int func_02043ca4(int p, int lit, int arg);

int func_020444b0(int arg) {
    return func_02043ca4(data_0219da78, 0x400, arg) != 0;
}
