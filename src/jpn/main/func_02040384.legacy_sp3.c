extern void *data_0219d8f4;
extern void func_020926d0(void *p);
extern void func_02092660(void *p);
extern void func_02041e50(void);
extern void func_02091a0c(void *p);

void func_02040384(void) {
    if (data_0219d8f4 == 0) {
        return;
    }
    func_020926d0((char *)data_0219d8f4 + 0x13d8);
    *(int *)((char *)data_0219d8f4 + 0x13f0) = 1;
    func_02092660((char *)data_0219d8f4 + 0x13d8);
    if (*(int *)((char *)data_0219d8f4 + 0x1314) != 0) {
        func_02041e50();
    }
    if (*(int *)((char *)data_0219d8f4 + 0x1384) != 0) {
        func_02091a0c((char *)data_0219d8f4 + 0x1318);
    }
}
