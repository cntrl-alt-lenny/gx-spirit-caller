extern unsigned char data_021a4874[];
extern void func_02087954(void *entry, int param2);

void func_02087ee4(int param) {
    int i;
    char *entry = (char *)data_021a4874;
    for (i = 0; i < 0x10; i++) {
        if (*(unsigned char *)(entry + 0x2c) != 0) {
            func_02087954(entry, param);
        }
        entry += 0x44;
    }
}
