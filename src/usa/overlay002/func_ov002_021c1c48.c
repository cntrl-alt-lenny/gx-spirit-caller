/* func_ov002_021c1c48: helper-call + masked-bool. Returns 1 iff
 * `(arg2 + 1) & helper(arg0, arg1)` is > 0 (signed).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r2
 *     bl    func_ov002_021c19f0
 *     add   r1, r4, #0x1
 *     and   r0, r1, r0
 *     cmp   r0, #0x0
 *     movgt r0, #0x1
 *     movle r0, #0x0
 *     ldmia sp!, {r4, pc}
 */

extern int func_ov002_021c19f0(int a, int b);

int func_ov002_021c1c48(int a, int b, int c) {
    return ((c + 1) & func_ov002_021c19f0(a, b)) > 0;
}
