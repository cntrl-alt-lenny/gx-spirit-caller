extern int data_02101ecc;
extern char data_021a63d0[];
extern int func_02091814(void *p);
extern void func_0209181c(void *p, int n);

int func_02077aec(void) {
    if ((unsigned int)data_02101ecc >= 0x20) {
        return -1;
    }
    void *p = *(void **)(data_021a63d0 + 4);
    int result = func_02091814(p);
    func_0209181c(p, data_02101ecc);
    return result;
}
