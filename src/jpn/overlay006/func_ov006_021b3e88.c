/* func_ov006_021b3e88: clear the state's +0x10 word, then dispatch through
 * the per-state callback table; on a truthy callback, clear the +4 flag.
 * Returns 1 if no callback. (021b5614 family — variant with a leading reset.) */
extern int data_ov006_0224f170[];                 /* [0]=index, [1]=flag, [4]=reset word */
extern int (*data_ov006_021cba30[])(void);         /* per-state callback table */
int func_ov006_021b3e88(void) {
    data_ov006_0224f170[4] = 0;
    {
        int (*cb)(void) = data_ov006_021cba30[data_ov006_0224f170[0]];
        if (cb != 0) {
            if (cb() != 0)
                data_ov006_0224f170[1] = 0;
            return 0;
        }
    }
    return 1;
}
