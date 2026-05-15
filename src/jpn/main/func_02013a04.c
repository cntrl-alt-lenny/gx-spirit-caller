/* func_02013a04: 3-call helper — initialises subsystems, returns
 * func_02019108(0). Style B with r3-spill push.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_020190f0
 *     bl    func_0201ad70
 *     mov   r0, #0x0
 *     bl    func_02019108
 *     ldmia sp!, {r3, pc}
 */

extern int func_020190f0(void);
extern int func_0201ad70(void);
extern int func_02019108(int x);

int func_02013a04(void) {
    func_020190f0();
    func_0201ad70();
    return func_02019108(0);
}
