#pragma thumb on
int func_ov004_021dbe78(unsigned char *p0, unsigned char *p1, int count) {
    int d = 0;
    while (count-- > 0 && (d = *p0 - *p1) == 0) {
        p0++;
        p1++;
    }
    return d;
}
