/* func_ov003_021ca11c: dispatch step — index the per-state callback table by the
 * current state word; if a handler exists, invoke it and on a truthy result
 * advance the state (++[0]) and clear the +4 flag, returning 0; otherwise (no
 * handler) return 1. Dispatch family (ov006 family A recipe). (ov003_core.h) */
extern int (*data_ov003_021cf020[])(void);
extern int data_ov003_021cf580[];
int func_ov003_021ca11c(void) {
    int (*cb)(void) = data_ov003_021cf020[data_ov003_021cf580[0]];
    if (cb != 0) {
        if (cb() != 0) {
            data_ov003_021cf580[0]++;
            data_ov003_021cf580[1] = 0;
        }
        return 0;
    }
    return 1;
}
