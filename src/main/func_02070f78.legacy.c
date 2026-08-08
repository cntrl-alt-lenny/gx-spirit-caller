extern char data_021a63d0[];
extern int data_0219ef1c;
extern int func_0207108c(void);

void func_02070f78(int a0, int a1, int a2) {
    char *obj = *(char **)(*(char **)(data_021a63d0 + 4) + 0xa4);
    if (obj == 0) {
        return;
    }
    if (a2 == 0x7f000001) {
        a2 = data_0219ef1c;
    }
    *(short *)(obj + 0x1a) = (short)a1;
    *(short *)(obj + 0x18) = *(unsigned short *)(obj + 0x1a);
    *(int *)(obj + 0x20) = a2;
    *(int *)(obj + 0x1c) = *(int *)(obj + 0x20);
    if (a0 != 0) {
        *(short *)(obj + 0xa) = (short)a0;
        return;
    }
    *(short *)(obj + 0xa) = (short)func_0207108c();
}
