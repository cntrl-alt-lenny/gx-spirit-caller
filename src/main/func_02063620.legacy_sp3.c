struct S020643ec_A0 {
    unsigned char _pad_00[0xc];
    int f_c;
    int f_10;
    int f_14;
};

extern int func_020643ec(struct S020643ec_A0 *a0, void *a1, void *a2);

int func_02063620(struct S020643ec_A0 *a0) {
    int state = a0->f_c;
    if (state == 7) {
        return 1;
    }
    if (func_020643ec(a0, (void *)2, state == 6 ? (void *)0 : (void *)1) == 0) {
        return 0;
    } else {
        return 1;
    }
}
