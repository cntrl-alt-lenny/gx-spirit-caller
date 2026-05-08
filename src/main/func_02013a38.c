/* func_02013a38: 3-call helper — initialises subsystems, returns
 * func_0201913c(0). Style B with r3-spill push.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02019124
 *     bl    func_0201adb0
 *     mov   r0, #0x0
 *     bl    func_0201913c
 *     ldmia sp!, {r3, pc}
 */

extern int func_02019124(void);
extern int func_0201adb0(void);
extern int func_0201913c(int x);

int func_02013a38(void) {
    func_02019124();
    func_0201adb0();
    return func_0201913c(0);
}
