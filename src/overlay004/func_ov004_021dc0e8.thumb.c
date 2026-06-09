#pragma thumb on
extern void func_ov004_021dc0ac(int a, int *b);
int func_ov004_021dc0e8(unsigned int crc, unsigned char *data, int len, int arg3, int *table) {
    int i;
    if (arg3 == 0) func_ov004_021dc0ac(arg3, table);
    for (i = 0; i < len; i++)
        crc = (crc >> 8) ^ table[(crc ^ data[i]) & 0xff];
    return crc;
}
