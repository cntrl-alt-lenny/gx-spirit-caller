/* func_ov007_021b2c44: calls func_02022234 with literal arg 2,
 * then returns 1.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r0, #0x2
 *     bl    func_02022234
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_02022234(int x);

int func_ov007_021b2c44(void) {
    func_02022234(2);
    return 1;
}
