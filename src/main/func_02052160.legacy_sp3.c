extern void *data_0219e3ec;
extern int func_02046870(void *a);
extern void func_02094688(void *a, int b, int c);
extern long long func_020930b0(void);

void func_02052160(void *self, void *arg1, int arg2) {
    int idx = func_02046870(self);
    char *row = (char *)data_0219e3ec + idx * 0x30;
    void (*callback)(int, int, int);

    if (*(int *)(row + 0x4) == 0) {
        return;
    }
    if (*(int *)(row + 0x8) < arg2) {
        return;
    }
    func_02094688(arg1, *(int *)(row + 0x4), arg2);

    callback = *(void (**)(int, int, int))((char *)data_0219e3ec + 0x604);
    if (callback != 0) {
        callback(idx, *(int *)(row + 0x4), arg2);
    }

    if (*(int *)((char *)data_0219e3ec + 0x608) == 0) {
        return;
    }
    if (*(int *)(row + 0x2c) == 0) {
        return;
    }
    *(long long *)(row + 0x24) = func_020930b0();
}
