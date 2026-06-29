extern int  data_02104acc;
extern void func_020221e0(int a, int b);
extern int  func_020221f8(int a);
extern void func_0202cc38(int mode);
extern int  func_0202cc50(int a);
extern int  func_0202cda4(void);
extern void func_0202cdd0(void);
extern void func_0202d94c(void);

int func_ov006_021c688c(char *base) {
    if (*(int *)(base + 0x8)) {
        if (*(int *)(base + 0x14)) {
            int mode;
            if (*(int *)(base + 0xc)) mode = 1;
            else if (*(int *)(base + 0x10)) mode = 2;
            else mode = 0;
            func_0202cc38(mode);
            *(int *)(base + 0x14) = 0;
        }
        func_0202cc50(*(int *)(base + 0x4));
        if (func_0202cda4()) {
            if (*(unsigned short *)((char *)&data_02104acc + 0x54) & 0x800)
                func_0202cdd0();
        }
        func_0202d94c();
        {
            int r = func_020221f8(0);
            int v;
            if (*(int *)(base + 0x10)) v = r | 4;
            else v = r & ~4;
            func_020221e0(0, v);
        }
    }
    return 0;
}
