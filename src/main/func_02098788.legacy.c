/* func_02098788: side-effect call returning constant 1. Style A.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_020987a4
 *     mov   r0, #0x1
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 */

extern int func_020987a4(int x);

int func_02098788(int x) {
    func_020987a4(x);
    return 1;
}
