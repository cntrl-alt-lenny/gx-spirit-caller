/* func_ov003_021ca1fc: dispatch step — index the per-state callback table by the
 * current state word; if a handler exists, invoke it and on a truthy result
 * advance the state (++[0]) and clear the +4 flag, returning 0; otherwise (no
 * handler) return 1. Dispatch family (ov006 family A recipe). (ov003_core.h) */
extern int (*data_ov003_021cf160[])(void);
extern int data_ov003_021cf6c0[];
int func_ov003_021ca1fc(void) {
    int (*cb)(void) = data_ov003_021cf160[data_ov003_021cf6c0[0]];
    if (cb != 0) {
        if (cb() != 0) {
            data_ov003_021cf6c0[0]++;
            data_ov003_021cf6c0[1] = 0;
        }
        return 0;
    }
    return 1;
}
