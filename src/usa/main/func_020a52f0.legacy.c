extern unsigned short data_0210260c;
extern unsigned short data_02102610;
extern unsigned short data_02102614;
extern unsigned short data_02102618;

extern int func_0209e7dc(void *fn);
extern void func_020a34e8(int cmd, int val);
extern int func_020a05bc(void *fn, unsigned short a, unsigned short b, unsigned short c, unsigned short d);
extern void func_020a4a78(void);

void func_020a52f0(void) {
    func_020a34e8(0x80, func_0209e7dc(func_020a4a78));
    func_020a34e8(0x1d, func_020a05bc(func_020a4a78, data_02102618, data_02102610, data_0210260c, data_02102614));
}
