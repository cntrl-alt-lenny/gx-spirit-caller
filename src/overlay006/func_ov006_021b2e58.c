/* func_ov006_021b2e58: callback-dispatch variant (brief-304 family). Dispatch
 * through the per-state callback table; on a truthy callback clear the state's
 * +4 flag and return 0. When there is no callback, register the default
 * handler (func_0201261c) and return 0. gotcha 5: the no-callback path is a
 * real branch (it contains a bl), so the if-tree is preserved. */
extern void func_0201261c(void);
extern void func_020057dc(void (*cb)(void));
extern int data_ov006_0224f1b0[];
extern int (*data_ov006_021cbb08[])(void);
int func_ov006_021b2e58(void) {
    int (*cb)(void) = data_ov006_021cbb08[data_ov006_0224f1b0[0]];
    if (cb != 0) {
        if (cb() != 0)
            data_ov006_0224f1b0[1] = 0;
        return 0;
    }
    func_020057dc(func_0201261c);
    return 0;
}
