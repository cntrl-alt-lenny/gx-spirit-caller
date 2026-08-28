extern char data_021a62f0[];
extern int data_0219ee3c;
extern int func_02070fa4(void);

void func_02070e90(int a0, int a1, int a2) {
    char *obj = *(char **)(*(char **)(data_021a62f0 + 4) + 0xa4);
    if (obj == 0) {
        return;
    }
    if (a2 == 0x7f000001) {
        a2 = data_0219ee3c;
    }
    *(short *)(obj + 0x1a) = (short)a1;
    *(short *)(obj + 0x18) = *(unsigned short *)(obj + 0x1a);
    *(int *)(obj + 0x20) = a2;
    *(int *)(obj + 0x1c) = *(int *)(obj + 0x20);
    if (a0 != 0) {
        *(short *)(obj + 0xa) = (short)a0;
        return;
    }
    *(short *)(obj + 0xa) = (short)func_02070fa4();
}
