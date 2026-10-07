typedef struct {
    void *base;
    int count;
} Pool;

extern Pool data_0219a8e4;
extern Pool data_0219a8e4_alias;
extern void Fill32(int v, void *dst, int size);
extern void *Task_PostLocked(int size, int align, int flags);

int func_02023f7c(int arg0) {
    Pool *a = &data_0219a8e4;

    Fill32(0, a, 8);
    data_0219a8e4_alias.count = arg0;
    if (data_0219a8e4_alias.base == 0) {
        int size = a->count * 0x88;
        void *h = Task_PostLocked(size, 4, 0);
        a->base = h;
        Fill32(0, h, size);
    }
    return 1;
}
