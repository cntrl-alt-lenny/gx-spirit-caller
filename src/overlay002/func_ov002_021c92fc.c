extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021c8e38(int a, int b, int *out);
extern int func_ov002_021b9ecc(int a, int b);

unsigned int func_ov002_021c92fc(unsigned int a, unsigned int b)
{
    int out;
    int r4 = func_ov002_021c8e38(a, b, &out);
    if (out == 0) {
        int v = func_ov002_021b9ecc(a, b);
        if (v == 0x18c7 || v == 0x19ef) {
            unsigned int x = *(unsigned int *)(data_ov002_022cf1ac + (a & 1) * 0x868 + b * 0x14);
            unsigned int h = *(unsigned short *)(data_ov002_022cf1a4 + (a & 1) * 0x868 + b * 0x14);
            if ((h & ~((x >> 6) & 1)) & ~(((x >> 1) | (x >> 2)) & 1)) {
                return (1 << r4) | 0x78;
            }
        }
    }
    return 1 << r4;
}
