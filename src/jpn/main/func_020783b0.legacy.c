extern void func_02078c48(void *dst, void *src, int n);
extern void func_02078424(void *buf, void *src, int n);
extern char data_02101fd4[];

void func_020783b0(void *a0, void *a1) {
    unsigned int field18;
    int shifted;
    int len;

    func_02078c48(a1, (char *)a0 + 0x14, 8);

    field18 = *(unsigned int *)((char *)a0 + 0x18);
    shifted = (field18 >> 3) & 0x3f;
    if (shifted < 0x38) {
        len = 0x38 - shifted;
    } else {
        len = 0x78 - shifted;
    }
    func_02078424(a0, data_02101fd4, len);

    func_02078424(a0, a1, 8);
    func_02078c48(a1, a0, 0x14);
}
