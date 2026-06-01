/* func_ov006_021b4f20: dispatch through a per-state callback table; on a truthy
 * callback, clear the state's +4 flag. Returns 1 if no callback.
 * (021b5614 family — same recipe, per-member globals.) */
extern int data_ov006_0224f330[];                 /* [0]=state index, [1]=flag */
extern int (*data_ov006_021cbb8c[])(void);         /* per-state callback table */
int func_ov006_021b4f20(void) {
    int (*cb)(void) = data_ov006_021cbb8c[data_ov006_0224f330[0]];
    if (cb != 0) {
        if (cb() != 0)
            data_ov006_0224f330[1] = 0;
        return 0;
    }
    return 1;
}
