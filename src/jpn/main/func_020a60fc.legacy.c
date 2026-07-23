extern void func_02093b08(int masked, int x);
extern unsigned short data_021a9858;

void func_020a60fc(int unused, int x) {
    int masked = x & 0x3f;
    if (masked == 1) {
        data_021a9858 = 1;
        return;
    }
    func_02093b08(masked, x);
}
