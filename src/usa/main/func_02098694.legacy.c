/* func_02098694: side-effect call returning constant 1. Style A.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_020986b0
 *     mov   r0, #0x1
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 */

extern int func_020986b0(int x);

int func_02098694(int x) {
    func_020986b0(x);
    return 1;
}
