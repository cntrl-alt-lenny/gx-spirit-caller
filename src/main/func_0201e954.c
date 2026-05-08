/* func_0201e954: 2-call helper. Style B with r3-spill.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0201e928
 *     bl    func_0201d5e8
 *     ldmia sp!, {r3, pc}
 */

extern int func_0201e928(void);
extern int func_0201d5e8(void);

int func_0201e954(void) {
    func_0201e928();
    return func_0201d5e8();
}
