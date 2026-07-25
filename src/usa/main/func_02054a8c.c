extern int data_020ffaf4;

void func_02054a8c(int a0) {
    int r1;
    if (a0 != 0) {
        r1 = a0 & ~0x80000000;
    } else {
        r1 = 1;
    }
    data_020ffaf4 = r1;
}
