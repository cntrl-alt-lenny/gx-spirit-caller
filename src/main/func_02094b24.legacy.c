extern unsigned int func_02094a20(unsigned char *start, unsigned char *src, unsigned int size, unsigned short *offset);

unsigned int func_02094b24(unsigned char *src, unsigned int size, unsigned char *dst) {
    unsigned char *start = src;
    unsigned int count = 4;
    unsigned short offset;
    unsigned char flags;
    unsigned char i;
    unsigned int limit = size;
    unsigned char *flagptr;
    unsigned int length;
    *(unsigned int *)dst = (size << 8) | 0x10;
    dst += 4;
    while (size != 0) {
        flags = 0;
        flagptr = dst++;
        count++;
        for (i = 0; i < 8; i++) {
            flags <<= 1;
            if (size != 0) {
                length = func_02094a20(start, src, size, &offset);
                if (length != 0) {
                    flags |= 1;
                    count += 2;
                    if (count >= limit) return 0;
                    *dst++ = ((length - 3) << 4) | ((offset - 1) >> 8);
                    *dst++ = offset - 1;
                    src += length;
                    size -= length;
                } else {
                    count++;
                    if (count >= limit) return 0;
                    *dst++ = *src++;
                    size--;
                }
            }
        }
        *flagptr = flags;
    }
    i = 0;
    while ((count + i) & 3) {
        *dst++ = 0;
        i++;
    }
    return count;
}

