/* func_ov002_0229e844: calls func_ov002_0229d32c twice — once
 * with arg, once with arg+0x14.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_0229d32c
 *     add   r0, r4, #0x14
 *     bl    func_ov002_0229d32c
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_0229d32c(void *p);

int func_ov002_0229e844(char *p) {
    func_ov002_0229d32c(p);
    return func_ov002_0229d32c(p + 0x14);
}
