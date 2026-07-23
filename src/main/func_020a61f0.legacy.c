extern void func_02093bfc(int masked, int x);
extern unsigned short data_021a9938;

void func_020a61f0(int unused, int x) {
    int masked = x & 0x3f;
    if (masked == 1) {
        data_021a9938 = 1;
        return;
    }
    func_02093bfc(masked, x);
}
