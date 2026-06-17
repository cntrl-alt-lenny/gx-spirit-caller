/* func_02013980: first hard-tier match — 2-call forwarder.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_020190f0
 *     bl    func_02013948
 *     ldmia sp!, {r3, pc}
 *
 * Calls func_020190f0 then func_02013948, returns whatever the second call
 * returns. Has 29 callers across main/overlays — narrative
 * win: a single 4-instruction matched function resolves 29
 * previously-unresolved `bl` targets in the caller graph.
 */

extern void func_020190f0(void);
extern void func_02013948(void);

void func_02013980(void) {
    func_020190f0();
    func_02013948();
}
