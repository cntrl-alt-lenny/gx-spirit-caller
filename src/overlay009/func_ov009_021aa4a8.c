extern void func_02094504(int a, void *b, int c);
extern void *func_0208e200(void);
extern void *func_0208e1ac(void);
extern void func_02005ee0(void);
extern int func_ov009_021aacc4(int *, int, int);
extern char data_ov009_021adbcc[];
extern unsigned int data_02104f4c[];
extern unsigned int data_ov009_021adc54[];
int func_ov009_021aa4a8(int *o, unsigned int mode) {
    func_02094504(0, data_ov009_021adbcc, 0x28);
    func_02094504(0, func_0208e200(), 0x400);
    func_02094504(0, func_0208e1ac(), 0x400);
    o[0] = 0;
    o[6] = 0;
    switch (mode) {
    case 0:
        if (data_02104f4c[0x298] >= data_ov009_021adc54[0]) {
            func_ov009_021aacc4(o, 1, 9);
        } else {
            func_ov009_021aacc4(o, 0, 10);
            o[6] = 1;
        }
        break;
    case 1:
        func_ov009_021aacc4(o, 0, 11);
        break;
    case 2:
        func_ov009_021aacc4(o, 2, 2);
        break;
    case 3:
        func_ov009_021aacc4(o, 0, 12);
        break;
    }
    func_02005ee0();
    return 1;
}
