extern unsigned char data_ov002_022ce950[];
extern unsigned char data_ov002_022cf1a8[];
extern int func_ov002_0229ade0(int a, int b, int c, int d);
void func_ov002_021cd6f4(void) {
    int f = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int t = *(unsigned short *)(data_ov002_022ce950 + 2);
    int v = *(unsigned short *)(data_ov002_022ce950 + 4);
    int u = *(unsigned short *)(data_ov002_022ce950 + 6);
    int a = (unsigned char)t;
    int b = (unsigned char)(t >> 8);
    unsigned int value = v | (u << 16);
    if (b) {
        *(unsigned int *)(data_ov002_022cf1a8 + (f & 1) * 0x868 + a * 0x14) += value;
    } else {
        *(unsigned int *)(data_ov002_022cf1a8 + (f & 1) * 0x868 + a * 0x14) = value;
    }
    func_ov002_0229ade0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
