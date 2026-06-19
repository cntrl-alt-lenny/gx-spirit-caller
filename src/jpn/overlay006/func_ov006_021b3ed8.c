/* func_ov006_021b3ed8: callback-dispatch family variant (state 0224f290,
 * table 021cbb50) with a state[4]=1 prologue; on no callback, publish state[6]
 * and post a deferred event. */
extern int          data_ov006_0224f170[];
extern int (*data_ov006_021cba30[])(void);
extern char         data_02103fcc[];
extern char         data_ov006_021cb438[];
extern void func_02007188(int a, int b, void *c);
int func_ov006_021b3ed8(void) {
    data_ov006_0224f170[4] = 1;
    {
        int (*cb)(void) = data_ov006_021cba30[data_ov006_0224f170[0]];
        if (cb != 0) {
            if (cb() != 0)
                data_ov006_0224f170[1] = 0;
            return 0;
        }
    }
    *(int *)(data_02103fcc + 60) = data_ov006_0224f170[6];
    func_02007188(4, 1, data_ov006_021cb438);
    return 1;
}
