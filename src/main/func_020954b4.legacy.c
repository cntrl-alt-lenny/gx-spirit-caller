/* func_020954b4: 2-call subtract chain. Computes
 * (0x100 - func_02095514()) - func_020954d4(). Style A.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    func_02095514
 *     mov   r4, r0
 *     bl    func_020954d4
 *     rsb   r1, r4, #0x100
 *     sub   r0, r1, r0
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int func_02095514(void);
extern int func_020954d4(void);

int func_020954b4(void) {
    int a = func_02095514();
    int b = func_020954d4();
    return (0x100 - a) - b;
}
