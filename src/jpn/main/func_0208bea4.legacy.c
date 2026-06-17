/* func_0208bea4: 2-call helper, no args. Style A.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0208bdb4
 *     bl    func_0208bdf0
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 */

extern void func_0208bdb4(void);
extern void func_0208bdf0(void);

void func_0208bea4(void) {
    func_0208bdb4();
    func_0208bdf0();
}
