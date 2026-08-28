extern char *GetSystemWork(void);
extern void func_02019cac(int i, void *buf);
extern int func_02019e70(int i);
extern int func_0201a13c(int a);
extern int func_020195d0(int i);

extern signed char data_020b5a8c[];

int func_02019f60(int i) {
    unsigned char buf[4];
    int mask;
    int j;
    int bit;
    int r4;
    int q;
    signed char *entry;
    signed char field6;

    (void)GetSystemWork();
    r4 = 0;
    func_02019cac(i, buf);
    mask = func_02019e70(i);

    for (bit = 1, j = r4; j < 2; j++, bit <<= 1) {
        if (mask & bit) {
            if (buf[j] >= 0x11) {
                r4 = func_0201a13c(0xe);
            } else {
                r4 = func_0201a13c(0xf);
            }
            break;
        }
    }

    entry = data_020b5a8c + i * 7;
    q = func_020195d0(i) / 10;
    field6 = entry[6];
    return q + field6 + r4;
}
