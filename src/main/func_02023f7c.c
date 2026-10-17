typedef struct { void *h; int n; } T;
extern T data_0219a8e4;
extern T data_0219a8e4_alias;
extern void Fill32(int, void *, int);
extern void *Task_PostLocked(int, int, int);
int func_02023f7c(int a) {
    T *q = &data_0219a8e4_alias;
    int sz;
    void *h;
    Fill32(0, q, 8);
    data_0219a8e4.n = a;
    if (data_0219a8e4.h == 0) {
        sz = q->n * 0x88;
        h = Task_PostLocked(sz, 4, 0);
        q->h = h;
        Fill32(0, h, sz);
    }
    return 1;
}
