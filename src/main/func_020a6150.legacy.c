/* func_020a6150: 2-call helper with constant arg. sp3 signature.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     mov   r0, #0x2
 *     bl    func_020a5e04
 *     bl    func_02093bfc
 *     add   sp, sp, #0x4
 *     ldmia sp!, {lr}
 *     bx    lr
 */

extern int func_020a5e04(int x);
extern int func_02093bfc(void);

void func_020a6150(void) {
    func_020a5e04(2);
    func_02093bfc();
}
