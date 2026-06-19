/* func_ov006_021b333c: per-state dispatch step — index the per-state callback
 * table by the current state word; if a handler exists, invoke it and clear the
 * +4 flag on a truthy result; otherwise run the no-handler tail (register a
 * deferred action). Both paths return 0. Dispatch-family variant, sibling of
 * 021b22c8 (ov006_core.h §VERIFIED). */
extern int (*data_ov006_021cba00[])(void);
extern int  data_ov006_0224f0dc[];
extern char data_ov006_021cb438[];
extern void func_02007188(int, int, void *);
int func_ov006_021b333c(void) {
    int (*cb)(void) = data_ov006_021cba00[data_ov006_0224f0dc[0]];
    if (cb != 0) {
        if (cb() != 0)
            data_ov006_0224f0dc[1] = 0;
        return 0;
    }
    func_02007188(4, 1, data_ov006_021cb438);
    return 0;
}
