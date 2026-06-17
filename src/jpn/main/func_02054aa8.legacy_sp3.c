/* func_02054aa8: stmfd-only prologue + *data = helper(*data).
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     ldr r0, [pool]; ldr r0, [r0, #0]  ; r0 = *data
 *     bl func_02054ad0(*data)
 *     ldr r1, [pool]; str r0, [r1, #0]  ; *data = helper_ret
 *     pop
 */
extern int data_020ffaf4;
extern int func_02054ad0(int n);

void func_02054aa8(void) {
    data_020ffaf4 = func_02054ad0(data_020ffaf4);
}
