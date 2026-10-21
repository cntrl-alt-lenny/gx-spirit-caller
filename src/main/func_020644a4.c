unsigned int func_020644a4(unsigned char *data, int offset) {
    unsigned short high = (data[offset] << 8) & 0xff00;
    return high | data[offset + 1];
}
