typedef struct { char *base; int n; } T;
extern T data_0219a8e4;
extern T data_0219a8e4_alias;
extern void Fill32(int, void *, int);
extern void func_02024368(void *);
void *func_02024024(int a) {
    T *q;
    int i; char *p; int cnt; int off; char *b;
    cnt = data_0219a8e4.n;
    q = &data_0219a8e4_alias;
    i = 0;
    if (cnt > 0) {
        p = q->base;
        do {
            if (*(int *)p == 0) break;
            i++;
            p += 0x88;
        } while (i < cnt);
    }
    if (i >= cnt) return 0;
    off = i * 0x88;
    b = q->base;
    Fill32(0, b + off, 0x88);
    *(int *)(b + off) = a;
    func_02024368(b + off);
    return b + off;
}
