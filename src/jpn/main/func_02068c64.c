/* func_02068c64: 2-call helper with offset arg (+0x4c).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02068c7c
 *     add   r0, r4, #0x4c
 *     bl    func_0206b51c
 *     ldmia sp!, {r4, pc}
 */

extern int func_02068c7c(void *p);
extern int func_0206b51c(void *p);

int func_02068c64(char *p) {
    func_02068c7c(p);
    return func_0206b51c(p + 0x4c);
}
