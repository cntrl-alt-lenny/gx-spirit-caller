extern int func_ov002_022a1870(void *self);
extern void func_ov002_0229a414(int a);
extern void func_ov002_022ae9c0(char *table, int a);

extern char data_ov002_022d0f2c[];
extern char data_ov002_022d1a9c[];

void func_ov002_0229f788(void *self) {
    *(int *)((char *)self + 0x44) = 1;
    if (func_ov002_022a1870(self) != 0) {
        int v = *(int *)(data_ov002_022d0f2c + 0xd4);
        if (v < 0x10)
            v = 0x10;
        *(int *)(data_ov002_022d0f2c + 0xd4) = v;
    }
    if (*(int *)(data_ov002_022d0f2c + 0xc8) != 0) {
        func_ov002_0229a414(0);
    }
    func_ov002_022ae9c0(data_ov002_022d1a9c, 0);
}
