/* func_ov006_021b2c9c: cf140-guard. gotcha 1 return r. */
extern int func_ov005_021acfb0(void);
extern int data_ov006_021cf140;
int func_ov006_021b2c9c(void) {
    int r = func_ov005_021acfb0();
    if (r) data_ov006_021cf140 = 12;
    return r;
}
