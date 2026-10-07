extern unsigned short data_021a66f0;
extern void func_02096228(void *);
extern int func_0209640c(int, int);
extern void func_02096434(int, int);
extern void func_020938f8(int, unsigned int);
void func_0209393c(void) {
    if (data_021a66f0) return;
    data_021a66f0 = 1;
    func_02096228(&data_021a66f0);
    while (!func_0209640c(12, 1)) {}
    func_02096434(12, (int)func_020938f8);
}
