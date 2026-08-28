extern int func_ov002_022a1760(void *self);
extern void func_ov002_0229a304(int a);
extern void func_ov002_022ae884(char *table, int a);

extern char data_ov002_022d0e4c[];
extern char data_ov002_022d19bc[];

void func_ov002_0229f678(void *self) {
    *(int *)((char *)self + 0x44) = 1;
    if (func_ov002_022a1760(self) != 0) {
        int v = *(int *)(data_ov002_022d0e4c + 0xd4);
        if (v < 0x10)
            v = 0x10;
        *(int *)(data_ov002_022d0e4c + 0xd4) = v;
    }
    if (*(int *)(data_ov002_022d0e4c + 0xc8) != 0) {
        func_ov002_0229a304(0);
    }
    func_ov002_022ae884(data_ov002_022d19bc, 0);
}
