/* func_020a605c: 2-call helper with constant arg. sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     mov   r0, #0x2
 *     bl    func_020a5d10
 *     bl    func_02093b08
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 */

extern int func_020a5d10(int x);
extern int func_02093b08(void);

void func_020a605c(void) {
    func_020a5d10(2);
    func_02093b08();
}
