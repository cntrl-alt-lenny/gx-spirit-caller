extern void *func_020498f0(void);

void func_0204f9cc(void) {
    int count = -1;
    int i;
    for (i = 0; i < 32; i++) {
        if ((1 << i) & *(int *)((char *)func_020498f0() + 0x2f0)) {
            count++;
        }
    }
    if (count == -1) {
        *((unsigned char *)func_020498f0() + 0xe) = 0;
    } else {
        *((unsigned char *)func_020498f0() + 0xe) = count;
    }
}
