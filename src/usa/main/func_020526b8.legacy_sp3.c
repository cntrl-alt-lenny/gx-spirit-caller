extern void func_02094688(void *a, void *b, int n);
extern int func_020a734c(void *a, void *b, int n);
extern short data_020ff9b8;

int func_020526b8(void *self) {
    char buf[12];
    func_02094688(self, buf, 8);
    if (func_020a734c(buf + 6, &data_020ff9b8, 2) == 0) {
        return *(unsigned short *)(buf + 4);
    }
    return 0;
}
