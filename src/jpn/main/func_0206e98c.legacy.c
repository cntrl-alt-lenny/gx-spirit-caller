extern int func_0206c5a8(void *a0, unsigned short *out0, unsigned int *out1);

int func_0206e98c(void *a0, void *dst) {
    unsigned short t0;
    unsigned int t1;
    int result = func_0206c5a8(a0, &t0, &t1);
    if (result >= 0) {
        *(unsigned short *)((char *)dst + 0x2) =
            ((t0 >> 8) & 0xff) | ((t0 << 8) & 0xff00);
        *(unsigned int *)((char *)dst + 0x4) =
            ((t1 >> 24) & 0xff) | ((t1 >> 8) & 0xff00)
            | ((t1 << 8) & 0xff0000) | ((t1 << 24) & 0xff000000);
    }
    return result;
}
