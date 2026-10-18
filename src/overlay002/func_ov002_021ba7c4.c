extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern void func_ov002_021b91d0(int *a, int *b);

void func_ov002_021ba7c4(int idx)
{
    int off = (idx & 1) * 0x868;
    int i = 0;
    int n = *(int *)(data_ov002_022cf17c + off);
    int half = n / 2;
    int *base;
    int *p;

    if (half > 0) {
        p = (int *)(data_ov002_022cf16c + off + 0x260);
        base = p;
        do {
            func_ov002_021b91d0(p, base + (n - 1 - i));
            i++;
            p++;
        } while (i < half);
    }
}
