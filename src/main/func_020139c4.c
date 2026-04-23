/* func_020139c4: first hard-tier match — 2-call forwarder.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02019124
 *     bl    func_02013998
 *     ldmia sp!, {r3, pc}
 *
 * Calls func_02019124 then func_02013998, returns whatever the second call
 * returns. Has 27 callers across main/overlays — narrative
 * win: a single 4-instruction matched function resolves 27
 * previously-unresolved `bl` targets in the caller graph.
 */

extern void func_02019124(void);
extern void func_02013998(void);

void func_020139c4(void) {
    func_02019124();
    func_02013998();
}
