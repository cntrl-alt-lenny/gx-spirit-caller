/* func_ov006_021b8d6c: if the shared +4 slot is set, hand it to a main-arm9
 * sink and clear it; always return 1. */
extern int  data_ov006_0224f3e0[];
extern void func_02006e1c(int);
int func_ov006_021b8d6c(void) {
    if (data_ov006_0224f3e0[1] != 0) {
        func_02006e1c(data_ov006_0224f3e0[1]);
        data_ov006_0224f3e0[1] = 0;
    }
    return 1;
}
