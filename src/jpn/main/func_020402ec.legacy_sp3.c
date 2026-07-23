extern char *data_0219d8f4;
extern void func_02091a0c(void *p);

void func_020402ec(void) {
    if (*(int *)(data_0219d8f4 + 0x1000 + 0x384) == 0) {
        return;
    }
    func_02091a0c(data_0219d8f4 + 0x1318);
}
