extern int func_02046ac4(void);
extern int func_02052b0c(int a, int b, int c);

unsigned int func_02052974(unsigned int mask, int a, int b) {
    unsigned char i;
    unsigned int bit;

    for (i = 0; i < 32; i++) {
        bit = (i != 0) ? (1 << i) : 1;
        if ((mask & bit) && i != func_02046ac4()) {
            if (func_02052b0c(i, a, b) == 0) {
                mask &= ~bit;
            }
        }
    }
    return mask;
}
