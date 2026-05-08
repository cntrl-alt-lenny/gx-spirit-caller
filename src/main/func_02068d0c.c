/* func_02068d0c: twin of func_02068cd8 with different callees.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02067ba8
 *     add   r0, r4, #0x4c
 *     bl    func_020692d0
 *     ldmia sp!, {r4, pc}
 */

extern int func_02067ba8(void *p);
extern int func_020692d0(void *p);

int func_02068d0c(char *p) {
    func_02067ba8(p);
    return func_020692d0(p + 0x4c);
}
