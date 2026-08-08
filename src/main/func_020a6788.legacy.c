void func_020a6788(unsigned int *table, unsigned int *crcPtr, unsigned char *data, unsigned int len) {
    unsigned int crc = *crcPtr;
    unsigned int i;
    for (i = 0; i < len; i++) {
        crc = table[(crc ^ *data) & 0xff] ^ (crc >> 8);
        data++;
    }
    *crcPtr = crc;
}
