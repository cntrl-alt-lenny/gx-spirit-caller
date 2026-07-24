extern int func_0203c888(void);
extern void func_0203c900(int);
extern int func_0203d888(void);
extern int func_0203d9c4(void);

int func_0203dae0(void) {
    int v = func_0203c888();
    func_0203c900(0x10);
    switch (v) {
        case 7:
            v = func_0203d9c4();
            break;
        case 8:
            v = func_0203d888();
            break;
    }
    return v;
}
