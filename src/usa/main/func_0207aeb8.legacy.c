/* func_0207aeb8: 2-call helper, no arg passing. Style A.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0207cbc0
 *     bl    func_0207aed4
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 */

extern void func_0207cbc0(int x);
extern void func_0207aed4(void);

void func_0207aeb8(int x) {
    func_0207cbc0(x);
    func_0207aed4();
}
