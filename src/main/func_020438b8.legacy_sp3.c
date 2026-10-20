extern void func_020945f4(void *, int, unsigned int);
extern void func_02094688(const void *, void *, unsigned int);
extern signed char *data_020fec48;
int func_020438b8(const unsigned char *src, unsigned int len, char *dst, unsigned int capacity) {
    unsigned int size = (len % 3 ? 4 : 0) + len / 3 * 4;
    int n;
    int count;
    const unsigned char *end;
    char *out;
    unsigned char buf[3];
    if (dst == 0) return size;
    if (capacity < size) return -1;
    end = src + len;
    out = dst;
    while (src != end) {
        n = end - src;
        int bits = n * 8;
        count = bits / 6 + (bits % 6 ? 1 : 0);
        if (n >= 3) n = 3;
        func_020945f4(buf, 0, 3);
        func_02094688(src, buf, n);
        out[0] = data_020fec48[buf[0] >> 2];
        if (count < 2) out[1] = 0x2a;
        else out[1] = data_020fec48[((buf[0] << 4) & 0x3f) | (buf[1] >> 4)];
        if (count < 3) out[2] = 0x2a;
        else out[2] = data_020fec48[((buf[1] << 2) & 0x3f) | (buf[2] >> 6)];
        if (count < 4) out[3] = 0x2a;
        else out[3] = data_020fec48[buf[2] & 0x3f];
        src += n;
        out += 4;
    }
    return out - dst;
}

