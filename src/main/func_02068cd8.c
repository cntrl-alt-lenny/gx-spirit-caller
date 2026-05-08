/* func_02068cd8: 2-call helper with offset arg (+0x4c).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02068cf0
 *     add   r0, r4, #0x4c
 *     bl    func_0206b590
 *     ldmia sp!, {r4, pc}
 */

extern int func_02068cf0(void *p);
extern int func_0206b590(void *p);

int func_02068cd8(char *p) {
    func_02068cf0(p);
    return func_0206b590(p + 0x4c);
}
