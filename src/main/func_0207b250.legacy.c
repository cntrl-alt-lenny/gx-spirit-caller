extern unsigned char *data_021a088c;
extern unsigned char data_020bee6c[];
extern unsigned int func_0207b548(unsigned int flags);
extern unsigned short func_0207b18c(int x);
extern unsigned short func_0209e308(void);
extern void func_02094688(const void *src, void *dst, unsigned int size);

void func_0207b250(const void *a, const unsigned char *b, unsigned int flags)
{
    int n;
    unsigned short v;
    func_0207b548(flags);
    *(void **)(data_021a088c + 0x2288) = data_021a088c + 0x1500;
    *(unsigned short *)(data_021a088c + 0x228c) = 0x400;
    *(unsigned short *)(data_021a088c + 0x228e) = (1 << func_0207b18c(0)) >> 1;
    v = *(unsigned short *)(data_021a088c + 0x2268);
    if (v == 0) v = func_0209e308();
    *(unsigned short *)(data_021a088c + 0x2290) = v;
    *(unsigned short *)(data_021a088c + 0x2298) = (*(unsigned int *)(data_021a088c + 0x2264) & 0x300000) != 0x300000;
    if (a == 0) {
        func_02094688(data_020bee6c + 0x10, data_021a088c + 0x2292, 6);
    } else {
        func_02094688(a, data_021a088c + 0x2292, 6);
    }
    if (b == 0 || b == data_020bee6c + 0x18) {
        func_02094688(data_020bee6c + 0x18, data_021a088c + 0x229c, 0x20);
        *(unsigned short *)(data_021a088c + 0x229a) = 0;
    } else {
        func_02094688(b, data_021a088c + 0x229c, 0x20);
        n = 0;
        do {
            if (*b == 0) break;
            n++;
            b++;
        } while (n < 0x20);
        *(unsigned short *)(data_021a088c + 0x229a) = n;
    }
    *(int *)(data_021a088c + 0x2284) = 0;
}

