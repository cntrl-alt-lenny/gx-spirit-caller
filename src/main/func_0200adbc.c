/* func_0200adbc: tail-call wrapper into func_02006c0c with
 * fixed args (-4, 0). The asm has a redundant `moveq r0, #0`
 * after the cmp — this matches `if (r == 0) return 0;` shape
 * (NOT C-11's `return r;` form, since the redundant mov is
 * present in the target).
 *
 *     stmdb sp!, {r3, lr}
 *     mvn   r1, #0x3                     ; r1 = -4
 *     mov   r2, #0x0
 *     bl    func_02006c0c
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern int func_02006c0c(int a, int b, int c);

int func_0200adbc(int x) {
    int r = func_02006c0c(x, -4, 0);
    if (r == 0) return 0;
    return r;
}
