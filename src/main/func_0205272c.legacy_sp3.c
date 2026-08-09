extern void func_02094688(void *a, void *b, int n);
extern int func_020a7440(void *a, void *b, int n);
extern short data_020ffa98;

int func_0205272c(void *self) {
    char buf[12];
    func_02094688(self, buf, 8);
    if (func_020a7440(buf + 6, &data_020ffa98, 2) == 0) {
        return *(unsigned short *)(buf + 4);
    }
    return 0;
}
