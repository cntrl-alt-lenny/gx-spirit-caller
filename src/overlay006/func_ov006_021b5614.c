/* func_ov006_021b5614: dispatch through a per-state callback table; on a
 * truthy callback, clear the state's +4 flag. Returns 1 if no callback. */
extern int data_ov006_0224f38c[];               /* [0]=state index, [1]=flag */
extern int (*data_ov006_021cbbb0[])(void);       /* per-state callback table */
int func_ov006_021b5614(void) {
    int (*cb)(void) = data_ov006_021cbbb0[data_ov006_0224f38c[0]];
    if (cb != 0) {
        if (cb() != 0)
            data_ov006_0224f38c[1] = 0;
        return 0;
    }
    return 1;
}
