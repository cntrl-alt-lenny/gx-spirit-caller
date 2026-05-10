/* func_0201d6b4: lookup-or-zero. Calls func_0201d620(x, 'BGDT')
 * and returns r->byte_a if non-null, else 0. Predicated
 * `ldrneb` + `moveq`.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_0201d6d0                ; 'BGDT'
 *     bl    func_0201d620
 *     cmp   r0, #0x0
 *     ldrneb r0, [r0, #0xa]
 *     moveq r0, #0x0
 *     ldmia sp!, {r3, pc}
 *  .L_0201d6d0: .word 0x42474454
 */

extern unsigned char *func_0201d620(int x, int sig);

int func_0201d6b4(int x) {
    unsigned char *r = func_0201d620(x, 0x42474454);
    if (r != 0) return r[0xa];
    return 0;
}
