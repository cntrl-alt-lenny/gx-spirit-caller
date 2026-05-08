/* func_0207afa0: 2-call helper, no arg passing. Style A.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0207cca8
 *     bl    func_0207afbc
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 */

extern void func_0207cca8(int x);
extern void func_0207afbc(void);

void func_0207afa0(int x) {
    func_0207cca8(x);
    func_0207afbc();
}
