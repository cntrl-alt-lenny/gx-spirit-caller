extern char data_ov002_022cf16c[];
extern int data_ov002_022cf17c[];
extern int data_ov002_022cf180[];
extern void func_ov002_021b91d0(int *a, int *b);

void func_ov002_021c31d4(int player) {
    int i;
    int offs = (player & 1) * 0x868;
    int a = *(int *)((char *)data_ov002_022cf17c + offs);
    int b = *(int *)((char *)data_ov002_022cf180 + offs);
    i = (a > b ? a : b) - 1;
    if (i >= 0) {
        char *base = data_ov002_022cf16c + offs;
        int *p = (int *)(base + 0x418) + i;
        int *q = (int *)(base + 0x260) + i;
        do {
            func_ov002_021b91d0(q, p);
            p--;
            q--;
        } while (--i >= 0);
    }
    *(int *)((char *)data_ov002_022cf17c + offs) = b;
    *(int *)((char *)data_ov002_022cf180 + offs) = a;
}
