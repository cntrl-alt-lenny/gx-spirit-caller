extern short data_ov006_0224f3e8[];
extern unsigned short data_ov006_0224f3e0;
int func_ov006_021b8fa8(void *unused, int index) {
    int n = data_ov006_0224f3e8[index];
    data_ov006_0224f3e0 = 1 << n;
    if (n != 0) {
        if (n != 7 && n != 1)
            data_ov006_0224f3e0 |= 0x4000;
        data_ov006_0224f3e0 |= 0x8000;
    }
    return 1;
}
