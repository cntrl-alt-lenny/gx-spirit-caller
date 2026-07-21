#pragma thumb on

unsigned int func_ov004_021dd628(unsigned int a0, unsigned int a1) {
    unsigned int ab = a0 & a1;
    unsigned int notb = ~a1;
    unsigned int anotb = a0 & ~a1;
    unsigned int x = ab | (anotb + 1);
    unsigned int y = ab | notb;
    if (x < y) {
        return x;
    }
    return ab | 1;
}
