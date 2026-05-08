/* func_0208bf8c: 2-call helper, no args. Style A.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_0208be9c
 *     bl    func_0208bed8
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 */

extern void func_0208be9c(void);
extern void func_0208bed8(void);

void func_0208bf8c(void) {
    func_0208be9c();
    func_0208bed8();
}
