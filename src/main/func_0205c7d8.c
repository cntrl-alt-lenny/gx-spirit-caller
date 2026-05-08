/* func_0205c7d8: invoke field, then clear it. Style B.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     ldr   r0, [r4, #0x0]
 *     bl    func_020453b4
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x0]
 *     ldmia sp!, {r4, pc}
 */

extern int func_020453b4(void *p);

void func_0205c7d8(void **p) {
    func_020453b4(*p);
    *p = 0;
}
