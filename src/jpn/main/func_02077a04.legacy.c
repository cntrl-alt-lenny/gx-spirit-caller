extern int data_02101dec;
extern char data_021a62f0[];
extern int func_0209172c(void *p);
extern void func_02091734(void *p, int n);

int func_02077a04(void) {
    if ((unsigned int)data_02101dec >= 0x20) {
        return -1;
    }
    void *p = *(void **)(data_021a62f0 + 4);
    int result = func_0209172c(p);
    func_02091734(p, data_02101dec);
    return result;
}
