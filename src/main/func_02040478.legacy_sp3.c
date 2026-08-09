extern void *data_0219d9d4;
extern void func_02092844(void *p);
extern int func_02091ae0(void *p);
extern void func_02091d24(void *p0, void (*fn)(void), void *p2, void *p3, int a4, int a5);
extern void func_020919d8(void *p);
extern void func_0203fe78(void);

void func_02040478(void) {
    func_02092844((char *)data_0219d9d4 + 0x13d8);
    *(int *)((char *)data_0219d9d4 + 0x13f0) = 0;
    if (*(int *)((char *)data_0219d9d4 + 0x1384) != 0) {
        if (func_02091ae0((char *)data_0219d9d4 + 0x1318) == 0) {
            return;
        }
    }
    func_02091d24((char *)data_0219d9d4 + 0x1318, func_0203fe78, &data_0219d9d4, (char *)data_0219d9d4 + 0x1000, 0x1000, 0x10);
    func_020919d8((char *)data_0219d9d4 + 0x1318);
}
