typedef struct {
    unsigned int f_0;
    unsigned int f_4;
} Dims02001e94;

void func_02001e94(Dims02001e94 *p, unsigned short *dst, int val, int shift) {
    unsigned int outer;
    unsigned int j;

    for (outer = 0; outer < p->f_4; outer++) {
        for (j = 0; j < p->f_0; j++) {
            *dst++ = (unsigned short)(val | (shift << 12));
            val++;
        }
        dst += 0x20 - p->f_0;
    }
}
