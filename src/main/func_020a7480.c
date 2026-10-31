void func_020a7480(unsigned char *dst, int value, unsigned int count) {
    unsigned int word = (unsigned char)value;
    unsigned int n;
    if (count >= 32) {
        n = -(unsigned int)dst & 3;
        if (n != 0) {
            count -= n;
            do {
                *dst++ = (unsigned char)word;
            } while (--n != 0);
        }
        if (word != 0) {
            word |= (word << 24) | (word << 16) | (word << 8);
        }
        n = count >> 5;
        if (n != 0) {
            do {
                ((unsigned int *)dst)[0] = word;
                ((unsigned int *)dst)[1] = word;
                ((unsigned int *)dst)[2] = word;
                ((unsigned int *)dst)[3] = word;
                ((unsigned int *)dst)[4] = word;
                ((unsigned int *)dst)[5] = word;
                ((unsigned int *)dst)[6] = word;
                ((unsigned int *)dst)[7] = word;
                dst += 32;
            } while (--n != 0);
        }
        n = (count & 31) >> 2;
        if (n != 0) {
            do {
                *(unsigned int *)dst = word;
                dst += 4;
            } while (--n != 0);
        }
        count &= 3;
    }
    if (count != 0) {
        do {
            *dst++ = (unsigned char)word;
        } while (--count != 0);
    }
}

