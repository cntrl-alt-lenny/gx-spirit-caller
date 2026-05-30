/* func_ov006_021b2b08: cf140-guard (brief 270 8/8). gotcha 1 return r. */
extern int func_ov005_021acfb0(void);
extern int data_ov006_021cf140;
int func_ov006_021b2b08(void) {
    int r = func_ov005_021acfb0();
    if (r) data_ov006_021cf140 = 9;
    return r;
}
