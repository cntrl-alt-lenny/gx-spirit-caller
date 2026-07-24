extern void *data_0219d8f4;
extern void func_020926d0(void *);
extern void func_02092660(void *);

void func_0203f728(int a) {
    func_020926d0((char *)data_0219d8f4 + 0x13d8);
    *(int *)((char *)data_0219d8f4 + 0x1000 + 4) = a;
    func_02092660((char *)data_0219d8f4 + 0x13d8);
}
