/* func_ov006_021b22c8: per-state dispatch step — index the per-state callback
 * table by the current state word; if a handler exists, invoke it and clear the
 * +4 flag on a truthy result, returning 0; otherwise run the no-handler tail
 * (register a deferred action) and return 1. Dispatch-family variant (extends
 * brief-304 family A; ov006_core.h §VERIFIED). */
extern int (*data_ov006_021cbac0[])(void);
extern int  data_ov006_021cf140[];
extern char data_ov006_021d6ed0[];
extern void func_020071a4(int, int, void *);
int func_ov006_021b22c8(void) {
    int (*cb)(void) = data_ov006_021cbac0[data_ov006_021cf140[0]];
    if (cb != 0) {
        if (cb() != 0)
            data_ov006_021cf140[1] = 0;
        return 0;
    }
    func_020071a4(4, 1, data_ov006_021d6ed0);
    return 1;
}
