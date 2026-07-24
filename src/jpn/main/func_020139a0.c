/* func_020139a0: first hard-tier match — 2-call forwarder.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_020190f0
 *     bl    func_0201396c
 *     ldmia sp!, {r3, pc}
 *
 * Calls func_020190f0 then func_0201396c, returns whatever the second call
 * returns. Has 1 callers across main/overlays — narrative
 * win: a single 4-instruction matched function resolves 1
 * previously-unresolved `bl` targets in the caller graph.
 */

extern void func_020190f0(void);
extern void func_0201396c(void);

void func_020139a0(void) {
    func_020190f0();
    func_0201396c();
}
