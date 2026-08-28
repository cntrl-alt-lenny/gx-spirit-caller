extern int data_ov002_022cf09c[];
extern char data_ov002_022cf08c[];
extern unsigned int func_ov002_021afff0(unsigned int x);
extern void func_ov002_021b90f0(int *a, int *b);

void func_ov002_021ba150(int side) {
    int *arr;
    int idx = (side & 1) * 0x868;
    int count = *(int *)((char *)data_ov002_022cf09c + idx);
    int i = count - 1;
    if (i < 0) return;
    arr = (int *)(data_ov002_022cf08c + idx + 0x260);
    do {
        int j = func_ov002_021afff0(i + 1);
        func_ov002_021b90f0(&arr[i], &arr[j]);
        i--;
    } while (i >= 0);
}
