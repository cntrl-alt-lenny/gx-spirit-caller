struct P { unsigned int flags; char pad[0x868 - 4]; };
extern struct P data_ov002_022cf288[];
extern void func_ov002_021c9b2c(int a, int b, int c);
extern void func_ov002_021d479c(unsigned short a, unsigned short b, unsigned short c, unsigned short d);

void func_ov002_021e2d20(int arg0, int arg1, int arg2) {
    if (arg2 != ((data_ov002_022cf288[arg0 & 1].flags >> arg1) & 1)) {
        func_ov002_021c9b2c(arg0, arg1, arg2);
        func_ov002_021d479c((unsigned short)((arg0 != 0 ? 0x8000 : 0) | 0x22), arg1, arg2, 0);
    }
}
