/* func_ov002_021c1d40: clone of func_ov002_021c1c48 with helper
 * func_ov002_021c1c6c.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r2
 *     bl    func_ov002_021c1c6c
 *     add   r1, r4, #0x1
 *     and   r0, r1, r0
 *     cmp   r0, #0x0
 *     movgt r0, #0x1
 *     movle r0, #0x0
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_021c1c6c(int a, int b);

int func_ov002_021c1d40(int a, int b, int c) {
    return ((c + 1) & func_ov002_021c1c6c(a, b)) > 0;
}
