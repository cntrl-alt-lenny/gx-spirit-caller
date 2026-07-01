extern void Fill32(int value, void *dst, int size);
extern void *Task_PostLocked(int size, int a, int b);
extern void func_0202a944(void);

extern int data_0219a854;

int func_0202a178(void *arg) {
    int *g;
    int *raw;
    int n;
    void *h;

    g = &data_0219a854;
    Fill32(0, g, 8);
    raw = (int *)0x0219a854;
    raw[1] = (int)arg;
    if (raw[0] == 0) {
        n = g[1] * 0xec;
        h = Task_PostLocked(n, 4, 0);
        g[0] = (int)h;
        Fill32(0, h, n);
    }
    func_0202a944();
    return 1;
}
