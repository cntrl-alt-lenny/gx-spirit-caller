/* func_020139b4: first hard-tier match — 2-call forwarder.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02019124
 *     bl    func_0201397c
 *     ldmia sp!, {r3, pc}
 *
 * Calls func_02019124 then func_0201397c, returns whatever the second call
 * returns. Has 29 callers across main/overlays — narrative
 * win: a single 4-instruction matched function resolves 29
 * previously-unresolved `bl` targets in the caller graph.
 */

extern void func_02019124(void);
extern void func_0201397c(void);

void func_020139b4(void) {
    func_02019124();
    func_0201397c();
}
