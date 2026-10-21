extern unsigned int func_ov002_0227d5f8(int arg0, int arg1);
extern int func_ov002_0227d684(int a, int b, int c);
extern int func_ov002_0227d850(int a, int b, int c);
extern void func_ov002_021c4c9c(int a, int b, int *out);
extern int func_0202b8f0(int unused0);

int func_ov002_0227d6f8(int a, int card, int mode, int count, unsigned short *list) {
    int stats[11];
    int flag = mode == 0;
    unsigned int mask = func_ov002_0227d5f8(a, flag);
    int i;
    int result;
    for (i = 0; i < count; i++) {
        int packed = list[i];
        mask &= ~(1 << ((unsigned char)(packed >> 8) + (unsigned char)packed * 16));
    }
    result = func_ov002_0227d684(a, flag, mask);
    if (result != -1) return result;
    result = func_ov002_0227d850(a, flag, mask);
    if (result != -1) {
        func_ov002_021c4c9c((unsigned char)result, (unsigned char)((unsigned short)result >> 8), stats);
        if (card == 0x1388 || card == 0x1654 || card == 0x1688) {
            if (stats[7] > 0) return result;
        }
        if (stats[4] < 6) {
            if (func_0202b8f0(card) > stats[5]) return result;
        }
    }
    return -1;
}
