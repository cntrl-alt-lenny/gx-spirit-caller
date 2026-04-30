/* func_0200ac2c: call func_02000e34, return 1.
 *
 *     stmdb sp!, {r3, lr}
 *     bl func_02000e34
 *     mov r0, #1
 *     ldmia sp!, {r3, pc}
 */

extern void func_02000e34(void);

int func_0200ac2c(void) {
    func_02000e34();
    return 1;
}
