extern char data_ov004_0220b500[];
extern char data_ov004_0220f228[];
extern int func_02052cdc(void *a, void *b);

int func_ov004_021d641c(void) {
    int i;
    char *p = data_ov004_0220f228;
    char *base = data_ov004_0220b500;
    for (i = 0; i < 60; i++, p += 0x54) {
        if (func_02052cdc(base + 0x3cd4, p)) {
            return i;
        }
    }
    return -1;
}
