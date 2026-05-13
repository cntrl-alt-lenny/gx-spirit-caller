/* func_02052bc4: same callee twice with different second args.
 * Calls func_02052be4(p, p+4) then func_02052be4(p, p+0x10).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     add   r1, r4, #0x4
 *     bl    func_02052be4
 *     mov   r0, r4
 *     add   r1, r4, #0x10
 *     bl    func_02052be4
 *     ldmia sp!, {r4, pc}
 */

extern int func_02052be4(void *p, void *q);

int func_02052bc4(char *p) {
    func_02052be4(p, p + 4);
    return func_02052be4(p, p + 0x10);
}
