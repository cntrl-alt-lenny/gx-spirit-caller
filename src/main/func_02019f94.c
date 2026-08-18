extern char *GetSystemWork(void);
extern void func_02019ce0(int i, void *buf);
extern int func_02019ea4(int i);
extern int func_0201a170(int a);
extern int func_02019604(int i);

extern signed char data_020b5b80[];

int func_02019f94(int i) {
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
    func_02019ce0(i, buf);
    mask = func_02019ea4(i);

    for (bit = 1, j = r4; j < 2; j++, bit <<= 1) {
        if (mask & bit) {
            if (buf[j] >= 0x11) {
                r4 = func_0201a170(0xe);
            } else {
                r4 = func_0201a170(0xf);
            }
            break;
        }
    }

    entry = data_020b5b80 + i * 7;
    q = func_02019604(i) / 10;
    field6 = entry[6];
    return q + field6 + r4;
}
