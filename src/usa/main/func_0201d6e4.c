/* func_0201d6e4: clone of func_0201d6bc with different magic constant
 * (0x4f424a44 = 'DJBO'? actually 'DJBO' reversed) and base offset 0x20.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_0201d75c           ; 0x4f424a44
 *     bl    func_0201d5cc
 *     ldr   r1, [r0, #0xc]
 *     add   r2, r0, #0x20
 *     add   r0, r1, #0x3
 *     bic   r0, r0, #0x3
 *     add   r0, r2, r0
 *     ldmia sp!, {r3, pc}
 */

extern void *func_0201d5cc(void *self, unsigned int tag);

void *func_0201d6e4(void *self) {
    char *p = (char *)func_0201d5cc(self, 0x4f424a44u);
    unsigned int len = *(unsigned int *)(p + 0xc);
    return p + 0x20 + ((len + 3) & ~3u);
}
