extern int func_02054bbc(int a, unsigned char *b, int *c);

int func_02065ca4(int a) {
    struct {
        int buf[2];
        int local2;
    } frame;
    frame.local2 = 8;
    if (func_02054bbc(a, (unsigned char *)frame.buf, &frame.local2) == -1) {
        return 0;
    }
    return *(unsigned short *)((char *)frame.buf + 2);
}
