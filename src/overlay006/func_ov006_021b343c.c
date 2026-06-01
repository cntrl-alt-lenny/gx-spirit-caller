/* func_ov006_021b343c: per-state dispatch step — index the per-state callback
 * table by the current state word; if a handler exists, invoke it and clear the
 * +4 flag on a truthy result; otherwise run the no-handler tail (register a
 * deferred action). Both paths return 0. Dispatch-family variant, sibling of
 * 021b22c8 (ov006_core.h §VERIFIED). */
extern int (*data_ov006_021cbb20[])(void);
extern int  data_ov006_0224f1fc[];
extern char data_ov006_021cb518[];
extern void func_020071a4(int, int, void *);
int func_ov006_021b343c(void) {
    int (*cb)(void) = data_ov006_021cbb20[data_ov006_0224f1fc[0]];
    if (cb != 0) {
        if (cb() != 0)
            data_ov006_0224f1fc[1] = 0;
        return 0;
    }
    func_020071a4(4, 1, data_ov006_021cb518);
    return 0;
}
