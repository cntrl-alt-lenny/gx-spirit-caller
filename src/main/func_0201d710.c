/* func_0201d710: call helper with magic constant, then compute
 * `p + 0x1c + ((p->f_c + 3) & ~3)` (align next-block-start to 4).
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_0201d734           ; 'DTGB' = 0x42474454
 *     bl    func_0201d620
 *     ldr   r1, [r0, #0xc]
 *     add   r2, r0, #0x1c
 *     add   r0, r1, #0x3
 *     bic   r0, r0, #0x3
 *     add   r0, r2, r0
 *     ldmia sp!, {r3, pc}
 */

extern void *func_0201d620(void *self, unsigned int tag);

void *func_0201d710(void *self) {
    char *p = (char *)func_0201d620(self, 0x42474454u);
    unsigned int len = *(unsigned int *)(p + 0xc);
    return p + 0x1c + ((len + 3) & ~3u);
}
