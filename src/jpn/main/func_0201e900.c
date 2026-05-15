/* func_0201e900: 2-call helper. Style B with r3-spill.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0201e8d4
 *     bl    func_0201d594
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201e8d4(void);
extern int func_0201d594(void);

int func_0201e900(void) {
    func_0201e8d4();
    return func_0201d594();
}
