int func_0206e33c(void *self) {
    int result;
    void *p;
    p = *(void **)((char *)self + 0x64);
    result = 0;
    if (p != 0) {
        signed char mode = *(signed char *)((char *)self + 0x73);
        if (mode == 1) {
            void *q = *(void **)((char *)p + 0x104);
            if (q != 0) {
                result = *(unsigned short *)((char *)q + 4);
            }
        } else if (mode == 0 || mode == 4) {
            result = *(int *)((char *)self + 0x44) - *(int *)((char *)p + 0xf8);
        }
    }
    return result;
}
