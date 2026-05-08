/* func_02033344: same shape as func_0201e954.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02045744
 *     bl    func_020457d8
 *     ldmia sp!, {r3, pc}
 */

extern int func_02045744(void);
extern int func_020457d8(void);

int func_02033344(void) {
    func_02045744();
    return func_020457d8();
}
