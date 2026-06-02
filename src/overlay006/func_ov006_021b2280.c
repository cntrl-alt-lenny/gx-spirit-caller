/* func_ov006_021b2280: callback-dispatch family member (state 021cf140,
 * table 021cbac0): cb=table[state[0]]; if(cb){if(cb())state[1]=0; return 0;}
 * return 1. */
extern int          data_ov006_021cf140[];
extern int (*data_ov006_021cbac0[])(void);
int func_ov006_021b2280(void) {
    int (*cb)(void) = data_ov006_021cbac0[data_ov006_021cf140[0]];
    if (cb != 0) {
        if (cb() != 0)
            data_ov006_021cf140[1] = 0;
        return 0;
    }
    return 1;
}
