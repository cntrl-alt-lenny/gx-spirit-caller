/* func_ov006_021b2180: callback-dispatch family member (state 021cf140,
 * table 021cbac0): cb=table[state[0]]; if(cb){if(cb())state[1]=0; return 0;}
 * return 1. */
extern int          data_ov006_021cf020[];
extern int (*data_ov006_021cb9a0[])(void);
int func_ov006_021b2180(void) {
    int (*cb)(void) = data_ov006_021cb9a0[data_ov006_021cf020[0]];
    if (cb != 0) {
        if (cb() != 0)
            data_ov006_021cf020[1] = 0;
        return 0;
    }
    return 1;
}
