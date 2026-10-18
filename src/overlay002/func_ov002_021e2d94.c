extern int data_ov002_022cf1ac[];
extern void func_ov002_021c9b80(int a, int b, int c, int d);
extern void func_ov002_021d479c(unsigned short a, unsigned short b, unsigned short c, unsigned short d);

void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3) {
    if (arg3 != ((*(unsigned int *)((char *)data_ov002_022cf1ac + (arg0 & 1) * 0x868 + arg1 * 20) >> arg2) & 1)) {
        func_ov002_021c9b80(arg0, arg1, arg2, arg3);
        func_ov002_021d479c((unsigned short)((arg0 != 0 ? 0x8000 : 0) | 0x2a), arg1, arg2, arg3);
    }
}
