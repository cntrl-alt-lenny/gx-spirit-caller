#pragma thumb on

unsigned short func_ov004_021dbd1c(int a0) {
    unsigned int byte1 = (a0 >> 8) & 0xff;
    unsigned int byte0 = (a0 << 8) & 0xff00;
    return byte1 | byte0;
}
