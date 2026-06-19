/* func_ov006_021b8c6c: if the shared +4 slot is set, hand it to a main-arm9
 * sink and clear it; always return 1. */
extern int  data_ov006_0224f2c0[];
extern void func_02006e00(int);
int func_ov006_021b8c6c(void) {
    if (data_ov006_0224f2c0[1] != 0) {
        func_02006e00(data_ov006_0224f2c0[1]);
        data_ov006_0224f2c0[1] = 0;
    }
    return 1;
}
