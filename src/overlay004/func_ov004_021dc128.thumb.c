#pragma thumb on
extern unsigned func_ov004_021dc0e8(unsigned crc, unsigned char *data, int len, int arg3, int *table);
extern int data_ov004_02291930[];
int func_ov004_021dc128(unsigned char *data, int len) {
    return (unsigned char)(func_ov004_021dc0e8(0xFFFFFFFF, data, len, 0, data_ov004_02291930) ^ 0xFFFFFFFF);
}
