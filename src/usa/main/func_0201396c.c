/* func_0201396c: return `1 << func_02013964(arg)`.
 *
 *     stmdb sp!, {r3, lr}
 *     bl func_02013964
 *     mov r1, #0x1
 *     mov r0, r1, lsl r0    ; r0 = 1 << r0 (= 1 << result)
 *     ldmia sp!, {r3, pc}
 */

extern int func_02013964(int arg);

int func_0201396c(int arg) {
    return 1 << func_02013964(arg);
}
