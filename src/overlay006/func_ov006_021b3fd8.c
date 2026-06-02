/* func_ov006_021b3fd8: callback-dispatch family variant (state 0224f290,
 * table 021cbb50) with a state[4]=1 prologue; on no callback, publish state[6]
 * and post a deferred event. */
extern int          data_ov006_0224f290[];
extern int (*data_ov006_021cbb50[])(void);
extern char         data_021040ac[];
extern char         data_ov006_021cb518[];
extern void func_020071a4(int a, int b, void *c);
int func_ov006_021b3fd8(void) {
    data_ov006_0224f290[4] = 1;
    {
        int (*cb)(void) = data_ov006_021cbb50[data_ov006_0224f290[0]];
        if (cb != 0) {
            if (cb() != 0)
                data_ov006_0224f290[1] = 0;
            return 0;
        }
    }
    *(int *)(data_021040ac + 60) = data_ov006_0224f290[6];
    func_020071a4(4, 1, data_ov006_021cb518);
    return 1;
}
