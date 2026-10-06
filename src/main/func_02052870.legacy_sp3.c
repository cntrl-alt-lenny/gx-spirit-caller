extern int func_02046ac4(void);
extern int func_020528e4(void *a0, int a1, int a2);

unsigned int func_02052870(unsigned int mask, int a, int b) {
    unsigned char i;
    unsigned int bit;

    for (i = 0; i < 32; i++) {
        bit = (i != 0) ? (1 << i) : 1;
        if ((mask & bit) && i != func_02046ac4()) {
            if (func_020528e4((void *)i, a, b) == 0) {
                mask &= ~bit;
            }
        }
    }
    return mask;
}
