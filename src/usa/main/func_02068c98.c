/* func_02068c98: twin of func_02068c64 with different callees.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02067b34
 *     add   r0, r4, #0x4c
 *     bl    func_0206925c
 *     ldmia sp!, {r4, pc}
 */

extern int func_02067b34(void *p);
extern int func_0206925c(void *p);

int func_02068c98(char *p) {
    func_02067b34(p);
    return func_0206925c(p + 0x4c);
}
