/* func_0205ae4c: family 14b92c28 — try func_02058070(a, *a+0x450, b);
 * return its result if non-zero, else return the same call with c.
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r6, r0
 *     ldr   r4, [r6, #0x0]
 *     mov   r5, r2               ; c
 *     mov   r2, r1               ; b
 *     add   r1, r4, #0x450
 *     bl    func_02058070
 *     cmp   r0, #0x0
 *     popne {r4, r5, r6, pc}     ; if (r != 0) return r
 *     mov   r0, r6
 *     mov   r2, r5
 *     add   r1, r4, #0x450
 *     bl    func_02058070
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     pop   {r4, r5, r6, pc}
 */

extern int func_02058070(int *a, int p, int n);

int func_0205ae4c(int *a, int b, int c) {
    int base = *a;          /* kept in a callee-saved reg across both calls */
    int r = func_02058070(a, base + 0x450, b);
    if (r != 0) return r;
    r = func_02058070(a, base + 0x450, c);
    if (r != 0) return r;
    return 0;
}
