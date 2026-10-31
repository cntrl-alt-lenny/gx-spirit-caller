extern char *data_0219e3ec;
extern unsigned char func_02052334(int idx);
extern void func_0204525c(int a0, int a1);
extern void func_02094688(void *src, void *dst, int n);
extern long long func_020930b0(void);

void func_02051f98(int idx, void *src, int len) {
    char *row = data_0219e3ec + idx * 0x30;
    void (*callback)(int, void *, int);
    int total;
    if (func_02052334(idx) == 2) {
        if (*(int *)(row + 0x10) + len > *(int *)(row + 8)) {
            func_0204525c(6, 0xfffe82ac);
            return;
        }
        func_02094688(src, *(char **)(row + 4) + *(int *)(row + 0x10), len);
    }
    *(int *)(row + 0x10) += len;
    total = *(int *)(row + 0x18);
    if (*(int *)(row + 0x10) == total) {
        *(unsigned char *)(row + 0x1d) = 1;
        *(int *)(row + 0x10) = 0;
        *(int *)(row + 0x18) = 0;
        callback = *(void (**)(int, void *, int))(data_0219e3ec + 0x604);
        if (callback != 0) {
            callback(idx, *(void **)(row + 4), total);
        }
    }
    if (*(int *)(data_0219e3ec + 0x608) == 0) return;
    if (*(int *)(row + 0x2c) == 0) return;
    *(long long *)(row + 0x24) = func_020930b0();
}



