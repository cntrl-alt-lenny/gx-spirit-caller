/* func_02034430: side-effect call + global zero. Calls
 * func_02034184() (return discarded) then sets data_0219b2dc = 0.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02034184
 *     ldr   r0, .L_02034448
 *     mov   r1, #0x0
 *     str   r1, [r0, #0x0]
 *     ldmia sp!, {r3, pc}
 *  .L_02034448: .word data_0219b2dc
 */

extern int func_02034184(void);
extern void *data_0219b2dc;

void func_02034430(void) {
    func_02034184();
    data_0219b2dc = 0;
}
