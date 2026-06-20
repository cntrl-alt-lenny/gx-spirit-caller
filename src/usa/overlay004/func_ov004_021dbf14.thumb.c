#pragma thumb on
extern unsigned func_ov004_021dbed4(unsigned crc, unsigned char *data, int len, int arg3, int *table);
extern int data_ov004_022916d0[];
int func_ov004_021dbf14(unsigned char *data, int len) {
    return (unsigned char)(func_ov004_021dbed4(0xFFFFFFFF, data, len, 0, data_ov004_022916d0) ^ 0xFFFFFFFF);
}
