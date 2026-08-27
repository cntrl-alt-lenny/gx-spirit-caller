extern unsigned char data_021a4794[];
extern void func_0208786c(void *entry, int param2);

void func_02087dfc(int param) {
    int i;
    char *entry = (char *)data_021a4794;
    for (i = 0; i < 0x10; i++) {
        if (*(unsigned char *)(entry + 0x2c) != 0) {
            func_0208786c(entry, param);
        }
        entry += 0x44;
    }
}
