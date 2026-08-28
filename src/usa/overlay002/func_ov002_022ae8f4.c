extern char data_ov002_022d0e4c[];
extern int func_020371b8(int a, int b, int c, int d);
extern void func_ov002_022ae2d8(int *arr, int idx, int v);

int func_ov002_022ae8f4(void *self, int arg1) {
    int count;
    int idx;

    count = *(int *)((char *)self + 0x3c);
    if (count <= 0)
        return count;

    *(int *)(data_ov002_022d0e4c + 0xd0) = 1;
    {
        int d4val = *(int *)(data_ov002_022d0e4c + 0xd4);
        if (d4val < 6)
            d4val = 6;
        *(int *)(data_ov002_022d0e4c + 0xd4) = d4val;
    }
    func_020371b8(0x3a, 0x3a - 0x3b, 0, 1);

    *(int *)((char *)self + 0x2c) = arg1 - 1;
    *(int *)((char *)self + 0x28) = 4;
    *(int *)((char *)self + 0x30) = 2;

    idx = 0;
    count = *(int *)((char *)self + 0x3c);
    if (count <= 0)
        return count;

    do {
        func_ov002_022ae2d8((int *)self, idx, ((int *)((char *)self + 0x1c))[idx]);
        count = *(int *)((char *)self + 0x3c);
        idx++;
    } while (idx < count);
    return count;
}
