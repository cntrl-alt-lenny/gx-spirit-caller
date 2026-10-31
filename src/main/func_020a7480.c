void func_020a7480(unsigned char *dst, int value, unsigned int size)
{
    unsigned int word = (unsigned char)value;
    unsigned int count;
    if (size >= 32) {
        count = -(unsigned int)dst & 3;
        if (count) {
            size -= count;
            do {
                *dst++ = (unsigned char)word;
            } while (--count);
        }
        if (word) {
            unsigned int upper = word << 24;
            upper |= word << 16;
            upper |= word << 8;
            word |= upper;
        }
        count = size >> 5;
        if (count) {
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
            } while (--count);
        }
        count = (size & 31) >> 2;
        if (count) {
            do {
                *(unsigned int *)dst = word;
                dst += 4;
            } while (--count);
        }
        size &= 3;
    }
    if (size) {
        do {
            *dst++ = (unsigned char)word;
        } while (--size);
    }
}

