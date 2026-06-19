/* func_ov006_021b2d58: callback-dispatch variant (brief-304 family). Dispatch
 * through the per-state callback table; on a truthy callback clear the state's
 * +4 flag and return 0. When there is no callback, register the default
 * handler (func_020125e8) and return 0. gotcha 5: the no-callback path is a
 * real branch (it contains a bl), so the if-tree is preserved. */
extern void func_020125e8(void);
extern void func_020057c0(void (*cb)(void));
extern int data_ov006_0224f090[];
extern int (*data_ov006_021cb9e8[])(void);
int func_ov006_021b2d58(void) {
    int (*cb)(void) = data_ov006_021cb9e8[data_ov006_0224f090[0]];
    if (cb != 0) {
        if (cb() != 0)
            data_ov006_0224f090[1] = 0;
        return 0;
    }
    func_020057c0(func_020125e8);
    return 0;
}
