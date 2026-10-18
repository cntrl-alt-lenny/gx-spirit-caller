extern int func_ov002_021b34f4(int a, int b, int c, int d);
extern void func_ov002_021d479c(unsigned short a, unsigned short b, unsigned short c, unsigned short d);

void func_ov002_021d5ab4(int arg0, int arg1, int arg2, int arg3) {
    unsigned short v = (unsigned short)arg2;
    if (func_ov002_021b34f4(arg0, arg1, arg2 & 0xff, (v >> 8) & 0xff) == 0) {
        return;
    }
    func_ov002_021d479c((unsigned short)((arg0 != 0 ? 0x8000 : 0) | 0x37),
                        (unsigned short)((arg1 & 0xff) | 0xa00),
                        (unsigned short)arg2, (unsigned short)arg3);
}
