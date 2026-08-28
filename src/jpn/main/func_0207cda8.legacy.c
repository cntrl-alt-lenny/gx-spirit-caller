extern unsigned char data_021a07dc;
extern unsigned char data_021a07e0[];
extern int func_020b377c(int num, int den);

int func_0207cda8(void) {
    int sum = 0;
    int i;
    unsigned char count = data_021a07dc;
    if (count > 16) {
        for (i = 0; i < 16; i++) {
            sum += data_021a07e0[i];
        }
        sum = sum / 16;
    } else if (count != 0) {
        for (i = 0; i < count; i++) {
            sum += data_021a07e0[i];
        }
        sum = func_020b377c(sum, count);
    }
    return sum & 0xff;
}
