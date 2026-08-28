extern void *data_0219d8f4;
extern void func_0209275c(void *p);
extern int func_020919f8(void *p);
extern void func_02091c3c(void *p0, void (*fn)(void), void *p2, void *p3, int a4, int a5);
extern void func_020918f0(void *p);
extern void func_0203fe28(void);

void func_02040428(void) {
    func_0209275c((char *)data_0219d8f4 + 0x13d8);
    *(int *)((char *)data_0219d8f4 + 0x13f0) = 0;
    if (*(int *)((char *)data_0219d8f4 + 0x1384) != 0) {
        if (func_020919f8((char *)data_0219d8f4 + 0x1318) == 0) {
            return;
        }
    }
    func_02091c3c((char *)data_0219d8f4 + 0x1318, func_0203fe28, &data_0219d8f4, (char *)data_0219d8f4 + 0x1000, 0x1000, 0x10);
    func_020918f0((char *)data_0219d8f4 + 0x1318);
}
