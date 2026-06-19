/* func_ov007_021b2b44: calls func_020221e0 with literal arg 2,
 * then returns 1.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r0, #0x2
 *     bl    func_020221e0
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_020221e0(int x);

int func_ov007_021b2b44(void) {
    func_020221e0(2);
    return 1;
}
