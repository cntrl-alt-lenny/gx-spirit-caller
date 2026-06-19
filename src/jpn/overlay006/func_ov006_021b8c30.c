/* func_ov006_021b8c30: lazily initialise the shared +4 slot via a main-arm9
 * factory; return 1. */
extern int  func_02006bf0(void *p, int b, int c);
extern int  data_ov006_0224f2c0[];
extern char data_ov006_021cbdf0[];
int func_ov006_021b8c30(void) {
    if (data_ov006_0224f2c0[1] == 0)
        data_ov006_0224f2c0[1] = func_02006bf0(data_ov006_021cbdf0, 4, 0);
    return 1;
}
