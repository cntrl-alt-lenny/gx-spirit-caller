/* func_02076244: arg-preserving 2-call composition. Calls
 * func_02078dcc(arg0+0x1e0, arg1) and returns arg2 unchanged.
 * Style A epilogue → .legacy.c.
 *
 *     stmdb sp!, {r4, lr}
 *     add   r0, r0, #0x1e0
 *     mov   r4, r2
 *     bl    func_02078dcc
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int func_02078dcc(void *p, int b);

int func_02076244(char *p, int b, int c) {
    func_02078dcc(p + 0x1e0, b);
    return c;
}
