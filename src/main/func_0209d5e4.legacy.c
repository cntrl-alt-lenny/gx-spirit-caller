extern int data_021a8d20;
extern int (*data_021a8d24)(void);
extern void func_02093bfc(void);
extern void func_0209d55c(void);

void func_0209d5e4(int a0, int cmd, int a2) {
    int r;
    if ((cmd & 0x3f) == 0x11) {
        if (data_021a8d20 != 0) {
            return;
        }
        r = 1;
        data_021a8d20 = 1;
        if (data_021a8d24 != 0) {
            r = data_021a8d24();
        }
        if (r == 0) {
            return;
        }
        func_0209d55c();
        return;
    }
    func_02093bfc();
}
