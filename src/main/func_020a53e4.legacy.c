extern unsigned short data_021026ec;
extern unsigned short data_021026f0;
extern unsigned short data_021026f4;
extern unsigned short data_021026f8;

extern int func_0209e8d0(void *fn);
extern void func_020a35dc(int cmd, int val);
extern int func_020a06b0(void *fn, unsigned short a, unsigned short b, unsigned short c, unsigned short d);
extern void func_020a4b6c(void);

void func_020a53e4(void) {
    func_020a35dc(0x80, func_0209e8d0(func_020a4b6c));
    func_020a35dc(0x1d, func_020a06b0(func_020a4b6c, data_021026f8, data_021026f0, data_021026ec, data_021026f4));
}
