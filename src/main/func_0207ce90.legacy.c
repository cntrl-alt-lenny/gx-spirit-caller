extern unsigned char data_021a08bc;
extern unsigned char data_021a08c0[];
extern int func_020b3870(int num, int den);

int func_0207ce90(void) {
    int sum = 0;
    int i;
    unsigned char count = data_021a08bc;
    if (count > 16) {
        for (i = 0; i < 16; i++) {
            sum += data_021a08c0[i];
        }
        sum = sum / 16;
    } else if (count != 0) {
        for (i = 0; i < count; i++) {
            sum += data_021a08c0[i];
        }
        sum = func_020b3870(sum, count);
    }
    return sum & 0xff;
}
