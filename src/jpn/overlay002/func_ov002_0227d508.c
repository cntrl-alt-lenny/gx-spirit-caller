extern int func_ov002_0227d4ec(int arg0, int outer, int inner, int arg1);

unsigned int func_ov002_0227d508(int arg0, int arg1) {
    unsigned int acc = 0;
    int outer = 0;
    int inner = 0;
    for (; outer < 2; outer++) {
        for (inner = 0; inner <= 4; inner++) {
            if (func_ov002_0227d4ec(arg0, outer, inner, arg1) != 0) {
                acc |= 1u << (inner + outer * 16);
            }
        }
    }
    return acc;
}
