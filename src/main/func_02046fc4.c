extern char *data_0219daec;
extern int func_02045280(void);
extern void func_020466f4(int arg);
extern void func_020463dc(void *arg0, void *arg1);
extern void func_0204937c(int unused0, int unused1, int p2, int p3, int p4, int p5, int p6, int p7);

int func_02046fc4(int unused, int a1, int a2, int a3, int a4, int a5, int a6) {
    if (func_02045280() != 0 || *(int *)(data_0219daec + 0x24) < 3 || *(int *)(data_0219daec + 0x24) == 4) {
        return 0;
    }
    *(int *)(data_0219daec + 0x78) = a1;
    *(int *)(data_0219daec + 0x7c) = a2;
    func_020466f4(4);
    func_0204937c((int)(data_0219daec + 0xe0), (int)(data_0219daec + 0x1e0), (int)func_020463dc, 0, a3, a4, a5, a6);
    return 1;
}
