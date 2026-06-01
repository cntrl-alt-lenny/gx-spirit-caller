/* func_ov006_021b4048: callback-dispatch variant (brief-304 family) with a
 * state[4]=2 prologue and a func_020071a4 tail on the no-callback path.
 * Dispatch through the per-state callback table; on a truthy callback clear
 * the state's +4 flag and return 0. When there is no callback, kick the
 * step-2 transition and return 1. gotcha 5: the no-callback tail contains a
 * bl, so the if-tree is preserved (no predication of the constant return). */
extern void func_020071a4(int, int, void *);
extern int data_ov006_0224f290[];
extern int (*data_ov006_021cbb50[])(void);
extern char data_ov006_021cb518[];
int func_ov006_021b4048(void) {
    data_ov006_0224f290[4] = 2;
    {
        int (*cb)(void) = data_ov006_021cbb50[data_ov006_0224f290[0]];
        if (cb != 0) {
            if (cb() != 0)
                data_ov006_0224f290[1] = 0;
            return 0;
        }
    }
    func_020071a4(4, 1, data_ov006_021cb518);
    return 1;
}
