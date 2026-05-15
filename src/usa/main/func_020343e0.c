/* func_020343e0: side-effect call + global zero. Calls
 * func_02034134() (return discarded) then sets data_0219b1fc = 0.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02034134
 *     ldr   r0, .L_02034448
 *     mov   r1, #0x0
 *     str   r1, [r0, #0x0]
 *     ldmia sp!, {r3, pc}
 *  .L_02034448: .word data_0219b1fc
 */

extern int func_02034134(void);
extern void *data_0219b1fc;

void func_020343e0(void) {
    func_02034134();
    data_0219b1fc = 0;
}
