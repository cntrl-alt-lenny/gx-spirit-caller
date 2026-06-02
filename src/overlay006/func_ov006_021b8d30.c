/* func_ov006_021b8d30: lazily initialise the shared +4 slot via a main-arm9
 * factory; return 1. */
extern int  func_02006c0c(void *p, int b, int c);
extern int  data_ov006_0224f3e0[];
extern char data_ov006_021cbf10[];
int func_ov006_021b8d30(void) {
    if (data_ov006_0224f3e0[1] == 0)
        data_ov006_0224f3e0[1] = func_02006c0c(data_ov006_021cbf10, 4, 0);
    return 1;
}
