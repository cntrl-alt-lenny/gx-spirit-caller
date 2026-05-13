/* func_020332f4: same shape as func_0201e900.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0204569c
 *     bl    func_02045730
 *     ldmia sp!, {r3, pc}
 */

extern int func_0204569c(void);
extern int func_02045730(void);

int func_020332f4(void) {
    func_0204569c();
    return func_02045730();
}
