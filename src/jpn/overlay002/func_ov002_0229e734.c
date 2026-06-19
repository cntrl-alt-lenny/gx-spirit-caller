/* func_ov002_0229e734: calls func_ov002_0229d21c twice — once
 * with arg, once with arg+0x14.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_0229d21c
 *     add   r0, r4, #0x14
 *     bl    func_ov002_0229d21c
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_0229d21c(void *p);

int func_ov002_0229e734(char *p) {
    func_ov002_0229d21c(p);
    return func_ov002_0229d21c(p + 0x14);
}
