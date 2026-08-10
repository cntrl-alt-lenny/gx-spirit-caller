void func_02054a30(char *src, unsigned char *dst, int len) {
    unsigned char buf[4];
    int i;

    for (i = 0; i < len; i++) {
        buf[i] = src[i];
    }
    for (; i < 3; i++) {
        buf[i] = 0;
    }

    dst[0] = (unsigned char)(buf[0] >> 2);
    dst[1] = (unsigned char)(((buf[0] & 0x3) << 4) | (buf[1] >> 4));
    dst[2] = (unsigned char)(((buf[1] & 0xf) << 2) | (buf[2] >> 6));
    dst[3] = (unsigned char)(buf[2] & 0x3f);
}
