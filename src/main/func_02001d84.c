/* func_02001d84: write low byte of two args to two struct fields. */

void func_02001d84(void *p, int b, int c) {
    *(int *)((char *)p + 0x10) = b & 0xff;
    *(int *)((char *)p + 0x14) = c & 0xff;
}
