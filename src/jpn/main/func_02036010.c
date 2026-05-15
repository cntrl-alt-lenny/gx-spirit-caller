/* func_02036010: 3-call sandwich. Calls func_020954b4() to get
 * a saved value, then func_02095584(1) (intermediate), then
 * func_020954f4(saved). Returns last call's result.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    func_020954b4
 *     mov   r4, r0
 *     mov   r0, #0x1
 *     bl    func_02095584
 *     mov   r0, r4
 *     bl    func_020954f4
 *     ldmia sp!, {r4, pc}
 */

extern int func_020954b4(void);
extern int func_02095584(int x);
extern int func_020954f4(int x);

int func_02036010(void) {
    int saved = func_020954b4();
    func_02095584(1);
    return func_020954f4(saved);
}
